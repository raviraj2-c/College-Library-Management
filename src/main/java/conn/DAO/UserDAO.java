package conn.DAO;

import conn.entity.Student_regstration;
import conn.entity.user;

public interface UserDAO {

	
	public Student_regstration getUserById(String College_id);
	
}
