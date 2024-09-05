package action;

import Tables.Users;
import DAO.ProduitDaolmp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

public class Profile extends ActionSupport implements ServletRequestAware  {
    private String newpassword;
    private String confirmnewpassword;
    private String username;
    private String email;
    private HttpServletRequest request;
    private int id;
    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Profile(String newpassword, String confirmnewpassword, String username, String email, HttpServletRequest request) {
		super();
		this.newpassword = newpassword;
		this.confirmnewpassword = confirmnewpassword;
		this.username = username;
		this.email = email;
		this.request = request;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	

    public Profile() {
        super();
    }

    public String getNewpassword() {
        return newpassword;
    }

    public void setNewpassword(String newpassword) {
        this.newpassword = newpassword;
    }

    public String getConfirmnewpassword() {
        return confirmnewpassword;
    }

    public void setConfirmnewpassword(String confirmnewpassword) {
        this.confirmnewpassword = confirmnewpassword;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }

    public String changer() {
        //tester la session
        HttpSession session=this.request.getSession();
        Boolean login = (Boolean) session.getAttribute("login");
        if (login == null || !login) {
            return "login";
        }

        System.out.println("Le nouveau nom est : " + this.username);
        System.out.println("Le nouveau mot de passe est : " + this.newpassword);
        //tester les champs  si ils sont rempli
        if (this.newpassword != null && !this.newpassword.isEmpty() && this.username != null && !this.username.isEmpty() && this.email!=null && !this.email.isEmpty()) {
            if (this.newpassword.equals(this.confirmnewpassword)) {
            	this.request = ServletActionContext.getRequest();
                //recuperer l id de l utilisateur
            	this.id = Integer.parseInt(request.getParameter("id"));
                System.out.println("L'ID de session est : " + this.id);
                Users user=new Users();
                ProduitDaolmp dao=new ProduitDaolmp();
             user= dao.getuser(id);
             if(user!=null) {
            	 System.out.println("j'ai selectionne utilisateur"+user.getLogin());
             }
             //modifier les donnne de l utilisateur
              user.setEmail(this.email); 
              user.setLogin(this.username);
              System.out.println("le nouveau username est"+user.getLogin());
              user.setPass(this.confirmnewpassword);
       int line= dao.update(user);
                if(line>0) {
                	this.request.setAttribute("Username",user.getLogin());
                	 System.out.println("le nouveau username est"+this.request.getAttribute("Username"));
                	return "changer";
                }else {
                	return "fail";
                }
                
                
            } else {
                System.out.println("Le mot de passe est différent de sa confirmation");
                return "fail";
            }
        } else {
            System.out.println("Vous devez remplir tous les champs de changement");
            return "fail";
        }
    }
}
