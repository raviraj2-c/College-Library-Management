package conn.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.DB.DBConnect;
import conn.entity.Add_book;
import conn.entity.Issue_book;

public class IssueDAOiml implements IssueDAO {

	private Connection conn;

	public IssueDAOiml(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean Issue(Issue_book b) {
boolean f = false;
		
		try {
			String sql = "insert into issue_book(Id,Name,Department,Phone_number,College_id,Addres,Book_Name,Auther,Category,Book_id,Date) values(?,?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			
			
			ps.setInt(1, b.getId());
			ps.setString(2, b.getName());
			ps.setString(3, b.getDepartment());
			ps.setString(4, b.getPhone_number());
			ps.setString(5, b.getCollege_id());
			ps.setString(6, b.getAddres());
			ps.setString(7, b.getBook_Name());
			ps.setString(8, b.getAuther());
			ps.setString(9, b.getCategory());
			ps.setString(10, b.getBook_id());
			ps.setString(11, b.getDate());
			
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public List<Issue_book> getAllIssue() {

		List<Issue_book> list = new ArrayList<Issue_book>();
		Issue_book b = null;

		try {

			String sql = "select * from issue_book";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new Issue_book();
				b.setId(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setDepartment(rs.getString(3));
				b.setPhone_number(rs.getString(4));
				b.setCollege_id(rs.getString(5));
				b.setAddres(rs.getString(6));
				
				b.setBook_Name(rs.getString(7));
				b.setAuther(rs.getString(8));
				b.setCategory(rs.getString(9));
				b.setBook_id(rs.getString(10));
				b.setDate(rs.getString(11));
				
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Issue_book getAllIssueId(int id) {
		Issue_book b = null;

		try {
			String sql = "select * from issue_book where Id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				b = new Issue_book();
				b.setId(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setDepartment(rs.getString(3));
				b.setPhone_number(rs.getString(4));
				b.setCollege_id(rs.getString(5));
				b.setAddres(rs.getString(6));
				
				b.setBook_Name(rs.getString(7));
				b.setAuther(rs.getString(8));
				b.setCategory(rs.getString(9));
				b.setBook_id(rs.getString(10));
				b.setDate(rs.getString(11));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public boolean returnbook(int id) {
		boolean f = false;
		try {
			String sql = "delete from issue_book where Id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	
		public int getIssuedBookCountByStudent(String College_id) {
	        int count = 0;
	        String query = "SELECT COUNT(*) FROM issue_book WHERE College_id = ? AND return_date IS NULL";

	        try (Connection conn = DBConnect.getConn();
	             PreparedStatement ps = conn.prepareStatement(query)) {
	            ps.setString(1, College_id);  // Use setString to bind the studentId
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                count = rs.getInt(1);  // Get the count as an integer
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return count;
	    
	}

	

	
}
