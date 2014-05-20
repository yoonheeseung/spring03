package dao;

import java.sql.SQLException;
import java.util.List;

import model.Guest78Bean;

public interface GuestDAO {

	void insertG(Guest78Bean g) throws SQLException;//게시판 저장

	int getListCount() throws SQLException;//총 게시물 수

	List<Guest78Bean> getGuestList(Guest78Bean g) throws SQLException;//목록

	int updateHit(int no) throws SQLException;//조회수 증가

	Guest78Bean getCont(int no) throws SQLException;
	//내용보기+수정폼+답변글폼+삭제폼

}
