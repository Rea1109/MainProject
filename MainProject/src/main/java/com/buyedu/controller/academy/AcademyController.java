package com.buyedu.controller.academy;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Board;
import com.buyedu.domain.Page;
import com.buyedu.domain.Search;
import com.buyedu.domain.User;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.board.BoardService;
import com.buyedu.service.user.UserService;
import com.buyedu.util.UserUtil;


@Controller
@RequestMapping("/academy/*")
public class AcademyController {
	
	@Autowired
	public AcademyService academyService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	public UserService userService;
	
	// 학원 코드 생성
	public String random() {
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 7; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9
		        temp.append((rnd.nextInt(10)));
		        break;
		    }
		}
		
		String random =  temp.toString();
		
		return random;
	}
	
	@Value("5")
	int pageUnit;
	
	@Value("5")
	int pageSize;
	
	// 학원 등록화면 네비게이터
	@RequestMapping("addAcademyView")
	public String addAcademyView() throws Exception {
		
		return "/academy/addAcademyView";
	}

	// 학원 등록
	@RequestMapping("addAcademy")
	public String addAcademy(@ModelAttribute("academy") Academy academy
							, @RequestParam("userNo") int userNo,  Model model) throws Exception {
		
		User user = new User();
		user.setUserNo(userNo);
		academy.setUser(user);
		
		// 툴바 학원 리스트
		User user1 = UserUtil.user();
		Map<String, Object> map = academyService.getAcademyCodeList(user1.getUserNo());
		model.addAttribute("list", map.get("list"));
		
		String makeAcaCode = random();
		String checkAcademyCode = academyService.checkAcademyCode(makeAcaCode);
		
		if (checkAcademyCode == null) {
			academy.setAcademyCode(makeAcaCode);
		}else {
			String makeAnotherAcaCode = random();
			academy.setAcademyCode(makeAnotherAcaCode);
		}
		academyService.addAcademy(academy);
		
		return "/academy/academyInfo";
	}
	
	// 학원 정보 
	@RequestMapping(value = "academyInfo", method = {RequestMethod.GET, RequestMethod.POST})
	public String getAcademyInfo( @RequestParam("academyCode") String academyCode, @ModelAttribute("search") Search search, Model model, HttpSession session, HttpServletRequest request ) throws Exception{
		
		Academy academy = academyService.getAcademy(academyCode);
		model.addAttribute("academy", academy);
		
		// 툴바 학원 리스트
		User user = UserUtil.user();
		Map<String, Object> map = academyService.getAcademyCodeList(user.getUserNo());
		model.addAttribute("list", map.get("list"));
		
		//학원 공지사항
		String category = request.getParameter("cateCode"); // 게시판 종류
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setCateCode(category);
		List<Board> listb =boardService.getBoardListAcademy(search);
		
		if(listb.size()!=0) {
			int totalCount = listb.get(0).getTotalCount();
			Page resultPage = new Page( search.getCurrentPage(),totalCount, pageUnit, pageSize);
			
		model.addAttribute("listb", listb);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		}
		return "/academy/academyInfo";
	}
	
	// 학원 멀티미디어 정보
	@RequestMapping(value = "academySampleEdu", method = RequestMethod.GET)
	public String getAcademySampleEdu(@RequestParam("academyCode") String academyCode, Model model) throws Exception{
		
		// 툴바 학원 리스트
		User user = UserUtil.user();
		Map<String, Object> map = academyService.getAcademyCodeList(user.getUserNo());
		model.addAttribute("list", map.get("list"));
		userService.getUser(user.getEmail());
		Academy academy = academyService.getAcademy(academyCode);
		Map<String, Object> mapm = academyService.getMultimediaList(academyCode);
		
		int imgcount = academyService.getImageCount(academyCode);
		int vidcount = academyService.getVideoCount(academyCode);
		
		model.addAttribute("academy", academy);
		model.addAttribute("listfile", mapm.get("list"));
		model.addAttribute("imgcount", imgcount);
		model.addAttribute("vidcount", vidcount);
		
		return "academy/academySampleEdu";
	}
	
	// 학원에서 학생 인증
	@RequestMapping(value = "academyConnects", method = RequestMethod.GET)
	public String academyConnectList(@RequestParam("academyCode") String academyCode, Model model, HttpSession session) throws Exception{
		
		User user1 = UserUtil.user();
		Map<String, Object> map2 = academyService.getAcademyCodeList(user1.getUserNo());
		Academy academy = academyService.getAcademy(academyCode);
		Map<String, Object> map = academyService.academyConnect(academyCode);
		
		model.addAttribute("list", map2.get("list"));
		model.addAttribute("academy", academy);
		model.addAttribute("connect", map.get("connect"));
		
		return "academy/academyConnect";
	}
	
}
