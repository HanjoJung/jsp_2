package com.jhj.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jhj.util.DBConnector;

public class QnaDAO {
	public static void main(String[] args) throws Exception {
		QnaDAO qnaDAO = new QnaDAO();
		QnaDTO qnaDTO = new QnaDTO();
		for (int i = 0; i < 10; i++) {
			qnaDTO.setTitle("title" + i);
			qnaDTO.setContents("contents" + i);
			qnaDTO.setWriter("writer" + i);
			qnaDTO.setRef(1);
			qnaDTO.setStep(0);
			qnaDTO.setDepth(0);
			qnaDAO.insert(qnaDTO);
		}
	}

	public int getCount() throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select count(num) from qna";

		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);

		DBConnector.disConnect(rs, st, con);
		return result;
	}

	public void qnaHitUp(QnaDTO qnaDTO) throws Exception {

		Connection con = DBConnector.getConnect();
		String sql = "update notice set hit=? where num=?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, qnaDTO.getHit() + 1);
		st.setInt(2, qnaDTO.getNum());
		st.executeUpdate();

		DBConnector.disConnect(st, con);
	}

	// selectList
	public List<QnaDTO> selectList(int startRow, int lastRow, String kind, String search) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from " + "(select rownum r, q.* from " + "(select * from qna where " + kind
				+ " like ? order by ref DESC, step asc) q) " + "where r BETWEEN ? and ?";
		List<QnaDTO> ar = new ArrayList<>();

		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%" + search + "%");
		st.setInt(2, startRow);
		st.setInt(3, lastRow);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			QnaDTO qnaDTO = new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setContents(rs.getString("contents"));
			qnaDTO.setWriter(rs.getString("writer"));
			qnaDTO.setReg_date(rs.getDate("reg_date"));
			qnaDTO.setHit(rs.getInt("hit"));
			qnaDTO.setDepth(rs.getInt("depth"));
			ar.add(qnaDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}

	public QnaDTO selectOne(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from qna where num=?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		QnaDTO qnaDTO = new QnaDTO();
		if (rs.next()) {
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setContents(rs.getString("contents"));
			qnaDTO.setWriter(rs.getString("writer"));
			qnaDTO.setReg_date(rs.getDate("reg_date"));
			qnaDTO.setHit(rs.getInt("hit"));
			qnaDTO.setRef(rs.getInt("ref"));
			qnaDTO.setStep(rs.getInt("step"));
			qnaDTO.setDepth(rs.getInt("depth"));
		}
		DBConnector.disConnect(rs, st, con);
		return qnaDTO;
	}

	// insert
	public int insert(QnaDTO qnaDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "";
		if (qnaDTO.getRef() == 0) {
			sql = "insert into qna values(qna_seq.nextval,?,?,?,sysdate,0,qna_seq.currval,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, qnaDTO.getTitle());
			st.setString(2, qnaDTO.getContents());
			st.setString(3, qnaDTO.getWriter());
			st.setInt(4, qnaDTO.getStep()+1);
			st.setInt(5, qnaDTO.getDepth()+1);
			int result = st.executeUpdate();

			DBConnector.disConnect(st, con);
			return result;
		} else {
			sql = "update qna set step = step+1 where ref=? and step > ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, qnaDTO.getRef());
			st.setInt(2, qnaDTO.getStep());
			st.executeQuery();
			st.close();
			sql = "insert into qna values(qna_seq.nextval,?,?,?,sysdate,0,?,?,?)";
			st = con.prepareStatement(sql);
			st.setString(1, qnaDTO.getTitle());
			st.setString(2, qnaDTO.getContents());
			st.setString(3, qnaDTO.getWriter());
			st.setInt(4, qnaDTO.getRef());
			st.setInt(5, qnaDTO.getStep()+1);
			st.setInt(6, qnaDTO.getDepth()+1);
			int result = st.executeUpdate();

			DBConnector.disConnect(st, con);
			return result;
		}
	}
	public int reply(QnaDTO qnaDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "";
		sql = "update qna set step = step+1 where ref=? and step > ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, qnaDTO.getRef());
		st.setInt(2, qnaDTO.getStep());
		st.executeQuery();
		st.close();
		sql = "insert into qna values(qna_seq.nextval,?,?,?,sysdate,0,?,?,?)";
		st = con.prepareStatement(sql);
		st.setString(1, qnaDTO.getTitle());
		st.setString(2, qnaDTO.getContents());
		st.setString(3, qnaDTO.getWriter());
		st.setInt(4, qnaDTO.getRef());
		st.setInt(5, qnaDTO.getStep()+1);
		st.setInt(6, qnaDTO.getDepth()+1);
		int result = st.executeUpdate();

		DBConnector.disConnect(st, con);
		return result;
	}

	// update
	public int update(QnaDTO qnaDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "update qna set title=?, contents=?, writer=? where num=?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, qnaDTO.getTitle());
		st.setString(2, qnaDTO.getContents());
		st.setString(3, qnaDTO.getWriter());
		st.setInt(4, qnaDTO.getNum());
		int result = st.executeUpdate();

		DBConnector.disConnect(st, con);
		return result;
	}
	// delete

	public int delete(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "delete qna where num=?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		int result = st.executeUpdate();

		DBConnector.disConnect(st, con);
		return result;
	}
}
