package ezen.dteam.vo;

import java.util.List;

public class ScreenHallVO {
	private int shallno;
	private String shallType;
	private String shallLocation;
	private String shallSeat;
	private int tno;
	private List<ScreenVO> screenVO;
	
	private int sno;
	
	
	public final int getSno() {
		return sno;
	}
	public final void setSno(int sno) {
		this.sno = sno;
	}
	public ScreenHallVO(List<ScreenVO> screenVO) {
		super();
		this.screenVO = screenVO;
	}
	public ScreenHallVO() {
		super();
	}
	public List<ScreenVO> getScreenVO() {
		return screenVO;
	}
	public void setScreenVO(List<ScreenVO> screenVO) {
		this.screenVO = screenVO;
	}
	public final int getShallno() {
		return shallno;
	}
	public final void setShallno(int shallno) {
		this.shallno = shallno;
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
	public final int getTno() {
		return tno;
	}
	public final void setTno(int tno) {
		this.tno = tno;
	}
	
	
}
