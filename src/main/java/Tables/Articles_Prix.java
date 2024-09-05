package Tables;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Articles_Prix")
public class Articles_Prix {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int codeArt;
	
	@Column(name="nomArt")
	private String nomArt;
	
	@Column(name="descArt")
	private String descArt;
	
	@Column(name="prixArt")
	private int prixArt;

	public Articles_Prix() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Articles_Prix(int codeArt, String nomArt, String descArt, int prixArt) {
		super();
		this.codeArt = codeArt;
		this.nomArt = nomArt;
		this.descArt = descArt;
		this.prixArt = prixArt;
	}

	public int getCodeArt() {
		return codeArt;
	}

	public void setCodeArt(int codeArt) {
		this.codeArt = codeArt;
	}

	public String getNomArt() {
		return nomArt;
	}

	public void setNomArt(String nomArt) {
		this.nomArt = nomArt;
	}

	public String getDescArt() {
		return descArt;
	}

	public void setDescArt(String descArt) {
		this.descArt = descArt;
	}

	public int getPrixArt() {
		return prixArt;
	}

	public void setPrixArt(int prixArt) {
		this.prixArt = prixArt;
	}
	
	

}
