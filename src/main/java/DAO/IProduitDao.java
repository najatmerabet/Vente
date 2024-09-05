package DAO;

import java.util.List;

import 	Tables.Articles_Approvisionnement;
import Tables.Articles_Stock;
import Tables.Users;
import Tables.Articles_Prix;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import Tables.commande;
public interface IProduitDao {
	
	//recuperer les produit
	public Articles_Stock getById(int id);
	//ajouter des produits
	public void save(Articles_Approvisionnement produit);
	//supprimer un produit
	public void delete(Articles_Approvisionnement produit);
	//modifier des produits
	public void updatea(Articles_Approvisionnement produit);
	//------------------------
	     //manipuler des produits
	public List<Articles_Stock> getAllp();
	//ajouter des produit
	public void saves(Articles_Stock produit);
	//recuperer un produit par son id
	public Articles_Prix getprodById(int id);
	//ajouter un produit au panier
	public boolean addprodtolist(List<Articles_Stock>list,Articles_Stock art);
	// supprimer des produit
	public void deleteq(Articles_Stock art);
	// supprimer des produit
	public void deletepa(Articles_Prix art);
	//modifier des produit
	public int updateps(Articles_Stock art);
	public int updatepp(Articles_Prix art);
	//-----------------------
	     //manipuler les clients
	public void saveuser(Users u);
	public int update(Users user);
	   // selectionner un utilisateur pour lui afficher son profile
	public Users getuser(int id);
	// verifier les utilisateurs par leurs name
	public int verfieruser(String username);
	// verifier les utilisateurs par leurs email
	public int verfieremail(String email);
	// verifier les utilisateurs par leurs password
	public int verfierpass(String pass);
	public Users select(String username,String pass);
	public List<Users> getAllusers();
	//--------------------------
	// manipuler les commandes
	public void savec(commande c);
	public List<commande> getallc();
	
	
}
