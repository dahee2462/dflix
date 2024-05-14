package ezen.dteam.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import ezen.dteam.vo.MemberVO;
import ezen.dteam.vo.UserVO;


public class UserAuthenticationService implements UserDetailsService{

	SqlSession sqlSession;

	public UserAuthenticationService() {}
	public UserAuthenticationService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		

		MemberVO user
		=sqlSession.selectOne("ezen.dteam.mapper.userMapper.selectLogin",username);
	
		if(user == null) {
			//System.out.println("user::"+user);
			throw new UsernameNotFoundException(username);
		}
		
		List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		authority.add(new SimpleGrantedAuthority(user.getAuthority()));
		if(user.getIsWithdrawn()==1) {
			throw new UsernameNotFoundException(username);
		}
		
		UserVO vo = new UserVO(user.getMid(),
				user.getMpw(),
				(Integer)Integer.valueOf(user.getEnabled())==1,
				true,
				true,
				true,
				authority,
				user.getAuthority(),
				user.getMname(),
				user.getMemail(),
				user.getMphone(),
				user.getMbirth(),
				user.getMgender(),
				user.getMno(),
				user.getIsWithdrawn());

			return vo;
	}

}
