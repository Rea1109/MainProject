package com.buyedu.restcontroller.user;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Connect;
import com.buyedu.domain.Sms;
import com.buyedu.domain.User;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.user.UserService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.api.SenderID;

@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AcademyService academyService;
	
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	
	// naver 로그아웃
	@GetMapping("json/naver/logout/{token}") 
	public String test(@PathVariable String token) {
		System.out.println(token);
		
		String uri = "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=vqx5V5ejE6mgkpcPu2vP&client_secret=YjzvVMUZRW&service_provider=NAVER&access_token="+token;
		//서버간 통신
		RestTemplate rest= new RestTemplate();
		Map<String, Object> s = rest.getForObject(uri, Map.class);
		
	    return "success";
	}
	
	//회원가입창 이메일 중복확인
	@GetMapping("json/checkEmail/{email}")
	public Map checkEmail(	@PathVariable String email ) throws Exception{
	
		int result2 = userService.checkEmail(email);
		Integer result = new Integer(result2);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("result", result);
			
		return map;
	}
	
	// 비번 변경창에서 원래 비번 확인
	@PostMapping ("json/checkPassword")
	public Map checkPassword(@RequestBody Map<String, String> map ) throws Exception{
			
		String email = map.get("email");
		String password = map.get("password");
		User dbUser = userService.getUser(email);
		String result="";
		
		if ( dbUser.getPassword().equals(password) ) {
			result = "ok";
		}else {
			result = "no";
		}
		
		Map<String, String> map2 = new HashMap<String, String>();
		
		map2.put("result", result);
		
		return map2;
		}
	
	// 이메일 찾기
	@PostMapping ("json/findEmail")
	public Map findEmail(@RequestBody Map<String, String> map ) throws Exception{
			
		String name = map.get("name");
		String phone = map.get("phone");
		
		User user = new User();
		user.setName(name);
		user.setPhone(phone);
		User dbUser = userService.findEmail(user);
		Map<String, String> map1 = new HashMap<String, String>();
		
		String message="";
		String dbEmail="";
		
		if( dbUser == null) {
			message = "no";
			map1.put("message", message);
		}else {
			message = "ok";
			dbEmail = dbUser.getEmail();
			map1.put("message", message);
			map1.put("dbEmail", dbEmail);
		}
		
		return map1;
		}
	
	// 비밀번호 찾기
	@PostMapping ("json/findPassword")
	public Map findPassword(@RequestBody Map<String, String> map ) throws Exception{
			
		String name = map.get("name");
		String phone = map.get("phone");
		String email = map.get("email");
		
		User user = new User();
		user.setName(name);
		user.setPhone(phone);
		user.setEmail(email);
		
		User dbUser = userService.findPassword(user);
		Map<String, String> map1 = new HashMap<String, String>();
		String message="";
		
		if( dbUser == null) {
			message = "no";
			map1.put("message", message);
		}else {
			message = "ok";
			map1.put("message", message);
		}
		
		return map1;
		}

	// 비밀번호 변경
	@PostMapping ("json/changePassword")
	public Map changePassword(@RequestBody Map<String, String> map ) throws Exception{
			
		String name = map.get("name");
		String phone = map.get("phone");
		String email = map.get("email");
		String password = map.get("password");
		
		User user = userService.getUser(email);
		user.setPassword(password);
		userService.updatePassword(user);
		Map<String, String> map1 = new HashMap<String, String>();
		map1.put("message", "ok");
		
		return map1;
		}
	
	// 계정 복구
	@PostMapping ("json/returnUser") 
	public Map returnUser(@RequestBody Map<String, String> map ) throws Exception{
			
		String name = map.get("name");
		String email = map.get("email");
		String password = map.get("password");
		
		User dbUser = userService.getUser(email);
		Map<String, String> map1 = new HashMap<String, String>();
		
		String message="";
		//아예 회원 정보 없을 때
		if( dbUser == null) {
			message = "no";
			map1.put("message", message);
		}else{
			User ableUser = userService.findAbleDate(dbUser);
				// 복구가능기간 && 계정상태 = '1'
				if ( ableUser != null && ableUser.getAccountState().equals("1") ) {
					userService.returnUserByUser(ableUser);
					message = "ok";
					map1.put("message", message);
				}else {
					message = "disable";
					map1.put("message", message);
				}
		}
		return map1;
		}
	
	// 학원 인증 신청
	@GetMapping("json/addConnect/{userNo}/{academyCode}")
	public Map addConnect(	@PathVariable int userNo,
							@PathVariable String academyCode ) throws Exception{
	
		int connectCnt = userService.checkConnectCnt(userNo);
		
		Map<String, String> map1 = new HashMap<String, String>();
		//인증갯수 이미 3개면 등록 못함 
		if ( connectCnt == 3) {
			map1.put("message", "no");
			return map1;
		}
		
		Academy academy = academyService.getAcademy(academyCode);
		Connect connect = new Connect();
		
		//인증 0,1,2개 등록상태 --> 공통
		if (  academy != null  ) {
			// 인증 0개 상태
			if ( connectCnt == 0 ) {
				User user = userService.getUserByUserNo(userNo);
				connect.setUser(user);
				connect.setAcademy(academy);
				userService.addConnect(connect);
				map1.put("message", "ok");
				return map1;
			}
			else {
				//중복 acaCode 걸러주기
				User user = userService.getUserByUserNo(userNo);
				connect.setUser(user);
				connect.setAcademy(academy);
				int duplication = userService.checkAcademyCode(connect);
				
					if ( duplication == 1 ) { //중복일때
						map1.put("message", "duplication");
						return map1;
					}else { //중복 아닐때 ->정상 add 하면 됨
						userService.addConnect(connect);
						map1.put("message", "ok");
						return map1;
					}
			}
		}else { //academy == null -> 유효하지 않은 학원코드 
			map1.put("message", "notExist");
			return map1;
		}
	}
	
	// 인증 취소
	@GetMapping("json/deleteConnect/{userNo}/{academyCode}")
	public Map deleteConnect( @PathVariable int userNo,
							  @PathVariable String academyCode ) throws Exception{
		
		User user = userService.getUserByUserNo(userNo);
		Academy academy = academyService.getAcademy(academyCode);
		
		Connect connect = new Connect();
		connect.setUser(user);
		connect.setAcademy(academy);
		userService.deleteConnect(connect);
		
		Map map1 = new HashMap<String, String>();
		map1.put("message", "ok");
		return map1;
	}
	
	// SMS 인증번호 발송
	@GetMapping("json/sendSms/{phone}")
	public Map sendSms( @PathVariable String phone ) throws Exception{
		
		int cnt = userService.smsCnt(phone);
		if ( cnt == 1 ) {
			userService.deleteSms(phone);
		}
		
		Sms sms = new Sms();
		sms.setPhone(phone);
		userService.addSms(sms);
		
		Map<String, String> map1= new HashMap<String, String>();
		map1.put("phone", phone);

		return map1;
	}
	
	// SMS 인증 번호 맞는지 확인
	@GetMapping("json/checkSms/{phone}/{vaildNumber}")
	public Map checkSms( @PathVariable String phone ,
						 @PathVariable int vaildNumber) throws Exception{
		
		Sms sms = userService.getSms(phone);
		
		int first = sms.getVaildNumber();
		
		Map<String, String> map1= new HashMap<String, String>();
		
			if ( first == vaildNumber ) {
				map1.put("result", "ok");
				return map1;
				
			}else{
				map1.put("result", "no");
				return map1;
			}
		}
	
	// Cool SMS API_key 및 API_secret Number
	   String api_key = "NCSFWF5S8G4OLGCX";
	   String api_secret = "QEKSHYXKMLVLEJRVQO8GPCYGZXZNVIY9";
	   
	   Message message = new Message(api_key, api_secret);
	   SenderID senderID;
	   JSONObject result;
	   JSONArray result_array;
	   
	   HashMap<String, String> params = new HashMap<String, String>();
	   
	   // sms 인증번호 생성
	   @GetMapping("json/sms/{phone}")
	   public HashMap sms( @PathVariable String phone ) throws Exception{
	   
	      //인증번호 6자리 생성
	      try {
	    	  
	         String[] array = new String[6];
	         String key = new String();
	         Random rd = new Random(); //랜덤 객체 생성
	         
	         for(int i=0; i<array.length; i++) {
	               array[i] = Integer.toString(rd.nextInt(10));
	               key += array[i];
	           }
	       
	      // 문자보내기(테스트시 발신, 수신 둘다 내 번호로 하기)
	      params.put("to", phone); // 수신번호
	      params.put("from", "01076358573"); // 발신번호
	      params.put("type", "SMS");
	      params.put("text", "[사!교육 본인확인] 본인인증 확인번호 ["+key+"]를 입력하세요"); // 문자전송
	      params.put("mode", "test");
	      params.put("key", key);
	      result = message.send(params);
	         try {
	           result = message.sent(params);
	         } catch (Exception e) {
	           result = (JSONObject) JSONValue.parse(e.getMessage());
	         }
	         // cancel
	         params.put("mid", "MIDTEST");
	       } catch (Exception e) {
	         //fail(e.toString());
	       }
	       return params;
	     }
	
}
