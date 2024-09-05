package Tables;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="Articles_Approvisionnement")
public class Articles_Approvisionnement {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int codeArt;
	@Column(name="qteCommandé")
	private int qteCommandé;
	@Column(name="datePrevueLivraison")
	private int datePrevueLivraison;
	public Articles_Approvisionnement() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Articles_Approvisionnement(int codeArt, int qteCommandé, int datePrevueLivraison) {
		super();
		this.codeArt = codeArt;
		this.qteCommandé = qteCommandé;
		this.datePrevueLivraison = datePrevueLivraison;
	}
	public int getCodeArt() {
		return codeArt;
	}
	public void setCodeArt(int codeArt) {
		this.codeArt = codeArt;
	}
	public int getQteCommandé() {
		return qteCommandé;
	}
	public void setQteCommandé(int qteCommandé) {
		this.qteCommandé = qteCommandé;
	}
	public int getDatePrevueLivraison() {
		return datePrevueLivraison;
	}
	public void setDatePrevueLivraison(int datePrevueLivraison) {
		this.datePrevueLivraison = datePrevueLivraison;
	}
	
	
}
