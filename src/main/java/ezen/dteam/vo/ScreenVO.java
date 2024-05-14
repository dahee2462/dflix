package ezen.dteam.vo;

public class ScreenVO {
	private int sno;
	private String sstartTime;
	private String sendTime;
	private int cno;
	private int shallno;
	private String sday;
	private String cname;
	private String shallType;
	private String shallLocation;
	private String shallSeat;
	private int tno;
	private int fillSeat;
	
	
	
	public ScreenVO() {
		
	}

	public ScreenVO(int cno, int tno, String sday) {
		super();
		this.cno = cno;
		this.tno = tno;
		this.sday = sday;
	}
	
	public ScreenVO(int cno, int tno, String sday, String sstartTime, int shallno) {
		this.cno = cno;
		this.tno = tno;
		this.sday = sday;
		this.sstartTime = sstartTime;
		this.shallno = shallno;
	}
	
	public ScreenVO(int sno, String sstartTime, String sendTime, int cno, int tno, String sday, String cname, String shallType, String shallLocation, String shallSeat) {
	    this.sno = sno;
	    this.sstartTime = sstartTime;
	    this.sendTime = sendTime;
	    this.cno = cno;
	    this.tno = tno;
	    this.sday = sday;
	    this.cname = cname;
	    this.shallType = shallType;
	    this.shallLocation = shallLocation;
	    this.shallSeat = shallSeat;
	}
	
	
	
	public int getFillSeat() {
		return fillSeat;
	}

	public void setFillSeat(int fillSeat) {
		this.fillSeat = fillSeat;
	}

	public final String getShallType() {
		return shallType;
	}

	public final void setShallType(String shallType) {
		this.shallType = shallType;
	}

	public final String getShallLocation() {
		return shallLocation;
	}

	public final void setShallLocation(String shallLocation) {
		this.shallLocation = shallLocation;
	}

	public final String getShallSeat() {
		return shallSeat;
	}

	public final void setShallSeat(String shallSeat) {
		this.shallSeat = shallSeat;
	}

	public ScreenVO(String sstartTime, String sendTime, int cno, int shallno, String sday) {
		super();
		this.sstartTime = sstartTime;
		this.sendTime = sendTime;
		this.cno = cno;
		this.shallno = shallno;
		this.sday = sday;
	}


	public ScreenVO(int shallno, String sday) {
		super();
		this.shallno = shallno;
		
		this.sday = sday;
	}
	
	public ScreenVO(String sstartTime, int cno, String sday, int shallno) {
		super();
		this.sstartTime = sstartTime;
		this.cno = cno;
		this.sday = sday;
		this.shallno = shallno;
	}

	public String getSday() {
		return sday;
	}
	public void setSday(String sday) {
		this.sday = sday;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
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
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getShallno() {
		return shallno;
	}
	public void setShallno(int shallno) {
		this.shallno = shallno;
	}

	public int getTno() {
		return tno;
	}

	public void setTno(int tno) {
		this.tno = tno;
	}
	
	
}
