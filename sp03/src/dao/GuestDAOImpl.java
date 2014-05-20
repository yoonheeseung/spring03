package dao;

import ibatis.SqlMapLocator;

import java.sql.SQLException;
import java.util.List;

import model.Guest78Bean;

public class GuestDAOImpl implements GuestDAO {
 /*
  * ibatis 쿼리문 실행 메서드(월말평가 문제)
  * 1.insert():레코드 저장
  * 2.update():레코드 수정
  * 3.delete():레코드 삭제
  * 4.queryForObject():단 하나의 레코드만 검색
  * 5.queryForList():하나 이상 레코드를 검색해서 컬렉션List로 반환할때 사용한다.
  */
	
	/* 방명록 저장 */
	@Override
	public void insertG(Guest78Bean g) throws SQLException {
		SqlMapLocator.getMapper().insert("g_in",g);
		
	}

	/* 총 게시물 수 */
	@Override
	public int getListCount() throws SQLException {
		int count=0;
		count = (int) SqlMapLocator.getMapper().queryForObject("g_count");
		return count;
	}

	/* 목록 */
	@Override
	public List<Guest78Bean> getGuestList(Guest78Bean g) throws SQLException {
		return SqlMapLocator.getMapper().queryForList("glist",g);
	}

	@Override
	public int updateHit(int no) throws SQLException {
		return SqlMapLocator.getMapper().update("ghit",no);
		
	}

	/* 수정폼+내용보기+삭제폼+답변글폼 */
	@Override
	public Guest78Bean getCont(int no) throws SQLException {
		
		return (Guest78Bean) SqlMapLocator.getMapper().queryForObject("gcont",no);
	}

}
