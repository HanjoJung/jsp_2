package com.jhj.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jhj.util.DBConnector;

public class NoticeDAO {

	// insert
	public int insert(NoticeDTO dto) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "insert into notice values(notice_seq.nextval,?,?,?,sysdate,?)";

		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, dto.getTitle());
		st.setString(2, dto.getContents());
		st.setString(3, dto.getWriter());
		st.setInt(4, 0);
		int result = st.executeUpdate();

		DBConnector.disConnect(st, con);

		return result;
	}

	// delete
	public int delete(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "delete from notice where num=?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		int result = st.executeUpdate();

		DBConnector.disConnect(st, con);

		return result;
	}
	// update
	public int updete(NoticeDTO dto) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "update notice set title=?, contents=?, writer=?, hit=? where num=?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, dto.getTitle());
		st.setString(2, dto.getContents());
		st.setString(3, dto.getWriter());
		st.setInt(4, dto.getHit());
		st.setInt(5, dto.getNum());
		int result = st.executeUpdate();

		DBConnector.disConnect(st, con);

		return result;
	}

	// select

	public List<NoticeDTO> selectList() throws Exception {
		Connection con = DBConnector.getConnect();
		List<NoticeDTO> ar = new ArrayList<>();
		String sql = "select * from notice order by num desc";

		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			NoticeDTO dto = new NoticeDTO();
			dto.setNum(rs.getInt("num"));
			dto.setTitle(rs.getString("title"));
			dto.setContents(rs.getString("contents"));
			dto.setWriter(rs.getString("writer"));
			dto.setReg_date(rs.getDate("reg_date"));
			dto.setHit(rs.getInt("hit"));
			ar.add(dto);
		}

		DBConnector.disConnect(rs, st, con);
		return ar;
	}

	public NoticeDTO selectOne(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from notice where num=?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		NoticeDTO dto = new NoticeDTO();
		while (rs.next()) {
			dto.setNum(rs.getInt("num"));
			dto.setTitle(rs.getString("title"));
			dto.setContents(rs.getString("contents"));
			dto.setWriter(rs.getString("writer"));
			dto.setReg_date(rs.getDate("reg_date"));
			dto.setHit(rs.getInt("hit"));
		}

		DBConnector.disConnect(rs, st, con);
		return dto;
	}
	
	public void noticeHitUp(NoticeDTO dto) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "update notice set hit=? where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, dto.getHit()+1);
		st.setInt(2, dto.getNum());
		st.executeUpdate();
		
		DBConnector.disConnect(st, con);
	}
}
