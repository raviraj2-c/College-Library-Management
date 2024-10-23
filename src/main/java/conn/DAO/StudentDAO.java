package conn.DAO;

import java.util.List;

import conn.entity.Student_regstration;

public interface StudentDAO {

	public boolean studentadd(Student_regstration b);
	 public List<Student_regstration> searchStudents(String query);
	
}
