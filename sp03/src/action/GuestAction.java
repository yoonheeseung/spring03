package action;



import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Guest78Bean;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.GuestDAO;

@Controller
public class GuestAction {

	private GuestDAO guestService;

	public void setGuestService(GuestDAO guestService) {
		this.guestService = guestService;
	}// 스프링 setter DI 의존관계를 설정

	/* 방명록 */
	@RequestMapping(value = "/guest_write.do", method = RequestMethod.GET)
	// 월말평가:GET방식일때 호출되는 어노테이션
	public String g_write(@RequestParam("page") String page, Model wm,
			HttpServletRequest request) throws Exception {
		/*
		 * int page=1; if(request.getParameter("page") != null){
		 * page=Integer.parseInt(request.getParameter("page")); //정수형 숫자로 바꿔서
		 * 페이지번호를 저장 }
		 */
		if (page != null) {
			wm.addAttribute("page", Integer.parseInt(page));
		} else {
			wm.addAttribute("page", 1);
		}
		return "guest/guest_write";
		// guest폴더의 guest_write.jsp 뷰페이지가 실행
	}

	/* 방명록 저장 */
	@RequestMapping(value = "/guest_write_ok.do", method = RequestMethod.POST)
	// 월말평가:POST방식일때 호출되는 어노테이션
	public String write_ok(@ModelAttribute Guest78Bean g) throws Exception {
		// @ModelAttribute 어노테이션을 사용할려면 guest_write.jsp의 네임파라미터이름과 빈클래스의 변수명이
		// 같아야 한다.
		this.guestService.insertG(g);// 저장메서드 호출
		return "redirect:/guest_list.do";
	}

	/* 방명록 목록 */
	@RequestMapping(value = "/guest_list.do")
	public String list(Model listM, @ModelAttribute Guest78Bean g,
			HttpServletRequest request)// ListM과 g를 키맵방식으로 저장하기위한 선언
			throws Exception {
		/* paging 시작 */
		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			// get방식으로 넘어온 쪽번호를 정수형 숫자로 바꿔서 좌측변수에 저장한다.
		}

		// 총 레코드 개수를 반환
		int listcount = this.guestService.getListCount();

		g.setStartrow((page - 1) * 10 + 1);
		g.setEndrow(g.getStartrow() + limit - 1);

		List<Guest78Bean> blist = this.guestService.getGuestList(g);
		// 방명록 목록

