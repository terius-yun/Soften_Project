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
		
		String purpose = request.getParameter("purpose");
		String volume = request.getParameter("volume");
		System.out.println(purpose);
		System.out.println(volume);
		CommonDAO dao = CommonDAO.getInstance();
		ArrayList<CommonVO> content = dao.getText(purpose);
		 String[]text = new String[content.size()];
		 Random random = new Random();	 
		 for (int i = 0; i <content.size() ; i++) {	
			int ran = random.nextInt(content.size());
			text[i] = content.get(ran).getContent();
			System.out.println(text[i]);
		}
		request.setAttribute("text", text);
		
		forward.setRedirect(false);
        forward.setNextPath("/");
		
		return forward;
	}

}
