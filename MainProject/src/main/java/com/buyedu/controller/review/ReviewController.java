package com.buyedu.controller.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Page;
import com.buyedu.domain.Review;
import com.buyedu.domain.Search;
import com.buyedu.domain.User;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.review.ReviewService;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private AcademyService acaService;
	
	public ReviewController() {
		System.out.println(this.getClass());
	}
	
	@Value("5")
	int pageUnit;
	
	@Value("10")
	int pageSize;
	
	@RequestMapping( value="addReviewView", method=RequestMethod.GET)
	public String addReview(Model model) throws Exception {
		System.out.println("addReviewView");
		
		return "/review/addReviewView";
	}
	@RequestMapping (value="addReview", method=RequestMethod.POST)
	public String addReview(@ModelAttribute("review") Review review , HttpServletRequest httpRequest) throws Exception {
		
		System.out.println("애드리뷰포스트 시작");
		
		int userNo = ((User)httpRequest.getSession().getAttribute("user")).getUserNo();
		System.out.println(userNo);
		//String academyCode = ( acaService.getAcademyCode(userNo) ); 하단 테스트중... AcademyCode String용으로 요청해야
		String academyCode = ( "A02" );
		
		System.out.println("review :" + review);
		User user = new User();
		user.setUserNo(userNo);
		review.setReviewWriter(user);
		
		Academy academy = new Academy();
		academy.setAcademyCode(academyCode);
		System.out.println("academyCode : "+ academy);
		review.setAcademy(academy);
		
		System.out.println("review :" +review);
		reviewService.addReview(review);
		
		
		return "/review/listReview";
	}

	@RequestMapping (value = "getReview" , method=RequestMethod.GET)
	public String getReview (@RequestParam("reviewNo") int reviewNo, Model model) throws Exception {
		System.out.println("리뷰넘 : "+reviewNo);
		Review review = reviewService.getReview(reviewNo);
		
		
		model.addAttribute("review" , review);
		System.out.println(review);
		
		
		return "/review/getReview";
	}
	
	@RequestMapping (value = "updateReview", method=RequestMethod.GET)
	public String updateReview(@RequestParam("reviewNo") int reviewNo , Model model) throws Exception {
		
		Review review = reviewService.getReview(reviewNo);
		
		
		model.addAttribute("review",review);
		
		return "/review/updateReviewView";
	}
	
	@RequestMapping( value="updateReview", method=RequestMethod.POST)
	public String updateReview( @ModelAttribute("review") Review review, Model model) throws Exception{
		
		return "redirect:/review/getReview?reviewNo="+review.getReviewNo();
		
	}
	
	@RequestMapping (value="listReview")
	public String listReview( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		if(search.getCurrentPage() ==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		List<Review> list = reviewService.getReviewList(search);
		
		int totalCount = list.get(0).getTotalCount();
		Page resultPage = new Page (search.getCurrentPage(),totalCount,pageUnit,pageSize);
		
		model.addAttribute("list",list);
		model.addAttribute("resultPage" , resultPage);
		model.addAttribute("search",search);
		
		System.err.println(list);
		
		
		return "/review/listReview";
	}
	
	@RequestMapping(value="deleteReview", method = RequestMethod.GET)
	public String deleteReview(@RequestParam("reviewNo") int reviewNo) throws Exception{
		
		reviewService.deleteReview(reviewNo);
		
		return "/review/listReview";
	}

}
