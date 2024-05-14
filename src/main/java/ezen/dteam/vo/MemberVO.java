package ezen.dteam.vo;

public class MemberVO {
	
	private int mno;
	private String mid;
	private String mpw;
	private String mnickNm;
	private String mname;
	private String mbirth;
	private String memail;
	private String mphone;
	private String mjoinDate;
	private String mgender;
	private String authority;
	private int enabled;
	private int isWithdrawn;

	public MemberVO() {}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMnickNm() {
		return mnickNm;
	}

	public void setMnickNm(String mnickNm) {
		this.mnickNm = mnickNm;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMbirth() {
		return mbirth;
	}

	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	public String getMjoinDate() {
		return mjoinDate;
	}

	public void setMjoinDate(String mjoinDate) {
		this.mjoinDate = mjoinDate;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}


	public String getMgender() {
		return mgender;
	}

	public void setMgender(String mgender) {
		this.mgender = mgender;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
	public int getIsWithdrawn() {
		return isWithdrawn;
	}

	public void setIsWithdrawn(int isWithdrawn) {
		this.isWithdrawn = isWithdrawn;
	}
	
}
