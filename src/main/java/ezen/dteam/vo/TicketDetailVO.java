package ezen.dteam.vo;

public class TicketDetailVO {
	private int ticketdetailno;
	private int ticketno;
	private int sno;
	private int sseatno;
	private String ticketDate;
	private String sseatCol;
	private String sseatRow;
	private String sseatType;
	private int shallno;		//상영관 번호
	private String sstartTime;	//상영시작시간
	private String sendTime;	//상영종료시간
	private String cname; 		//영화명
	private String tname;		//극장명
	private String shallType;	//상영관타입
	private String shallLocation; //상영관정보
	private String sday; //예약일
	private int mno;
	private int ticketDelyn;
	
	

	public TicketDetailVO() {
		
	}
	
	public TicketDetailVO(int sseatno, int mno, int sno) {
		super();
		this.sseatno = sseatno;
		this.mno = mno;
		this.sno = sno;
	}
	
	public TicketDetailVO(int sseatno, int mno) {
		super();
		this.sseatno = sseatno;
		this.mno = mno;
	}
	
	public final int getTicketDelyn() {
		return ticketDelyn;
	}

	public final void setTicketDelyn(int ticketDelyn) {
		this.ticketDelyn = ticketDelyn;
	}
	
	public final int getMno() {
		return mno;
	}
	public final void setMno(int mno) {
		this.mno = mno;
	}
	public int getShallno() {
		return shallno;
	}
	public void setShallno(int shallno) {
		this.shallno = shallno;
	}
	public String getSstartTime() {
		return sstartTime;
	}
	public void setSstartTime(String sstartTime) {
		this.sstartTime = sstartTime;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getShallType() {
		return shallType;
	}
	public void setShallType(String shallType) {
		this.shallType = shallType;
	}
	public String getShallLocation() {
		return shallLocation;
	}
	public void setShallLocation(String shallLocation) {
		this.shallLocation = shallLocation;
	}
	public String getSday() {
		return sday;
	}
	public void setSday(String sday) {
		this.sday = sday;
	}
	public String getSseatType() {
		return sseatType;
	}
	public void setSseatType(String sseatType) {
		this.sseatType = sseatType;
	}
	public String getSseatCol() {
		return sseatCol;
	}
	public void setSseatCol(String sseatCol) {
		this.sseatCol = sseatCol;
	}
	public String getSseatRow() {
		return sseatRow;
	}
	public void setSseatRow(String sseatRow) {
		this.sseatRow = sseatRow;
	}
	public final int getTicketdetailno() {
		return ticketdetailno;
	}
	public final void setTicketdetailno(int ticketdetailno) {
		this.ticketdetailno = ticketdetailno;
	}
	public final int getTicketno() {
		return ticketno;
	}
	public final void setTicketno(int ticketno) {
		this.ticketno = ticketno;
	}
	public final int getSno() {
		return sno;
	}
	public final void setSno(int sno) {
		this.sno = sno;
	}
	public final int getSseatno() {
		return sseatno;
	}
	public final void setSseatno(int sseatno) {
		this.sseatno = sseatno;
	}
	public final String getTicketDate() {
		return ticketDate;
	}
	public final void setTicketDate(String ticketDate) {
		this.ticketDate = ticketDate;
	}
	@Override
	public String toString() {
		return "TicketDetailVO [ticketdetailno=" + ticketdetailno + ", ticketno=" + ticketno + ", sno=" + sno
				+ ", sseatno=" + sseatno + ", ticketDate=" + ticketDate + ", sseatCol=" + sseatCol + ", sseatRow="
				+ sseatRow + ", sseatType=" + sseatType + ", shallno=" + shallno + ", sstartTime=" + sstartTime
				+ ", sendTime=" + sendTime + ", cname=" + cname + ", tname=" + tname + ", shallType=" + shallType
				+ ", shallLocation=" + shallLocation + ", sday=" + sday + "]";
	}
}
