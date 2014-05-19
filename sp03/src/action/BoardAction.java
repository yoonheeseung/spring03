package action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import model.Board56Bean;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.BoardDAO;

@Controller
public class BoardAction {

	private BoardDAO boardService;

	public void setBoardService(BoardDAO boardService) {
		this.boardService = boardService;
	}// DI

	@RequestMapping(value = "/board_write.do", method = RequestMethod.GET)
	public String write() {
		return "board/board_write";
		// jsp/board/board_write.jsp 뷰페이지가 실행
	}

	// 게시판 저장
	@RequestMapping(value = "/board_write_ok")
	// .do를 생략해도 인식. method을 생략해도 get,post로 접근할
	// 수 있다.
	public ModelAndView b_ok(@ModelAttribute Board56Bean b) throws Exception {
		// @ModelAttribute 어노테이션을 사용할려면 board_write.jsp
		// 의 피라미터 이름과 Board56Bean.java의 변수이름이
		// 같아야 한다.
		this.boardService.insertB(b);// 저장메서드 호출

		ModelAndView listm = new ModelAndView("redirect:/board_list.do");
		return listm;// 생성자에서 지정한 board_list.do로 이동

	}

	/* 목록 */
	@RequestMapping(value = "/board_list")
	public String list(Model listM) throws Exception {

		List<Board56Bean> list = this.boardService.getList();
		// 목록을 받아옴.

		listM.addAttribute("list", list);// list키 값에 저장
		return "board/board_list";
	}

	/* 내용보기 */
	@RequestMapping(value = "/board_cont")
	public ModelAndView cont(@RequestParam("no") int no,
			@RequestParam("state") String state) throws Exception {
		// @RequestParam 어노테이션은 no 파라미터에 get방식으로 넘어온 번호값을 가져와 저장
		if (state.equals("cont")) {// 내용보기일 때 실행
			this.boardService.updateHit(no);// 조회수 증가
		}

		Board56Bean b = this.boardService.getCont(no);
		// 번호를 기준으로 디비로부터 레코드를 가져옴
		ModelAndView bm = new ModelAndView();

		bm.addObject("b", b);

		if (state.equals("cont")) {// 내용보기
			bm.setViewName("board/board_cont");
		} else if (state.equals("edit")) {// 수정폼
			bm.setViewName("board/board_edit");
		} else if (state.equals("del")) {// 삭제폼
			bm.setViewName("board/board_del");
		}

		return bm;
	}

	/* 수정하기 */
	/*@RequestMapping(value = "/board_edit_ok.do", method = RequestMethod.POST)
	public ModelAndView eidt_ok(@RequestParam("no") int no,
			@RequestParam("name") String name,
			@RequestParam("title") String title,
			@RequestParam("cont") String cont,
			@RequestParam("pass") String pass, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		Board56Bean bd_pwd = this.boardService.getPass(no);// 조회수 증가
        
		Board56Bean bcont=new Board56Bean();
		
		bcont.setNo(no);
		bcont.setName(name);
		bcont.setTitle(title);
		bcont.setCont(cont);
		
		int result=0;
		
		if (bd_pwd.getPass().equals(pass)) {
			
			result= this.boardService.updateB(bcont);// 수정메서드 호출
			
			if(result>0){
				
			out.println("<script>");
			out.println("alert('수정을 성공하였습니다!')");
			out.println("location='board_cont.do?no="+no+"&state=cont'");
			out.println("</script>");
			
			ModelAndView listb= new ModelAndView("redirect:/board_cont.do?no="+no+"&state=cont");
			 return listb;// 생성자에서 지정한 board_list.do로 이동
			}else{
				out.println("<script>");
				out.println("alert('수정을 실패하였습니!')");
				out.println("history.go(-1)");
				out.println("</script>");
			}
		} else {
			out.println("<script>");
			out.println("alert('비번이 다릅니다!')");
			out.println("history.go(-1)");
			out.println("</script>");
		}
		return null;
	}*/

	@RequestMapping(value="/board_edit_ok.do",method=RequestMethod.POST)
	public ModelAndView edit_ok(@ModelAttribute Board56Bean eb, HttpServletResponse response )
	throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		Board56Bean bd_pwd = this.boardService.getPass(eb.getNo());
		
		int result=0;
		
		if (bd_pwd.getPass().equals(eb.getPass())) {
             
			result= this.boardService.updateB(eb);// 수정메서드 호출
			
			if(result>0){
				
			out.println("<script>");
			out.println("alert('수정을 성공하였습니다!')");
			out.println("location='board_cont.do?no="+eb.getNo()+"&state=cont'");
			out.println("</script>");
	  /* 
			ModelAndView listb= new ModelAndView("redirect:/board_cont.do?no="+no+"&state=cont");
			 return listb;*/
			}else{
				out.println("<script>");
				out.println("alert('비번이 다릅니다!')");
				out.println("history.go(-1)");
				out.println("</script>");
			}
		}	
		
		return null;	
	}
	
	/* 삭제 완료 */
	@RequestMapping(value="/board_del_ok")
	public ModelAndView del_ok(@RequestParam("no") int no,
			            	   @RequestParam("del_pwd") String pass, 
			            	   HttpServletResponse response ) throws Exception{
		
	
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
	
		Board56Bean bd_pwd = this.boardService.getPass(no);
		
		
		System.out.println("디비비번: "+bd_pwd.getPass());
		System.out.println("파라미터비번: "+pass);
		
		int result=0;
		
		if(bd_pwd.getPass().equals(pass)){
			result=this.boardService.delBoard(no);//삭제
			
			if(result>0){
				out.println("<script>");
				out.println("alert('삭제를 성공하였습니다!')");
				out.println("location='board_list.do'");
				out.println("</script>");
			}else{
				out.println("<script>");
				out.println("alert('삭제 실패하였습니!')");
				out.println("history.go(-1)");
				out.println("</script>");
			}
		}else{
			out.println("<script>");
			out.println("alert('비번이 다릅니다!')");
			out.println("history.go(-1)");
			out.println("</script>");
		}
		return null;
	}
	
}