		// 총 페이지 수.
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림
																	// 처리.
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		listM.addAttribute("blist", blist);
		listM.addAttribute("page", page);
		listM.addAttribute("startpage", startpage);
		listM.addAttribute("endpage", endpage);
		listM.addAttribute("maxpage", maxpage);
		listM.addAttribute("listcount", listcount);
		/* paging 끝 */
		return "guest/guest_list";
	}

	/* 내용보기+답변글폼+수정폼+삭제폼 */
	@RequestMapping(value = "/guest_cont")
	public ModelAndView cont(@RequestParam("no") int no,
			@RequestParam("state") String state,
			@ModelAttribute Guest78Bean gc, @RequestParam("page") String p,
			HttpServletRequest request) throws Exception {

		int result = 0;
		int page = 1;

		if (p != null) {
			page = Integer.parseInt(p);
		}

		if (state.equals("cont")) {
			result = this.guestService.updateHit(no);
		}

		System.out.println(no);
		gc = this.guestService.getCont(no);// 디비로 부터 내용조회
		System.out.println(gc.getCont());
		String cont = gc.getCont().replace("\n", "<br/>");
		// textarea박스에서 엔터키 친 부분을 웹상에서 볼때 다음줄로 개행한다.

		ModelAndView gm = new ModelAndView();
		gm.addObject("page", page);
		gm.addObject("gc", gc);

		if (state.equals("cont")) {
			gm.addObject("cont", cont);
			gm.setViewName("guest/guest_cont");
		} else if (state.equals("reply")) {
			gm.setViewName("guest/guest_reply");
		} else if (state.equals("edit")) {
			gm.setViewName("guest/guest_edit");
		} else if (state.equals("del")) {
			gm.setViewName("guest/guest_del");
		}

		return gm;
	}

	/*
	 * 9교시에 할것 1.guest_cont.jsp 뷰페이지를 작성하세요 2.제목,내용,조회수를 출력하시면 됩니다.
	 * 3.답변,수정,삭제,목록 버튼을 추가하세요. 답변,수정,삭제 는 get방식으로 번호값과 페이지번호값이 넘어가야 한다. 목록은 페이지
	 * 번호만 넘어가면 된다.
	 */

	@RequestMapping(value = "/guest_edit_ok")
	public String edit_ok(HttpServletResponse response,
				          HttpServletRequest request,				     
						  @RequestParam("page") int page,
						  @RequestParam("guest_no") int no,
						  @RequestParam("guest_pwd") String pass,
						  @RequestParam("guest_name") String name,
						  @RequestParam("guest_title") String title,
						  @RequestParam("guest_cont") String cont
						  ) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
	
        
		String gd_pwd = this.guestService.getPass(no);

		int result=0;
		
		Guest78Bean gb=new Guest78Bean();
		
		gb.setNo(no);
		gb.setName(name);
		gb.setTitle(title);
		gb.setCont(cont);
		
		
		if (gd_pwd.equals(pass)) {
		   result=this.guestService.updG(gb);

			if (result > 0) {
				out.println("<script>");
				out.println("alert('수정을 완료하였습니다.')");
				out.println("location='guest_cont.do?no=" + no+"&page="+page+"&state=cont'");
				out.println("</script>");
			}else{
				out.println("<script>");
				out.println("alert('수정을 실패하였습니다.')");
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
	}
	
	//삭제
	@RequestMapping(value="/guest_del_ok.do")
	public String del_ok(@RequestParam("no") int no,
			             @RequestParam("page") int page,
			             @RequestParam("del_pwd") String pass,
			             HttpServletResponse response
			             ) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String gd_pwd = this.guestService.getPass(no);
		
		System.out.println(gd_pwd);
		if(gd_pwd.equals(pass)){
			if(this.guestService.delG(no)>0){
				out.println("<script>");
				out.println("alert('수정을 완료하였습니다.')");
				out.println("location='guest_cont.do?no=" + no+"&page="+page+"&state=cont'");
				out.println("</script>");
			}
		} else {
			out.println("<script>");
			out.println("alert('비번이 다릅니다!')");
			out.println("history.go(-1)");
			out.println("</script>");
		}	

		return null;
	}
	
	//답변글
	@RequestMapping(value="/guest_reply_ok")
	public String reply_ok(@ModelAttribute Guest78Bean rg,
			               @RequestParam("page") int page,
			               HttpServletResponse response) throws Exception{
		/*@ModelAttribute 스프링 어노테이션은 히든 네임피라미터
		 * 이름 ref,step,level2와 입력박스의 네임피라미터이름인
		 * name,title,pass,cont와 Guest78Bean.java의 변수이름이
		 * 같을때 사용하면 알아서 값을 가져와 setter()메서드를
		 * 호출해서 저장이 된다.즉 자바코드를 생략할수 있다. 
		 */
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out=response.getWriter();
     	System.out.println(rg.getName());
		
     	this.guestService.levelup(rg);
     	
     		if(this.guestService.repg(rg)>0){
     			out.println("<script>");
     			out.println("alert('저장에 성공하였습니다.')");
     			out.println("location='guest_list.do?page="+page+"'");
     		    out.println("</script>");
     		    
//     			return "redirect:/guest_list.do?page="+page;		
     	}else{
     		out.println("<script>");
     		out.println("alert('저장 실패했습니다.')");
     		out.println("history.back()");
     		out.println("</script>");
     	}
     	return null;
				/*
		 * 답변글 ref,step, level2 의 정의
		 * 1.ref(글그룹번호): 원본글 그룹번호와 답변글 그룹번호는 같다
		 *                 그러므로 원본글 밑에 답변글이 붙는다. 즉 원본글과 답변글을 서로 묶어주는 기능을 한다.
		 * 2.step: 첫번째 답변글일때는 1, 두번째 답변글일 때는2가 된다. 즉 답변글의 순서를 보여준다.
		 * 3.level2:원본글 밑에 붙은 답변글 순서를 가리킨다.
		 */
		
	}

}
