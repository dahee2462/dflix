package ezen.dteam.service;

import ezen.dteam.vo.MemberVO;

public interface UserSVC {
	public int checkId(String id) throws Exception;
	public int checkNickNm(String nickNm) throws Exception;
	public int checkEmail(String email) throws Exception;
	public String searchId(MemberVO vo) throws Exception;
	public int updatePw(MemberVO vo) throws Exception;
}
