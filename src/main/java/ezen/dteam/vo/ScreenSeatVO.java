package ezen.dteam.vo;

public class ScreenSeatVO {
	private int sseatno;
	private String sseatCol;
	private int sseatRow;
	private String sseatType;
	private int shallno;
	
	private int cno;
	private int tno;
	private String sday;
	private String sstartTime;
	private int ticketdetailno;
	private int ticketDelyn;
	private int sno;
	
	
	public final int getSno() {
		return sno;
	}

	public final void setSno(int sno) {
		this.sno = sno;
	}

	public final int getTicketDelyn() {
		return ticketDelyn;
	}

	public final void setTicketDelyn(int ticketDelyn) {
		this.ticketDelyn = ticketDelyn;
	}

	public final int getTicketdetailno() {
		return ticketdetailno;
	}

	public final void setTicketdetailno(int ticketdetailno) {
		this.ticketdetailno = ticketdetailno;
	}

	public final int getCno() {
		return cno;
	}

	public final void setCno(int cno) {
		this.cno = cno;
	}

	public final int getTno() {
		return tno;
	}

	public final void setTno(int tno) {
		this.tno = tno;
	}

	public final String getSday() {
		return sday;
	}

	public final void setSday(String sday) {
		this.sday = sday;
	}

	public final String getSstartTime() {
		return sstartTime;
	}

	public final void setSstartTime(String sstartTime) {
		this.sstartTime = sstartTime;
	}

	public ScreenSeatVO() {
		
	}
	
	public ScreenSeatVO(int cno, String sstartTime, int sno) {
		this.cno = cno;
		this.sstartTime = sstartTime;
		this.sno = sno;
	}

	
	public ScreenSeatVO(int cno, int tno, String sday, String sstartTime, int shallno, int sno) {
		this.cno = cno;
		this.tno = tno;
		this.sday = sday;
		this.sstartTime = sstartTime;
		this.shallno = shallno;
		this.sno = sno;
	}

	public final int getSseatno() {
		return sseatno;
	}
	public final void setSseatno(int sseatno) {
		this.sseatno = sseatno;
	}
	public final String getSseatCol() {
		return sseatCol;
	}
	public final void setSseatCol(String sseatCol) {
		this.sseatCol = sseatCol;
	}
	public final int getSseatRow() {
		return sseatRow;
	}
	public final void setSseatRow(int sseatRow) {
		this.sseatRow = sseatRow;
	}
	public final String getSseatType() {
		return sseatType;
	}
	public final void setSseatType(String sseatType) {
		this.sseatType = sseatType;
	}
	public final int getShallno() {
		return shallno;
	}
	public final void setShallno(int shallno) {
		this.shallno = shallno;
	}
	
	

}
