package ezen.dteam.vo;

public class TheaterVO {
	
	private int tno;
	private String tname;
	private String tnameEn;
	private String taddr;
	private String tintro;
	private String tcall;
	private String sday;
	
	public TheaterVO() {};
	
	public TheaterVO(int tno, String sday) {
		super();
		this.tno = tno;
		this.sday = sday;
	}
	public String getSday() {
		return sday;
	}
	public void setSday(String sday) {
		this.sday = sday;
	}
	public final int getTno() {
		return tno;
	}
	public final void setTno(int tno) {
		this.tno = tno;
	}
	public final String getTname() {
		return tname;
	}
	public final void setTname(String tname) {
		this.tname = tname;
	}
	public final String getTnameEn() {
		return tnameEn;
	}
	public final void setTnameEn(String tnameEn) {
		this.tnameEn = tnameEn;
	}
	public final String getTaddr() {
		return taddr;
	}
	public final void setTaddr(String taddr) {
		this.taddr = taddr;
	}
	public final String getTintro() {
		return tintro;
	}
	public final void setTintro(String tintro) {
		this.tintro = tintro;
	}
	public final String getTcall() {
		return tcall;
	}
	public final void setTcall(String tcall) {
		this.tcall = tcall;
	}
	
}
