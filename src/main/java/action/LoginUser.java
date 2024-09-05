package action;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import DAO.ProduitDaolmp;
import Tables.Users;
import Tables.Articles_Stock;
public class LoginUser extends ActionSupport implements ServletRequestAware {
    private String username;
    private String password;
    private HttpServletRequest request;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }

    // Méthode execute
    public String execute() {
        //tester les champs est ce qu il sonnt rempli
        if (this.username.isEmpty() || this.password.isEmpty()) {
            System.out.println("Remplir tous les champs");
            return "error";
        } else {
            ProduitDaolmp dao = new ProduitDaolmp();
            Users u = new Users();
             u=dao.select(this.username,this.password);
                
                if (u!=null) {
                	List<Articles_Stock>list=new ArrayList<>();
                	 HttpSession session = request.getSession();
                     //je cree une session pour chaque utilisateur
                     session.setAttribute("Username",this.username);
                     session.setAttribute("Pass",this.password);
                     session.setAttribute("id",u.getCodeUser());
                     session.setAttribute("login",true);
                     //session.setAttribute("username", u);
                     session.setAttribute("list",list);
                     int id =(Integer) session.getAttribute("id");
                    System.out.println("Vous êtes connecté maintenant");
                    System.out.println("id user"+id);
                    return "success";
                } else {
                    System.out.println("Vous devez vous inscrire");
                    addFieldError("login", "Vous devez vous inscrire.");
                    return "error";
                }
            }
           
            
        }
    }

