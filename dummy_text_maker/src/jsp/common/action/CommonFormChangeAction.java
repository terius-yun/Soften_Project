package jsp.common.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommonFormChangeAction implements Action{
	private String form = "view/";
	private String path;
	public void setCommand(String command){
	       int idx = command.indexOf(".");
	       path = command.substring(0, idx)+".jsp";
	   }
	 
	   @Override
	   public ActionForward execute(HttpServletRequest request,
	           HttpServletResponse response) throws Exception {
	        
	       ActionForward forward = new ActionForward();
	        
	       forward.setRedirect(false);
	        
	       // 메인화면일 경우 MainForm.jsp만 경로로 지정한다.
	       if(path.equals("main.jsp"))
	           forward.setNextPath(path);
	       else
	           forward.setNextPath(form+path);
	        
	       return forward;
	   }
}
