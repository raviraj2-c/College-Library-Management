package conn.DAO;

import java.util.List;

import conn.entity.Add_book;
import conn.entity.Issue_book;

public interface IssueDAO {

	public boolean Issue(Issue_book b);
	public List<Issue_book> getAllIssue();
	public Issue_book getAllIssueId(int id);
	public boolean returnbook(int id);
	
	public int getIssuedBookCountByStudent(String College_id);
	
	
	
	
	
}
