package conn.entity;

import java.util.Objects;

public class Add_book {
	private int Id;
	private String Book_Name;
	private String Auther;
	private String Category;
	private String Book_id;
	
	
	public Add_book() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Add_book(int id, String book_Name, String auther, String category, String book_id) {
		super();
		Id = id;
		Book_Name = book_Name;
		Auther = auther;
		Category = category;
		Book_id = book_id;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Add_book other = (Add_book) obj;
		return Objects.equals(Auther, other.Auther) && Objects.equals(Book_Name, other.Book_Name)
				&& Objects.equals(Book_id, other.Book_id) && Objects.equals(Category, other.Category) && Id == other.Id;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getBook_Name() {
		return Book_Name;
	}
	public void setBook_Name(String book_Name) {
		Book_Name = book_Name;
	}
	public String getAuther() {
		return Auther;
	}
	public void setAuther(String auther) {
		Auther = auther;
	}
	public String getCategory() {
		return Category;
	}
	public void setCategory(String category) {
		Category = category;
	}
	public String getBook_id() {
		return Book_id;
	}
	public void setBook_id(String book_id) {
		Book_id = book_id;
	}
	
	@Override
	public String toString() {
		return "Add_book [Id=" + Id + ", Book_Name=" + Book_Name + ", Auther=" + Auther + ", Category=" + Category
				+ ", Book_id=" + Book_id + "]";
	}
	
}
