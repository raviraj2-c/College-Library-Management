package conn.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import conn.DB.DBConnect;
import conn.entity.Add_book;
import conn.entity.Student_regstration;

public  class StudentDAOiml implements StudentDAO {

	private Connection conn;

	public StudentDAOiml(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean studentadd(Student_regstration b) {
		boolean f = false;
		
		try {
			String sql = "insert into callege_library_managment(Id,Name,Department,Phone_number,College_id,Addres) values(?,?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, b.getId());
			ps.setString(2, b.getName());
			ps.setString(3, b.getDepartment());
			ps.setString(4, b.getPhone_number());
			ps.setString(5, b.getCollege_id());
			ps.setString(6, b.getAddres());
			
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
	public List<Student_regstration> searchStudents(String query) {
		 List<Student_regstration> students = new ArrayList<>();
	        try {
	            Connection conn = DBConnect.getConn();
	            String sql = "SELECT * FROM callege_library_managment WHERE Name LIKE ?";
	            PreparedStatement pst = conn.prepareStatement(sql);
	            pst.setString(1, "%" + query + "%");
	            ResultSet rs = pst.executeQuery();
	            while (rs.next()) {
	            	Student_regstration student = new Student_regstration();
	                student.setId(rs.getInt("id"));
	                student.setName(rs.getString("name"));
	                student.setDepartment(rs.getString("department"));
	                student.setPhone_number(rs.getString("Phone_number"));
	                student.setCollege_id(rs.getString("College_id"));
	                students.add(student);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return students;
	}

	
	
	
	
}
