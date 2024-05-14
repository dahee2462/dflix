package ezen.dteam.vo;

import java.util.List;
import java.util.Set;

public class CinemaVO {
	
	private int cno;
	private String ccode;
	private String cname;
	private String cnameEn; 
	private String cintro; 
	private String cprdtYear; 
	private String cshowTime; 
	private String copenDate;
	private String cprdtStatNm;
	private String cnationNm; 
	private String cgenreNm; 
	private String cdirectorNm; 
	private String cdirectorNmEn; 
	private String cactorNm; 
	private String cactorNmEn; 
	private String ccompanyNm; 
	private String ccompanyNmEn; 
	private String cwatchGradeNm;
	private String crank;
	private String cposter;
	
	private Set<ScreenHallVO> screenHallVOSet;
	
	private List<ScreenHallVO> screenHallVOList;
	
	
	
	
	public CinemaVO(Set<ScreenHallVO> screenHallVOSet, List<ScreenHallVO> screenHallVOList) {
		super();
		this.screenHallVOSet = screenHallVOSet;
		this.screenHallVOList = screenHallVOList;
	}
	
	
	public CinemaVO() {
		super();
	}
	public List<ScreenHallVO> getScreenHallVOList() {
		return screenHallVOList;
	}
	public void setScreenHallVOList(List<ScreenHallVO> screenHallVOList) {
		this.screenHallVOList = screenHallVOList;
	}
	public Set<ScreenHallVO> getScreenHallVOSet() {
		return screenHallVOSet;
	}
	public void setScreenHallVOSet(Set<ScreenHallVO> screenHallVOSet) {
		this.screenHallVOSet = screenHallVOSet;
	}
	public final int getCno() {
		return cno;
	}
	public final void setCno(int cno) {
		this.cno = cno;
	}
	public final String getCcode() {
		return ccode;
	}
	public final void setCcode(String ccode) {
		this.ccode = ccode;
	}
	public final String getCname() {
		return cname;
	}
	public final void setCname(String cname) {
		this.cname = cname;
	}
	public final String getCnameEn() {
		return cnameEn;
	}
	public final void setCnameEn(String cnameEn) {
		this.cnameEn = cnameEn;
	}
	public final String getCintro() {
		return cintro;
	}
	public final void setCintro(String cintro) {
		this.cintro = cintro;
	}
	public final String getCprdtYear() {
		return cprdtYear;
	}
	public final void setCprdtYear(String cprdtYear) {
		this.cprdtYear = cprdtYear;
	}
	public final String getCshowTime() {
		return cshowTime;
	}
	public final void setCshowTime(String cshowTime) {
		this.cshowTime = cshowTime;
	}
	public final String getCopenDate() {
		return copenDate;
	}
	public final void setCopenDate(String copenDate) {
		this.copenDate = copenDate;
	}
	public final String getCprdtStatNm() {
		return cprdtStatNm;
	}
	public final void setCprdtStatNm(String cprdtStatNm) {
		this.cprdtStatNm = cprdtStatNm;
	}
	public final String getCnationNm() {
		return cnationNm;
	}
	public final void setCnationNm(String cnationNm) {
		this.cnationNm = cnationNm;
	}
	public final String getCgenreNm() {
		return cgenreNm;
	}
	public final void setCgenreNm(String cgenreNm) {
		this.cgenreNm = cgenreNm;
	}
	public final String getCdirectorNm() {
		return cdirectorNm;
	}
	public final void setCdirectorNm(String cdirectorNm) {
		this.cdirectorNm = cdirectorNm;
	}
	public final String getCdirectorNmEn() {
		return cdirectorNmEn;
	}
	public final void setCdirectorNmEn(String cdirectorNmEn) {
		this.cdirectorNmEn = cdirectorNmEn;
	}
	public final String getCactorNm() {
		return cactorNm;
	}
	public final void setCactorNm(String cactorNm) {
		this.cactorNm = cactorNm;
	}
	public final String getCactorNmEn() {
		return cactorNmEn;
	}
	public final void setCactorNmEn(String cactorNmEn) {
		this.cactorNmEn = cactorNmEn;
	}
	public final String getCcompanyNm() {
		return ccompanyNm;
	}
	public final void setCcompanyNm(String ccompanyNm) {
		this.ccompanyNm = ccompanyNm;
	}
	public final String getCcompanyNmEn() {
		return ccompanyNmEn;
	}
	public final void setCcompanyNmEn(String ccompanyNmEn) {
		this.ccompanyNmEn = ccompanyNmEn;
	}
	public final String getCwatchGradeNm() {
		return cwatchGradeNm;
	}
	public final void setCwatchGradeNm(String cwatchGradeNm) {
		this.cwatchGradeNm = cwatchGradeNm;
	}
	public final String getCrank() {
		return crank;
	}
	public final void setCrank(String crank) {
		this.crank = crank;
	}
	public final String getCposter() {
		return cposter;
	}
	public final void setCposter(String cposter) {
		this.cposter = cposter;
	}
	
	private int dday;

	public final int getDday() {
		return dday;
	}
	public final void setDday(int dday) {
		this.dday = dday;
	}
	
	
}
