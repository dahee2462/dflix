package ezen.dteam.vo;

public class IcmtReplyVO {
	private int icmtno;
	private String icmtContent;
	private String icmtRdate;
	private String bno;
	private int mno;
	
	public IcmtReplyVO() {}
	
	public IcmtReplyVO(String icmtContent, String bno, int mno) {
		super();
		this.icmtContent = icmtContent;
		this.bno = bno;
		this.mno = mno;
	}
	
	public int getIcmtno() {
		return icmtno;
	}
	public void setIcmtno(int icmtno) {
		this.icmtno = icmtno;
	}
	public String getIcmtContent() {
		return icmtContent;
	}
	public void setIcmtContent(String icmtContent) {
		this.icmtContent = icmtContent;
	}
	public String getIcmtRdate() {
		return icmtRdate;
	}
	public void setIcmtRdate(String icmtRdate) {
		this.icmtRdate = icmtRdate;
	}
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	
	
}
