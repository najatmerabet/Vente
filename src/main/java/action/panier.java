package action;
import Tables.Users;
import Tables.Articles_Stock;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;
import DAO.ProduitDaolmp;
import java.util.*;
public class panier extends ActionSupport implements ServletRequestAware {
	
    private int quantite;
    private int id;
    private HttpServletRequest request;
    

    public panier() {
		super();
		// TODO Auto-generated constructor stub
	}

	public panier(int quantite, int id, HttpServletRequest request) {
		super();
		this.quantite = quantite;
		this.id = id;
		this.request = request;
	}



	public int getQuantite() {
		return quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	
    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }

//tester la session
    public String ajouter() {
        HttpSession session = request.getSession();
        Boolean login = (Boolean) session.getAttribute("login");
        if (login == null || !login) {
            return "login";
        }
        ProduitDaolmp dao = new ProduitDaolmp();
        Users user = new Users();
        Articles_Stock art = dao.getById(this.id);
        int qteart = art.getQteArt(); // quantite disponible de l'article sur la base de données stock
        session = this.request.getSession();
        int id = (Integer) session.getAttribute("id");
        Users u = dao.getuser(id);

        System.out.println("ddd" + u.getLogin());
        List<Articles_Stock> list = (List<Articles_Stock>) session.getAttribute("list");
        if (list == null) {
            System.out.println("la liste est null");
            list = new ArrayList<>(); // Crée une nouvelle liste si elle n'existe pas
            session.setAttribute("list", list); // Ajoute la liste à la session
        }
        
        // Vérifier si l'article est déjà présent dans la liste
        boolean articleExistant = false;
        for (Articles_Stock article : list) {
            if (article.getCodeArt() == art.getCodeArt()) { // Comparer l'ID de l'article
                articleExistant = true;
                break;
            }
        }
        
        if (!articleExistant) {
            dao.addprodtolist(list, art);
            System.out.println("L'article est ajouté");
        } else {
            System.out.println("L'article est déjà présent dans la liste");
        }
        
        return "ajoute";
    }
  
   
}
