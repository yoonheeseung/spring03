package dao;

import java.sql.SQLException;
import java.util.List;

import model.Board56Bean;

public interface BoardDAO {

	void insertB(Board56Bean b) throws SQLException;//저장

	List<Board56Bean> getList() throws SQLException;

	void updateHit(int no) throws SQLException;//조회수 증가

	Board56Bean getCont(int no) throws SQLException;//내용보기 수정폼/삭제폼 가져오기

	Board56Bean getPass(int no) throws SQLException;//디비에서 pass가져오기

	int updateB(Board56Bean bcont) throws SQLException;//디비에서 

	int delBoard(int no) throws SQLException;//삭제

}
