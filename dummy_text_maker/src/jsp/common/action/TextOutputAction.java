package jsp.common.action;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.dao.CommonDAO;
import jsp.common.vo.CommonVO;

public class TextOutputAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		
		String purpose = request.getParameter("purpose");//어디에 쓰실건가요? 의 값
		
		int volume = 0;
		if(request.getParameter("volume") != null) {//얼마나 필요하세요? 의 값
			volume = Integer.parseInt(request.getParameter("volume"));
		}
		int totalMnL = 0;//텍스트의 추가 혹은 소거 요청의 값
		if(request.getParameter("totalMnL") != null) {
			totalMnL = Integer.parseInt(request.getParameter("totalMnL"));
		}
		if(request.getParameter("requestMnL")!=null) {// 사용자의 요청이 텍스트 추가 인지 텍스트 소거인지
			if(Integer.parseInt(request.getParameter("requestMnL")) == 0) {
				totalMnL++;
			}else if(Integer.parseInt(request.getParameter("requestMnL")) == 1) {
				if(totalMnL >0) {
					totalMnL--;
				}
			}
		}
		
		System.out.println(purpose);
		System.out.println(volume);
		CommonDAO dao = CommonDAO.getInstance();
		ArrayList<CommonVO> content = dao.getText(purpose);
		
		 int textVolume = 0;
		 if(volume == 1) {
			 textVolume = content.size()/3;
		 }else if(volume == 2) {;
			 textVolume = (content.size()/3)*2;
		 }else if(volume == 3){
			 textVolume = content.size();
		 }
		 
		 String[]text = new String[textVolume+totalMnL];
		 Random random = new Random();
		 
		 for (int i = 0; i < (textVolume+totalMnL) ; i++) {//랜덤 출력.
			int ran = random.nextInt(content.size());
			text[i] = content.get(ran).getContent();
			System.out.println(text[i]);
		}
		request.setAttribute("text", text);
		request.setAttribute("purpose", purpose);
		request.setAttribute("volume", volume);
		request.setAttribute("totalMnL", totalMnL);
		
		forward.setRedirect(false);
        forward.setNextPath("/");
		
		return forward;
	}

}
