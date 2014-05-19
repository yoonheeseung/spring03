package dao;

import ibatis.SqlMapLocator;

import java.sql.SQLException;
import java.util.List;

import model.Board56Bean;

public class BoardDAOImpl implements BoardDAO {

	/*
	 * 월말평가 문제
	 * ibatis 쿼리문 실행 메서드
	 * 	1.insert():레코드 저장
	 *  2.update():레코드 수정
	 *  3.delete():레코드 삭제
	 *  4.queryForObjec():단 하나의 레코드만 검색할때
	 *  5.queryForList():하나 이상 레코드를 검색해서 컬렉션 List로 반환할때
	 */
	@Override
	public void insertB(Board56Bean b) throws SQLException {
	SqlMapLocator.getMapper().insert("b_in",b);
		
	}//저장

	@Override
	public List<Board56Bean> getList() throws SQLException {
		return SqlMapLocator.getMapper().queryForList("blist");
	}//목록

	@Override
	public void updateHit(int no) throws SQLException {
		SqlMapLocator.getMapper().update("bhit",no);
	}//조회수 증가

	@Override
	public Board56Bean getCont(int no) throws SQLException {
		return (Board56Bean) SqlMapLocator.getMapper().queryForObject("bcont",no);
	}//내용보기+수정폼,삭제폼

	@Override
	public Board56Bean getPass(int no) throws SQLException {
		return (Board56Bean) SqlMapLocator.getMapper().queryForObject("bpass",no);
	}

	@Override
	public int updateB(Board56Bean bcont) throws SQLException {
		int re=0;
		re=SqlMapLocator.getMapper().update("bcontUp", bcont);
		return re;		
	}

	@Override
	public int delBoard(int no) throws SQLException {
	   return SqlMapLocator.getMapper().delete("delB",no);

	}
	
	

}
