package action;
import Tables.Articles_Prix;
import Tables.Articles_Stock;
import Tables.commande;
import java.util.Date;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;
import Tables.Articles_Stock;
import DAO.ProduitDaolmp;
import Tables.Users;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.time.LocalDateTime;
public class commander extends ActionSupport implements ServletRequestAware {
	private int quantite;
    private int idarticle;
    private HttpServletRequest request;
    private float prixtotal;




public int getQuantite() {
		return quantite;
	}

	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
public void setRequest(HttpServletRequest request) {
	this.request = request;
}

public int getIdarticle() {
	return idarticle;
}

public void setIdarticle(int idarticle) {
	this.idarticle = idarticle;
}


public commander(int quantite, int idarticle, HttpServletRequest request, float prixtotal) {
	super();
	this.quantite = quantite;
	this.idarticle = idarticle;
	this.request = request;
	this.prixtotal = prixtotal;
}
public HttpServletRequest getRequest() {
	return request;
}

@Override
public void setServletRequest(HttpServletRequest request) {
    this.request = request;
}


	public commander() {
	super();
	// TODO Auto-generated constructor stub
}


	public float getPrixtotal() {
		return prixtotal;
	}

	public void setPrixtotal(float prixtotal) {
		this.prixtotal = prixtotal;
	}

	public String passerCommande() {
	    ProduitDaolmp dao = new ProduitDaolmp();
		//tester les session
	    HttpSession session = request.getSession();
	    Boolean login = (Boolean) session.getAttribute("login");
	    if (login == null || !login) {
	        return "login";
	    }
//recuperer la list des produits de la session
	    List<Articles_Stock> list = (List<Articles_Stock>) session.getAttribute("list");
	    if (list != null) {

	        for (Articles_Stock item : list) {
				//recupere les element du panier
	            commande comm = new commande();
	            Date d = new Date();
	         String ida   =request.getParameter("idarticle["+ item.getCodeArt() +"]");
	            String[] quantiteArray = request.getParameterValues("quantite[" + item.getCodeArt() + "]");
	            if (quantiteArray != null && quantiteArray.length > 0) {
	                this.quantite = Integer.parseInt(quantiteArray[0]);
	            } else {
	                // Gérer le cas où aucune quantité n'a été spécifiée

	                continue; // Passe à l'itération suivante
	            }
	            this.idarticle=Integer.parseInt(ida);
	            Articles_Stock art = dao.getById(this.idarticle);
	            Articles_Prix artp=dao.getprodById(this.idarticle);
				//creer la commande et l enregister dans la table commande
	            comm.setClient((String) session.getAttribute("Username"));
	            comm.setCodeArt(this.idarticle);
	            comm.setQteCmd(this.quantite);
	            this.prixtotal = this.quantite * art.getPrixArt();
	            java.sql.Date sqlDate = new java.sql.Date(d.getTime());
	            comm.setDateCmd(sqlDate);
				//sauvgarder lla commmande passe dans la seession
	            dao.savec(comm);
				session.setAttribute("idcomm",comm.getCodeCmd());
				session.setAttribute("datecomm",comm.getDateCmd());
				session.setAttribute("total",this.prixtotal);
				art.setQteArt(art.getQteArt()-this.quantite);
				System.out.println("la quantite"+art.getQteArt());
				// je fais appdate des quantite de produits apres la commande
				  dao.updatepp(artp);
				  dao.updateps(art);
				  // si la quantiite des produits est terminee je le supprime
				if(art.qteArt==0) {
					dao.deleteq(art);
					dao.deletepa(artp);
				}
	            System.out.println("Le nom de l'article : " + art.getNomArt());
	            System.out.println("Le client qui a demandé : " + comm.getClient());
	        }
	    } else {
	        System.out.println("La liste est vide.");
	    }
	    return "commander";
	}


}
