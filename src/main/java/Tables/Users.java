package Tables;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import Tables.Articles_Stock;
import java.util.*;
@Entity
@Table(name="Users")
public class Users {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int codeUser;
	
	@Column(name="login")
	private String login;
	
	@Column(name="pass")
	private String pass;
	
    @Column(name="email")
    private String email;
    
    @Column(name="tel")
    private int tel;

    
    
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	

	public Users(int codeUser, String login, String pass, String email, int tel) {
		super();
		this.codeUser = codeUser;
		this.login = login;
		this.pass = pass;
		this.email = email;
		this.tel = tel;
		
	}

	public int getCodeUser() {
		return codeUser;
	}

	public void setCodeUser(int codeUser) {
		this.codeUser = codeUser;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
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
	

	
	
}
