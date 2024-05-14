package ezen.dteam.vo;

public class BoardVO {
	private int bno;
	private String btitle;
	private String bcontent;
	private String brdate;
	private int bhit;
	private String btype;
	private int bdelyn;
	private String mname;
	private String replyCnt;
	private int mno;
	
	public BoardVO(){}
	
	
	
	public BoardVO(String btitle, String bcontent, int mno) {
		super();
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.mno = mno;
	}



	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getBno() {
		return bno;
	}
	public String getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(String replyCnt) {
		this.replyCnt = replyCnt;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBrdate() {
		return brdate;
	}
	public void setBrdate(String brdate) {
		this.brdate = brdate;
	}
	public int getBhit() {
		return bhit;
	}
	public void setBhit(int bhit) {
		this.bhit = bhit;
	}
	public String getBtype() {
		return btype;
	}
	public void setBtype(String btype) {
		this.btype = btype;
	}
	public int getBdelyn() {
		return bdelyn;
	}
	public void setBdelyn(int bdelyn) {
		this.bdelyn = bdelyn;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
}
