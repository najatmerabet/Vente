package DAO;

import java.util.List;
import org.hibernate.Session ;
import org.hibernate.Transaction;
import com.mysql.cj.Query;
import java.util.*;
import Tables.Users;
import Tables.commande;
import Tables.Articles_Approvisionnement;
import Tables.Articles_Stock;
import config.configuration;
import freemarker.template.Configuration;
import Tables.Articles_Prix;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;


public class ProduitDaolmp implements IProduitDao{
	

	

// recuperer un produit en utilisant son id 
	public Articles_Stock getById(int id) {
		Session session = new configuration().getSessionFactory().getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Articles_Stock produit  = session.get(Articles_Stock.class,id);
		 
		 transaction.commit();
		 session.close();
		 return produit;
	}

	//ajuter un produit
	public void save(Articles_Approvisionnement produit) {
		
		Session session = new configuration().getSessionFactory().getCurrentSession();
		 Transaction transaction = session.beginTransaction();
		 session.save(produit);
		 
		 transaction.commit();
		 session.close();
		
	}

	//supprimer un   produit
	public void delete(Articles_Approvisionnement produit) {
		Session session = new configuration().getSessionFactory().getCurrentSession();
		 Transaction transaction = session.beginTransaction();
		 session.delete(produit);
		 
		 transaction.commit();
		 session.close();
		
	}

	//modifier un produit
	public void updatea(Articles_Approvisionnement produit) {
		Session session = new configuration().getSessionFactory().getCurrentSession();
		Transaction transaction = session.beginTransaction();
		 session.update(produit);
		 transaction.commit();
		 session.close();
		
	}
//ajouter les produits 
	@Override
	public void saves(Articles_Stock produit) {
		Session session = new configuration().getSessionFactory().getCurrentSession();
		 Transaction transaction = session.beginTransaction();
		 session.save(produit);
		 
		 transaction.commit();
		 session.close();
	}
//extraire les produits 
	@Override
	public List<Articles_Stock> getAllp() {
		Session session = new configuration().getSessionFactory().getCurrentSession();
		 Transaction transaction = session.beginTransaction();
		 List<Articles_Stock> produits  = session.createQuery("from Articles_Stock ").getResultList();
		 
		 transaction.commit();
		 session.close();
		 return produits;
	}
//enregistrer les utilisateurs

	@Override
	public   void saveuser(Users u) {
		Session session = new configuration().getSessionFactory().getCurrentSession();
		 Transaction transaction = session.beginTransaction();
		 session.save(u);
		 
		 transaction.commit();
		 session.close();
	}
//manipulation des utilisateurs
	@Override
	public List<Users> getAllusers() {
		 Session session = new configuration().getSessionFactory().getCurrentSession();
		 Transaction transaction = session.beginTransaction();
		 List<Users> users  = session.createQuery("from Users").getResultList();
		 
		 transaction.commit();
		 session.close();
		 return users;
	}
//recuperer un utilisateur par son id
	@Override
	public Users getuser(int id) {
		Session session = new configuration().getSessionFactory().getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Users user  = session.get(Users.class,id);
		 
		 transaction.commit();
		 session.close();
		 return user;
	}
//recuperer les produiit par son id
	@Override
	public Articles_Prix getprodById(int id) {
		Session session = new configuration().getSessionFactory().getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Articles_Prix produit  = session.get(Articles_Prix.class,id);
		 
		 transaction.commit();
		 session.close();
		 return produit;
	}
//modifier les utilisateir
	@Override
	public int update(Users user) {
		int afectedline=0;
		Session session = new configuration().getSessionFactory().getCurrentSession();
		 Transaction transaction = session.beginTransaction();
		 String sql="update Users set login=:username, pass=:pass,email=:email WHERE id=:id";
		org.hibernate.query.Query  query= session.createQuery(sql);
		query.setParameter("username",user.getLogin());
		query.setParameter("pass", user.getPass());
		query.setParameter("email", user.getEmail());
		query.setParameter("id", user.getCodeUser());
		afectedline=query.executeUpdate();
		 transaction.commit();
		 session.close();
		return afectedline;
	}
// verifier les utilisateur
	@Override
	public int verfieruser(String username) {
		Session session = new configuration().getSessionFactory().getCurrentSession();
		Transaction transaction = session.beginTransaction();
		org.hibernate.query.Query<Long> query = session.createQuery("SELECT COUNT(*) FROM Users WHERE login = :username", Long.class);
		query.setParameter("username", username);
		Long count = query.uniqueResult();

		transaction.commit();
		session.close();

		return count.intValue();
	}

