package conn.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import conn.entity.Add_book;

public class AddbookDAOiml implements AddbookDAO {
	
	private Connection conn;

	public AddbookDAOiml(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addbook(Add_book b) {
		boolean f = false;
		try {
			
			String sql = "insert into all_books(Id,Book_Name,Auther,Category,Book_id) values(?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, b.getId());
			ps.setString(2, b.getBook_Name());
			ps.setString(3, b.getAuther());
			ps.setString(4, b.getCategory());
			ps.setString(5, b.getBook_id());
			
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
