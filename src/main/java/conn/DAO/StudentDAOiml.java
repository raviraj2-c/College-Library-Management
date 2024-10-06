package conn.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import conn.entity.Student_regstration;

public class StudentDAOiml implements StudentDAO {

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
	
	
	
}
