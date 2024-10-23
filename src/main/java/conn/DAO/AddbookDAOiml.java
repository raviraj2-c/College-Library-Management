package conn.DAO;

import java.sql.Connection;  

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import conn.DB.DBConnect;
import conn.entity.Add_book;
import conn.entity.Student_regstration;

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

	
	
	
	@Override
	public List<Add_book> getAllbook() {

		List<Add_book> list = new ArrayList<Add_book>();
		Add_book b = null;

		try {

			String sql = "select * from All_books";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new Add_book();
				b.setId(rs.getInt(1));
				
				b.setBook_Name(rs.getString(2));
				b.setAuther(rs.getString(3));
				b.setCategory(rs.getString(4));
				b.setBook_id(rs.getString(5));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
		
	}

	@Override
	public boolean deletebooks(int id) {
		boolean f = false;
		try {
			String sql = "delete from All_books where Id=?";
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
	public Add_book getBookById(int id) {
		Add_book b = null;

		try {
			String sql = "select * from All_books where Id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				b = new Add_book();
				b.setId(rs.getInt(1));
				b.setBook_Name(rs.getString(2));
				b.setAuther(rs.getString(3));
				b.setCategory(rs.getString(4));
				b.setBook_id(rs.getString(5));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public boolean updateEditBooks(Add_book b) {
		boolean f = false;

		try {
			String sql = "update All_books set Book_Name=?,Auther=?,Category=?,Book_id=? where Id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBook_Name());
			ps.setString(2, b.getAuther());
			ps.setString(3, b.getCategory());
			ps.setString(4, b.getBook_id());
			ps.setInt(5, b.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	@Override
	public List<Add_book> searchBooks(String query) {
		List<Add_book> books = new ArrayList<>();
        try {
            Connection conn = DBConnect.getConn();
            String sql = "SELECT * FROM all_books WHERE Book_Name LIKE ? OR Auther LIKE ? OR Category LIKE ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, "%" + query + "%");
            pst.setString(2, "%" + query + "%");
            pst.setString(3, "%" + query + "%");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Add_book book = new Add_book();
                book.setId(rs.getInt("id"));
                book.setBook_Name(rs.getString("Book_Name"));
                book.setAuther(rs.getString("Auther"));
                book.setCategory(rs.getString("Category"));
                book.setBook_id(rs.getString("Book_id"));
                books.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return books;
	}

	
	
	
	
	
	

}
