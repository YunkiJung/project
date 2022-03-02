package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.MemberDTO;
import sqlmap.SqlSessionManager;

public class MemberServiceImpl implements MemberService {

	//쿼리 실행하는 객체
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	
	@Override
	public int insertMember(MemberDTO memberDTO) {
		int n = sqlSession.insert("memberMapper.insertMember", memberDTO);
		sqlSession.commit();
		return n;
	}


	@Override
	public MemberDTO login(MemberDTO memberDTO) {
		MemberDTO result = sqlSession.selectOne("memberMapper.login", memberDTO);
		sqlSession.commit();
		return result;
	}
	
}
