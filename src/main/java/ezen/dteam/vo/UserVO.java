package ezen.dteam.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class UserVO extends User{
	private int mno;
	private String mid;
	private String mpw;
	private String mname;
	private String authority;
	private String memail;
	private String mphone;
	private String mbirth;
	private String mgender;
	private int isWithdrawn;


	public UserVO(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities
			,String authority, String mname, String memail, String mphone, String mbirth, String mgender,int mno, int isWithdrawn) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		
		this.mid=username;
		this.mpw=password;
		this.authority=authority;
		this.mname=mname;
		this.memail=memail;
		this.mphone=mphone;
		this.mbirth=mbirth;	
		this.mgender=mgender;
		this.mno=mno;
		this.isWithdrawn=isWithdrawn;
	}

	
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

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
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


	public String getMbirth() {
		return mbirth;
	}


	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}

	public String getMgender() {
		return mgender;
	}


	public void setMgender(String mgender) {
		this.mgender = mgender;
	}

	public int getIsWithdrawn() {
		return isWithdrawn;
	}


	public void setIsWithdrawn(int isWithdrawn) {
		this.isWithdrawn = isWithdrawn;
	}

	
}
