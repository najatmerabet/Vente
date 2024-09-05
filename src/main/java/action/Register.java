package action;
import com.opensymphony.xwork2.ActionSupport;
import DAO.ProduitDaolmp;
import Tables.Users;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public class Register extends ActionSupport {

	private String username;
	private String password;
	private String email;
	private int tel;
	private HttpServletRequest request;

	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	
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
public String enregistrer() {
		//

	// test de reception de mot de passe 
		if( !this.username.isEmpty()&& this.username!=null && !this.password.isEmpty() && this.password!=null && !this.email.isEmpty() && this.password!=null) {
					 //creer un nouveau utilisateur
			//remplir les champs de utilisateur 
					  Users u=new Users();
						ProduitDaolmp prod=new ProduitDaolmp();
							u.setLogin(this.username);
							u.setPass(password);
							u.setEmail(email);
							u.setTel(tel);
							//tester l'exictence et la repetition des mot de passe et login et email
							Users user=prod.select(this.username,this.password);								
								if(user!=null) {
			             System.out.println("l objet rempli");
									return"refuse";
								}
									
								else {
									 prod.saveuser(u);
									 System.out.println("vous ete inscrits maintenant");
										return "inscrit";}
				 
		}else {
			System.out.println("vous devez remplir tout les champs");
			
			return "refuse";
		}
			  
		}	  
}

