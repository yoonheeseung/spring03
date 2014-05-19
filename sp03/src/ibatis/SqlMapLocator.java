package ibatis;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlMapLocator {
  public static SqlMapClient getMapper(){
	 SqlMapClient sqlMapper;
	 try{
		 Reader reader=Resources.getResourceAsReader(
				 "SqlMapConfig.xml");
		 //입력스트림에 의해서 SqlMapConfig.xml파일을 읽어들임.
sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
//ibatis 실행 객체 생성
//ibatis는 데이터베이스 연동 ORM 프레임웍
        reader.close();
	 }catch(IOException e){
		 throw new RuntimeException(
				 "some"+e);
	 }
	 return sqlMapper;//ibatis실행 객체를 반환
  }//정적메서드 정의
}
