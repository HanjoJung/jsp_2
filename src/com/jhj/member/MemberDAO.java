package com.jhj.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jhj.util.DBConnector;

public class MemberDAO {
	public int getCount() throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select count(id) from member";
		
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);
		
		DBConnector.disConnect(rs, st, con);
		return result;
	}
	//select
	public List<MemberDTO> selectList() throws Exception{
		Connection con = DBConnector.getConnect();
		List<MemberDTO> ar = new ArrayList<>();
		String sql = "select id, pw, name, email, kind, m.classMate, grade, ban from member m " + 
				"LEFT JOIN team t on (m.classmate = t.classmate) ORDER by t.grade, t.ban, m.id";
		
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			MemberDTO dto = new MemberDTO();
			dto.setId(rs.getString("id"));
			dto.setPw(rs.getString("pw"));
			dto.setName(rs.getString("name"));
			dto.setEmail(rs.getString("email"));
			dto.setKind(rs.getString("kind"));
			dto.setClassMate(rs.getString("classmate"));
			dto.setGrade(rs.getInt("grade"));
			dto.setBan(rs.getInt("ban"));
			ar.add(dto);
			}
		
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	//select
	public MemberDTO selectOne() throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select id, pw, name, email, kind, m.classMate, grade, ban from member m " + 
				"LEFT JOIN team t on (m.classmate = t.classmate) ORDER by t.grade, t.ban, m.id where id=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		MemberDTO dto = new MemberDTO();
		if(rs.next()) {
			dto.setId(rs.getString("id"));
			dto.setPw(rs.getString("pw"));
			dto.setName(rs.getString("name"));
			dto.setEmail(rs.getString("email"));
			dto.setKind(rs.getString("kind"));
			dto.setClassMate(rs.getString("classmate"));
			dto.setGrade(rs.getInt("grade"));
			dto.setBan(rs.getInt("ban"));
		}
		
		DBConnector.disConnect(rs, st, con);
		return dto;
	}
	//insert
	public int insert(MemberDTO dto) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "insert into member values(?,?,?,?,?,?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, dto.getId());
		st.setString(2, dto.getPw());
		st.setString(3, dto.getName());
		st.setString(4, dto.getEmail());
		st.setString(5, dto.getKind());
		st.setString(6, dto.getClassMate());
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		return result;
	}
	//delete
	//update
}
