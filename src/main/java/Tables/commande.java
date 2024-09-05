package Tables;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Date;
@Entity
@Table(name="commande")
public class commande {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private int codeCmd;
	
	@Column(name="client")
	private String client;
	
	@Column(name="codeArt")
	private int codeArt;
	
	@Column(name="qteCmd")
	private int qteCmd;
	
	@Column(name="dateCmd")
	private Date dateCmd;

	public int getCodeCmd() {
		return codeCmd;
	}

	public void setCodeCmd(int codeCmd) {
		this.codeCmd = codeCmd;
	}

	public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	public int getCodeArt() {
		return codeArt;
	}

	public void setCodeArt(int codeArt) {
		this.codeArt = codeArt;
	}

	public int getQteCmd() {
		return qteCmd;
	}

	public void setQteCmd(int qteCmd) {
		this.qteCmd = qteCmd;
	}

	public Date getDateCmd() {
		return dateCmd;
	}

	public void setDateCmd(Date dateCmd) {
		this.dateCmd = dateCmd;
	}

	public commande(int codeCmd, String client, int codeArt, int qteCmd, Date dateCmd) {
		super();
		this.codeCmd = codeCmd;
		this.client = client;
		this.codeArt = codeArt;
		this.qteCmd = qteCmd;
		this.dateCmd = dateCmd;
	}

	public commande() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
