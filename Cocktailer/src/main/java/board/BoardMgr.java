package board;

import java.sql.Connection;
import java.sql.PreparedStatement; //쿼리 실행을 위해 사용
import java.sql.ResultSet; // 쿼리 실행결과를 저장시 사용
import java.util.Vector; //VO를 여러개 저장시 사용
import javax.servlet.http.HttpServletRequest; //request(요청) 객체 사용
import com.kmc.dbcp.DBConnectionMgr; //DBCP 객체

public class BoardMgr {
	private DBConnectionMgr pool;
	private static final String ENCTYPE = "UTF-8";
	
	public BoardMgr( ) {
		try { pool = DBConnectionMgr.getInstance( );
		}catch(Exception e) { e.printStackTrace( ); }
	}
	
	public Vector<BoardBean> getBoardList(String keyField, String keyWord, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>( );
		
		try {
			con = pool.getConnection( ); 
			if (keyWord.equals("null") || keyWord.equals("")) { //검색어 없을시
				sql = "select * FROM booking order by ref desc, pos limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			}else { // 검색어 있을시
				sql = "select * FROM booking where " + keyField + " like ? ";
				sql += "order by ref desc limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%"); 
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery( );
			
			while (rs.next( )) {
				BoardBean bean = new BoardBean( );
				bean.setNum(rs.getInt("num"));
				bean.setEvent(rs.getString("event"));
				bean.setName(rs.getString("name"));
				bean.setTel(rs.getString("tel"));
				bean.setMember(rs.getInt("member"));
				bean.setvDate(rs.getString("vDate"));
				bean.setState(rs.getString("state"));
				bean.setRef(rs.getInt("ref"));
				bean.setPos(rs.getInt("pos"));
				bean.setDepth(rs.getInt("depth"));
				vlist.add(bean);
			}
		}catch(Exception e) { e.printStackTrace( ); }
		finally { pool.freeConnection(con, pstmt, rs); }
		return vlist; //
	}
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		
		try {
			con = pool.getConnection( );
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(num) from booking";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(num) from booking where " + keyField + " like ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery( );
			if (rs.next( )) { 	totalCount = rs.getInt(1); }
		} catch(Exception e) { e.printStackTrace( ); }
		finally { pool.freeConnection(con, pstmt, rs); }
		return totalCount; 
	}
	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			con = pool.getConnection( );
			sql = "select max(num) from booking";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery( );
			int ref = 1;
			if(rs.next( )) ref = rs.getInt(1) + 1;
			
			sql = "insert booking(event,name,tel,member,vDate,pass,ref,pos,depth)";
			sql += "values(?, ?, ?, ?, ?, ?, ?, 0, 0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("event"));
			pstmt.setString(2, req.getParameter("name"));
			pstmt.setString(3, req.getParameter("tel"));
			pstmt.setInt(4, Integer.parseInt(req.getParameter("member")));
			pstmt.setString(5, req.getParameter("vDate"));
			pstmt.setString(6, req.getParameter("pass"));
			pstmt.setInt(7, ref);
			pstmt.executeUpdate( );
		}
		catch(Exception e) { e.printStackTrace( ); }
		finally { pool.freeConnection(con, pstmt, rs); }
	}
	
	public MemberBean getPass() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemberBean memBean = new MemberBean();
		
		try {
			con = pool.getConnection();
			sql = "select * from tblMember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "admin");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				memBean.setPass(rs.getString("pass"));
			}
		}catch(Exception e) { e.printStackTrace( ); }
		finally { pool.freeConnection(con, pstmt, rs); }
		return memBean;
	}
	
	public BoardBean getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean( );
		
		try {
			con = pool.getConnection( );
			sql = "select * from booking where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery( );
			if (rs.next( )) {
				bean.setNum(rs.getInt("num"));
				bean.setEvent(rs.getString("event"));
				bean.setName(rs.getString("name"));
				bean.setTel(rs.getString("tel"));
				bean.setMember(rs.getInt("member"));
				bean.setvDate(rs.getString("vDate"));
				bean.setState(rs.getString("state"));
				bean.setPass(rs.getString("pass"));
				
				bean.setRef(rs.getInt("ref"));
				bean.setPos(rs.getInt("pos"));
				bean.setDepth(rs.getInt("depth"));
			}
		} 
		catch(Exception e) { e.printStackTrace( ); }
		finally { pool.freeConnection(con, pstmt, rs); }
		return bean;
	}

	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection( );
			sql = "delete from booking where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate( );
		} catch (Exception e) { e.printStackTrace( );
		} finally { pool.freeConnection(con, pstmt, rs); }
	}

	
	public void updateBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection( );
			sql = "update booking set event=?,name=?,tel=?,member=?,vDate=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getEvent( ));
			pstmt.setString(2, bean.getName( ));
			pstmt.setString(3, bean.getTel( ));
			pstmt.setInt(4, bean.getMember( ));
			pstmt.setString(5, bean.getvDate( ));
			pstmt.setInt(6, bean.getNum( ));
			pstmt.executeUpdate( );
		} catch(Exception e) { e.printStackTrace( );
		} finally { pool.freeConnection(con, pstmt);
		}
	}
	
	public void updateState(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection( );
			sql = "update booking set state=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getState( ));
			pstmt.setInt(2, bean.getNum( ));
			pstmt.executeUpdate( );
		} catch(Exception e) { e.printStackTrace( );
		} finally { pool.freeConnection(con, pstmt);
		}
	}
	
	public void post1000( ) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection( );
			for (int i = 1; i < 1001; i++) {
			sql = "insert booking(event,name,tel,member,vDate,state,pass,ref,pos,depth)";
			sql += "values('칵테일 클래스','마로니에','010-1234-5678','3','2021-12-17','처리대기중','1234',"+i+",0,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			}
		}
		catch (Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt); }
	}
	
	
	public static void main(String[] args) {
		new BoardMgr( ).post1000();
		System.out.println("SUCCESS");
	}

}//public class BoardMgr END 