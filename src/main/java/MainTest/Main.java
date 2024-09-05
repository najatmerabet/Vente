package MainTest;

//import DAO.IProduitDao;
import DAO.ProduitDaolmp;
import Tables.Articles_Prix;
import Tables.commande;
import Tables.Articles_Approvisionnement;
import Tables.Users;
import Tables.Articles_Stock;
import java.util.*;
//import Tables.Articles_Stock;

public class Main {
	
	public static void main(String[] args) {
		ProduitDaolmp dao = new ProduitDaolmp();
		List<Articles_Stock> articles;
		
		Articles_Approvisionnement p = new Articles_Approvisionnement();
		
		Articles_Stock p2 = new Articles_Stock();
   	    Articles_Stock p1 = new Articles_Stock();
		
   	 int id=	dao.verfieruser("aya");
 	if(id>0) {
 		System.out.println("le nom deja exist");
 	}else {
 		System.out.println("nouveau login");
 	}
      Users usera=dao.select("aya","aaaaa");
      if(usera!=null) {
    	   System.out.println("exist");
    	  
      }else {
    	  System.out.println("n'exist pas");
      }
		 Articles_Prix ap=new Articles_Prix();
		 commande c=new commande();
		 Users u=new Users();
		 Users user=new Users();
		articles= dao.getAllp();
		for(Articles_Stock art:articles) {
			//int id=art.getCodeArt();
			 ap=dao.getprodById(id);
			 System.out.println("fggg " +ap.getNomArt());
			 System.out.println("id " +art.getCodeArt());
			 System.out.println("fggg " +art.getQteArt());
			 System.out.println("fggg " +ap.getPrixArt());
		}
		
		 
		p.setCodeArt(3);
		p.setQteCommandé(3333);
		p.setDatePrevueLivraison(88833);
		//---------------------------
		/*p1.setNomArt("mascara");
		p1.setPrixArt(200);
		p1.setQteArt(5);
		//-----------------------
		p2.setNomArt("rougeallevre");
		p2.setPrixArt(500);
		p2.setQteArt(10);*/
		//---------------------------------
		/*u.setLogin("lllll");
		u.setPass("pppp");
		user.setEmail("ghfjk");
		user.setLogin("bhfkx");
		user.setPass("dfgsy");
		user.setCodeUser(44);
		dao.update(user);*/
//		dao.getById(1);
		dao.save(p);
//		dao.delete(p)
		dao.saves(p1);
		dao.saves(p2);
		dao.saveuser(u);
		System.out.println("Les Tables et ajoute par succse");
	Users najat=new Users();
	najat.setEmail("nbvcx");
	najat.setLogin("sddf");
	najat.setPass("dfghyr");
	najat.setCodeUser(60);
	int line=dao.update(najat);
	if(line>0) {
		System.out.println("changement effectuee");
	}else {
		System.out.println("changement n'est pas effectuee");
	}
	List<Articles_Stock> liste = new ArrayList<>();
	dao.addprodtolist(liste, p1);
   dao.addprodtolist(liste, p2);
	

	// Supprimer un élément spécifique de la liste
	liste.remove(p1);

	// Afficher la liste après suppression
	System.out.println(liste);

	}
}
