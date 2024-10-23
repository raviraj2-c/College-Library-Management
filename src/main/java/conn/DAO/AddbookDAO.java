package conn.DAO;

import java.util.List;



import conn.entity.Add_book;
import conn.entity.Student_regstration;
public interface AddbookDAO {

	public boolean addbook(Add_book b);
	public List<Add_book> getAllbook();
	public boolean deletebooks(int id);
	public Add_book getBookById(int id);
	public boolean updateEditBooks(Add_book b);
	public List<Add_book> searchBooks(String query);
	
}
