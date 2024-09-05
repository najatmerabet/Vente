package config;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import Tables.commande;
import Tables.Users;
import Tables.Articles_Prix;
import Tables.Articles_Approvisionnement;
import Tables.Articles_Stock;

public class configuration {
	
	private static final SessionFactory sessionFactory;
	private static final ServiceRegistry serviceRegistry;
	
	static {
		Configuration config = new Configuration();
		config.configure("hibernate.cfg.xml");
		
		config.addAnnotatedClass(Articles_Approvisionnement.class);
		config.addAnnotatedClass(Articles_Stock.class);
		config.addAnnotatedClass(Articles_Prix.class);
		config.addAnnotatedClass(commande.class);
		config.addAnnotatedClass(Users.class);
		serviceRegistry = new StandardServiceRegistryBuilder().applySettings(config.getProperties()).build();
		sessionFactory = config.buildSessionFactory(serviceRegistry);
	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
}