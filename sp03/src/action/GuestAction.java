package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	}//스프링 setter DI 의존관계를 설정
	
	/* 방명록 */
	@RequestMapping(value="/guest_write.do",method=RequestMethod.GET)//월말평가:GET방식일때 호출되는 어노테이션
	public String g_write(@RequestParam("page") String page, Model wm, HttpServletRequest request)throws Exception{
		 /*int page=1;
		 if(request.getParameter("page") != null){
			 page=Integer.parseInt(request.getParameter("page"));
				 //정수형 숫자로 바꿔서 페이지번호를 저장
		 }*/
		if(page !=null){
		wm.addAttribute("page",Integer.parseInt(page));
		}else{
			wm.addAttribute("page",1);
		}
		return "guest/guest_write";
		//guest폴더의 guest_write.jsp 뷰페이지가 실행
	}

	/* 방명록 저장 */
	@RequestMapping(value="/guest_write_ok.do",method=RequestMethod.POST)//월말평가:POST방식일때 호출되는 어노테이션
	public String write_ok(@ModelAttribute Guest78Bean g)
	throws Exception{
		//@ModelAttribute 어노테이션을 사용할려면 guest_write.jsp의 네임파라미터이름과 빈클래스의 변수명이 같아야 한다.
		this.guestService.insertG(g);//저장메서드 호출
		return "redirect:/guest_list.do";
	}
	
	/* 방명록 목록*/
	@RequestMapping(value="/guest_list.do")
	public String list(Model listM,
			           @ModelAttribute Guest78Bean g,
			           HttpServletRequest request)//ListM과 g를 키맵방식으로 저장하기위한 선언
	throws Exception{
		/* paging 시작 */
		int page=1;
		int limit=10;			

		if(request.getParameter("page") != null){
			page=Integer.parseInt(request.getParameter("page"));
			//get방식으로 넘어온 쪽번호를 정수형 숫자로 바꿔서 좌측변수에 저장한다.
		}
		
		//총 레코드 개수를 반환
		int listcount=this.guestService.getListCount();		

		g.setStartrow((page-1)*10+1);
		g.setEndrow(g.getStartrow()+limit-1);
		
		List<Guest78Bean> blist=
				this.guestService.getGuestList(g);
		//방명록 목록

		//총 페이지 수.
		int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리.
		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage>startpage+10-1) endpage=startpage+10-1;
		
		listM.addAttribute("blist", blist);
		listM.addAttribute("page", page);
		listM.addAttribute("startpage", startpage);
		listM.addAttribute("endpage", endpage);
		listM.addAttribute("maxpage", maxpage);
		listM.addAttribute("listcount",listcount);		
		/* paging 끝 */
		return "guest/guest_list";
	}
	
	/*내용보기+답변글폼+수정폼+삭제폼*/
	@RequestMapping(value="/guest_cont")
	public ModelAndView cont(@RequestParam("no") int no,
			@RequestParam("state") String state,
			@ModelAttribute Guest78Bean gc,
			@RequestParam("page") String p,
			HttpServletRequest request) throws Exception{
		
		int result=0;
		int page = 1;
		
		if(p !=null){
			page= Integer.parseInt(p);
		}
			
		if(state.equals("cont")){
			result = this.guestService.updateHit(no);
		}
		
		gc=this.guestService.getCont(no);//디비로 부터 내용조회
		String cont=gc.getCont().replace("\n","<br/>");
		//textarea박스에서 엔터키 친 부분을 웹상에서 볼때 다음줄로 개행한다.
		
		ModelAndView gm=new ModelAndView();
		gm.addObject("page",page);
		gm.addObject("gc",gc);
		
		if(state.equals("cont")){
			gm.addObject("cont",cont);
			gm.setViewName("guest/guest_cont");
		}else if(state.equals("reply")){
			gm.setViewName("guest/guest_reply");
		}else if(state.equals("edit")){
			gm.setViewName("guest/guest_edit");
		}else if(state.equals("del")){
			gm.setViewName("guest/guest_del");
		}
		
		return gm;
	}
	/* 9교시에 할것
	 * 1.guest_cont.jsp 뷰페이지를 작성하세요
	 * 2.제목,내용,조회수를 출력하시면 됩니다.
	 * 3.답변,수정,삭제,목록 버튼을 추가하세요. 답변,수정,삭제
	 *   는 get방식으로 번호값과 페이지번호값이 넘어가야 한다.
	 *   목록은 페이지 번호만 넘어가면 된다.
	 *  
	 *  */
}
