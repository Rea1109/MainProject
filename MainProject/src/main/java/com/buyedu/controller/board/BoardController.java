package com.buyedu.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.buyedu.domain.Complain;
import com.buyedu.domain.Page;
import com.buyedu.domain.Search;
//import com.buyedu.service.complain.ComplainService;
import com.buyedu.domain.User;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.board.BoardService;
import com.buyedu.service.complain.ComplainService;
import com.buyedu.util.UserUtil;


	//==> 게시판관리 Controller
	@Controller
	@RequestMapping("/board/*")
	public class BoardController {
		
		///Field
		@Autowired
		private BoardService boardService;
		
		@Autowired
		private AcademyService academyService;
		
		@Autowired
		private ComplainService complainService;
			
		public BoardController(){
			System.out.println(this.getClass());
		}

		@Value("5")
		int pageUnit;
		
		@Value("10")
		int pageSize;
		
		// 게시글 등록화면 네비게이터
		@RequestMapping( value="addBoard", method=RequestMethod.GET )
		public String addBoard( Model model, HttpServletRequest request) throws Exception {
		    
			//툴바
			User user = UserUtil.user();
		    Map<String, Object> map1 = academyService.getAcademyCodeList(user.getUserNo());
		    model.addAttribute("list", map1.get("list"));
		    
			String category = request.getParameter("cateCode");
			String academyCode = request.getParameter("academyCode");
			Board board = new Board();
			board.setCateCode(category);
			board.setAcaWriter(academyCode);
			model.addAttribute(board);
			
			return "/board/addBoardView";
		}
		
		// 게시글 등록
		@RequestMapping( value="addBoard", method=RequestMethod.POST)
		public String addBoard( @ModelAttribute("board") Board board, Model model, HttpServletRequest httpRequest ) throws Exception {

			//툴바
			User user = UserUtil.user();
		    Map<String, Object> map1 = academyService.getAcademyCodeList(user.getUserNo());
		    model.addAttribute("list", map1.get("list"));
		    
			int userNo = user.getUserNo();
			String category = httpRequest.getParameter("cateCode");
			board.setCateCode(category);
			boardService.addBoard(board);
			Board board1 = boardService.getBoard(board.getBoardNo());
			model.addAttribute("board", board1);
			model.addAttribute(userNo);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("boardNo", board.getBoardNo());
			map.put("userNo", userNo);
			int boardLike = boardService.getRecommend(map);
			
			model.addAttribute("heart",0);
			
			return "redirect:/board/listBoard?cateCode="+board.getCateCode();
		}
		
		// 학원 공지사항 등록
		@RequestMapping( value="addBoardAcademy", method=RequestMethod.POST)
		public String addBoardAcademy( @ModelAttribute("board") Board board, Model model, HttpServletRequest httpRequest ) throws Exception {

			//툴바
			User user = UserUtil.user();
		    Map<String, Object> map1 = academyService.getAcademyCodeList(user.getUserNo());
		    model.addAttribute("list", map1.get("list"));
		    
			int userNo = user.getUserNo();
			String acaWriter = httpRequest.getParameter("acaWriter");
			//Business Logic
			boardService.addBoard(board);
			Board board1 = boardService.getBoard(board.getBoardNo());
			
			model.addAttribute("board", board1);
			model.addAttribute(userNo);
			model.addAttribute("acaWriter", acaWriter);
			
			return "redirect:/board/listBoardAcademy?cateCode=3&academyCode="+acaWriter;
		}
		
		// 게시글 상세보기
		@RequestMapping( value="getBoard", method = RequestMethod.GET)
		public String  getBoard( @RequestParam("boardNo") int boardNo, Model model, HttpServletRequest request ) throws Exception {
			
			//Business Logic
			//툴바
			User user = UserUtil.user();
		    Map<String, Object> map1 = academyService.getAcademyCodeList(user.getUserNo());
		    model.addAttribute("list", map1.get("list"));
		    
			int userNo = user.getUserNo();  
			int recommendCnt = boardService.recommendCnt(boardNo);
			String category = request.getParameter("cateCode");
			String academyCode = request.getParameter("academyCode");
			String isMine = request.getParameter("isMine");
			
			Board board = boardService.getBoardNoAcademy(boardNo);
			board.setRecommendCnt(recommendCnt);
			
			// 조회수 증가
			boardService.updateViewcnt(boardNo);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("boardNo", boardNo);
			map.put("userNo", userNo);
			
			int boardLike = boardService.getRecommend(map);
			
			model.addAttribute("board", board);
			model.addAttribute("isMine", isMine);
	        model.addAttribute("heart",boardLike);
	        model.addAttribute("userNo",userNo);
	        
	        // 신고 검증
	        Complain complain = new Complain();
	        complain.setUser(user);
	        complain.setBoard(board);
	        int complainCount = complainService.getComplainCount(complain);
	        
	        model.addAttribute("complainCount", complainCount);
	        
			return "/board/getBoard";
		}
		
		// 학원 공지사항 상세보기
		@RequestMapping( value="getBoardAca", method = RequestMethod.GET)
		public String getBoardAca( @RequestParam("boardNo") int boardNo, Model model, HttpServletRequest request ) throws Exception {
			
			//Business Logic
			//툴바
			User user = UserUtil.user();
		    Map<String, Object> map1 = academyService.getAcademyCodeList(user.getUserNo());
		    model.addAttribute("list", map1.get("list"));
		    
			int userNo = user.getUserNo();  
			int recommendCnt = boardService.recommendCnt(boardNo);
			String category = request.getParameter("cateCode");
			String academyCode = request.getParameter("academyCode");
			
			Board board = boardService.getBoardAcademy(boardNo);
			board.setRecommendCnt(recommendCnt);
			boardService.updateViewcnt(boardNo);
			
			model.addAttribute("board", board);
			model.addAttribute("academy", academyCode);
			
			return "/board/getBoardAca"; 
		}
		
		// 게시판 수정 GET
		@RequestMapping( value="updateBoard", method=RequestMethod.GET )
		public String updateBoard( @RequestParam("boardNo") int boardNo , 
									@RequestParam("cateCode") String cateCode , Model model, HttpServletRequest request ) throws Exception{

			//Business Logic
			Board board = boardService.getBoardNoAcademy(boardNo);
			
			if ( cateCode == "3" ) {
				String academyCode = request.getParameter("academyCode");
				board.setAcaWriter(academyCode);
				model.addAttribute("board", board);
			}
			
			model.addAttribute("board", board);
			
			return "/board/updateBoardView";
		}
		
		// 게시판 수정 POST
		@RequestMapping( value="updateBoard", method=RequestMethod.POST )
		public String updateBoard( @ModelAttribute("board") Board board , Model model) throws Exception{

			//툴바
			User user = UserUtil.user();
		    Map<String, Object> map1 = academyService.getAcademyCodeList(user.getUserNo());
		    model.addAttribute("list", map1.get("list"));
			boardService.updateBoard(board);

			return "redirect:/board/listBoard?cateCode="+board.getCateCode();
		}
		
		// 학원 공지사항 수정 GET
		@RequestMapping( value="updateBoardAca", method=RequestMethod.GET )
		public String updateBoardAca( @RequestParam("boardNo") int boardNo , Model model ) throws Exception{
			
			Board board = boardService.getBoard(boardNo);
			model.addAttribute("board", board);
			
			return "/board/updateBoardView";
		}
		
		// 학원 공지사항 수정 POST
		@RequestMapping( value="updateBoardAca", method=RequestMethod.POST )
		public String updateBoardAca( @ModelAttribute("board") Board board , Model model, HttpServletRequest request) throws Exception{
			
			//툴바
			User user = UserUtil.user();
		    Map<String, Object> map1 = academyService.getAcademyCodeList(user.getUserNo());
		    model.addAttribute("list", map1.get("list"));

		    String acaWriter = request.getParameter("acaWriter");
			boardService.updateBoard(board);
			
			return "redirect:/board/listBoardAcademy?cateCode=3&academyCode="+acaWriter;
		}
		
		// 게시판 목록
		@RequestMapping( value="listBoard" )
		public String listBoard( @ModelAttribute("search") Search search , @ModelAttribute("board") Board board, Model model , HttpServletRequest request) throws Exception{
			
			// 툴바
			User user = UserUtil.user();
		    Map<String, Object> map1 = academyService.getAcademyCodeList(user.getUserNo());
		    model.addAttribute("list", map1.get("list"));
		    
		    // 게시판 종류
			String category = request.getParameter("cateCode"); 
			String isMine = request.getParameter("isMine");
			
			if(isMine==null){
				isMine="n";
			}
			int userNo = user.getUserNo();  
			
			if(search.getCurrentPage() ==0 ){
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			search.setCateCode(category);
			search.setIsMine(isMine);
			search.setSearchUserNo(userNo);
			
			List<Board> listc =boardService.getBoardList(search);
			
			Page resultPage1 = new Page( 1, 0, pageUnit, pageSize);
			model.addAttribute("resultPage", resultPage1);
			
			if(listc.size()!=0) {
			int totalCount = listc.get(0).getTotalCount();
			Page resultPage = new Page( search.getCurrentPage(),totalCount, pageUnit, pageSize);
			board.setCateCode(category);
			List<Map<String, Object>> map= boardService.getBoardListPin(board); 
			
			// 신고 정보
			Map<String, Object> complainmap = complainService.getComplainList(search);
			
			model.addAttribute("listc", listc);
			model.addAttribute("map", map);
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			model.addAttribute("comlist",complainmap);
			}

			return "/board/listBoard";
		}
		
		// 학원 공지사항 목록
		@RequestMapping( value="listBoardAcademy" )
		public String listBoardAcademy( @ModelAttribute("search") Search search , @ModelAttribute("board") Board board, Model model , HttpServletRequest request) throws Exception{
			
			// 툴바
			User user = UserUtil.user();
		    Map<String, Object> map = academyService.getAcademyCodeList(user.getUserNo());
		    model.addAttribute("list", map.get("list"));
		    
		    String academyCode = request.getParameter("academyCode");
			Academy academy = academyService.getAcademy(academyCode);
			model.addAttribute("academy", academy);
			
			// 게시판 종류
			String category = request.getParameter("cateCode"); 
			
			if(search.getCurrentPage() ==0 ){
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			search.setCateCode(category);
			
			List<Board> listb =boardService.getBoardListAcademy(search);
			model.addAttribute("search", search);
			Page resultPage1 = new Page( 1, 0, pageUnit, pageSize);
			model.addAttribute("resultPage", resultPage1);
			
			if(listb.size()!=0) {
				int totalCount = listb.get(0).getTotalCount();
				Page resultPage = new Page( search.getCurrentPage(),totalCount, pageUnit, pageSize);
				
			model.addAttribute("listb", listb);
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			}
			
			return "/board/listBoardAcademy";
		}
		
		// 게시글 삭제
		@RequestMapping( value="deleteBoard", method = RequestMethod.GET)
		public String  deleteBoard( @RequestParam("boardNo") int boardNo, HttpServletRequest request) throws Exception {
		
			String category = request.getParameter("cateCode");
			
			boardService.deleteBoard(boardNo);
			Board board = new Board();
			board.setCateCode(category);

			return "redirect:/board/listBoard?cateCode="+board.getCateCode();
		}

	}

