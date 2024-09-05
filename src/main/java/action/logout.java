package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class logout extends ActionSupport implements ServletRequestAware {

	private HttpServletRequest request;

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
// faire le logout des utilisateurs
	public String sortir() {
		HttpSession session = this.request.getSession();
		if (session != null) {
			session.invalidate();
			return "out";
		}
		return "out";
	}
}