	@Override
	public int verfieremail(String email) {
		Session session = new configuration().getSessionFactory().getCurrentSession();
		Transaction transaction = session.beginTransaction();
		org.hibernate.query.Query<Long> query = session.createQuery("SELECT COUNT(*) FROM Users WHERE email = :email", Long.class);
		query.setParameter("email", email);
		Long count = query.uniqueResult();

		transaction.commit();
		session.close();

		return count.intValue();
	}

	@Override
	public int verfierpass(String pass) {
		Session session = new configuration().getSessionFactory().getCurrentSession();
		Transaction transaction = session.beginTransaction();
		org.hibernate.query.Query<Long> query = session.createQuery("SELECT COUNT(*) FROM Users WHERE pass = :pass", Long.class);
		query.setParameter("pass",pass);
		Long count = query.uniqueResult();

		transaction.commit();
		session.close();

		return count.intValue();
	}

	@Override
	public Users select(String username, String pass) {
	    Session session = new configuration().getSessionFactory().getCurrentSession();
	    Transaction transaction = session.beginTransaction();
	    org.hibernate.query.Query<Users> query = session.createQuery("FROM Users WHERE login = :username AND pass = :pass", Users.class);
	    query.setParameter("username", username);
	    query.setParameter("pass", pass);
	    Users user = query.uniqueResult();

	    transaction.commit();
	    session.close();

	    return user;
	}

//ajouter un produit a une liste pour le panier 
	@Override
	public boolean addprodtolist(List<Articles_Stock>list,Articles_Stock art) {
		if( list.add(art)) {
			return true;
		}else {
			return false;
		}		
	}
	//ajouter les commande a la base de donnes 
@Override
public void savec(commande c) {
	Session session = new configuration().getSessionFactory().getCurrentSession();
	 Transaction transaction = session.beginTransaction();
	 session.save(c);
	 
	 transaction.commit();
	 session.close();
	
}
//recuperer les commandes
	@Override
	public List<commande> getallc() {

		Session session = new configuration().getSessionFactory().getCurrentSession();
		Transaction transaction = session.beginTransaction();
		List<commande> commande  = session.createQuery("from commande").getResultList();

		transaction.commit();
		session.close();
		return commande;
	}

	//supprimer les quantite commande
@Override
public void deleteq(Articles_Stock art) {
	Session session = new configuration().getSessionFactory().getCurrentSession();
	 Transaction transaction = session.beginTransaction();
	 session.delete(art);
	 transaction.commit();
	 session.close();
	
}
//supprimer le produit lorsque la quantite est null
@Override
public void deletepa(Articles_Prix artp) {
	Session session = new configuration().getSessionFactory().getCurrentSession();
	 Transaction transaction = session.beginTransaction();
	 session.delete(artp);
	 transaction.commit();
	 session.close();
	
	
}

	@Override
	public int updateps(Articles_Stock art) {
		int afectedline=0;
		Session session = new configuration().getSessionFactory().getCurrentSession();
		Transaction transaction = session.beginTransaction();
		String sql="update Articles_Stock set qteArt=:qte WHERE id=:id";
		org.hibernate.query.Query  query= session.createQuery(sql);
		query.setParameter("id",art.getCodeArt());
		query.setParameter("qte",art.getQteArt());
		afectedline=query.executeUpdate();
		transaction.commit();
		session.close();
		return afectedline;

	}

	@Override
	public int updatepp(Articles_Prix art) {
		return 0;
	}


}
