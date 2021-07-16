package com.buyedu.controller.academy;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Search;
import com.buyedu.domain.User;
import com.buyedu.service.academy.AcademyService;


@Controller
@RequestMapping("/academy/*")
public class AcademyController {
	
	@Autowired
	public AcademyService academyService;
	
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
	
	
	@RequestMapping("addAcademyView")
	public String addAcademyView() throws Exception {
		
		System.out.println("addAcademyView 단순 네비게이터");
		
		return "academy/addAcademyView";
	}

	@RequestMapping("addAcademy")
	public String addAcademy(@ModelAttribute("academy") Academy academy
							, @RequestParam("userNo") int userNo) throws Exception {
		
		System.out.println("addAcademy : POST");		
		System.out.println("userNo = " + userNo);
		System.out.println("academy = " + academy);
		
		User user = new User();
		user.setUserNo(userNo);
		academy.setUser(user);
		
		String makeAcaCode = random();
		
		String checkAcademyCode = academyService.checkAcademyCode(makeAcaCode);
		
		if (checkAcademyCode == null) {
			
			academy.setAcademyCode(makeAcaCode);
			System.out.println("중복되는 학원코드가 존재하지 않습니다.");
			System.out.println("학원 코드 : "+makeAcaCode);
		}else {
			
			System.out.println("학원코드가 중복되어 다시 실행합니다.");
			String makeAnotherAcaCode = random();
			
			academy.setAcademyCode(makeAnotherAcaCode);
			System.out.println("학원 코드 : "+makeAnotherAcaCode);
		}
		
		academyService.addAcademy(academy);
		
		return "academyMain";
	}
	
	
	@RequestMapping("listSearch")
	public String listSearch(Model model,
							@ModelAttribute("search") Search search)	throws Exception {
		
		System.out.println("listAcademy");
		System.out.println(search);
		
		System.out.println(academyService.getSearchList(search));

		if(academyService.getSearchList(search).size() != 0) {
			
			model.addAttribute("list", academyService.getSearchList(search));
			model.addAttribute("lat", academyService.getSearchList(search).get(0).getAcademyLat());
			model.addAttribute("lng", academyService.getSearchList(search).get(0).getAcademyLng());		
		}
		
		
		return "academy/listAcademy";
	}
	
	@RequestMapping(value = "academyInfo", method = RequestMethod.GET)
	public String getAcademyInfo( @RequestParam("academyCode") String academyCode, Model model, HttpSession session ) throws Exception{
		
		System.out.println("/academy/academyInfo : GET");
		
		System.out.println(academyCode);
		
		Academy academy = academyService.getAcademy(academyCode);
		
		model.addAttribute("academy", academy);
		
		System.out.println(academy);
		
		return "search/searchInfo";
	}
	

}
