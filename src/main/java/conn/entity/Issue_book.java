package conn.entity;

import java.util.Objects;

public class Issue_book {

	
	
	
	public int Id;
		private String Book_Name;
		private String Auther;
		private String Category;
		private String Book_id;
		private String Name;
		private String Department;
		private String Phone_number;
		private String College_id;
		private String Addres;
		private String Date;
		
		
		
		
		
		
		public Issue_book() {
			super();
			// TODO Auto-generated constructor stub
		}







		public Issue_book(int id,String date, String book_Name, String auther, String category, String book_id, String name,
				String department, String phone_number, String college_id, String addres) {
			super();
			Id = id;
			Date = date;
			Book_Name = book_Name;
			Auther = auther;
			Category = category;
			Book_id = book_id;
			Name = name;
			Department = department;
			Phone_number = phone_number;
			College_id = college_id;
			Addres = addres;
		}



		
	
		public String getDate() {
			return Date;
		}
		public void setDate(String date) {
			
			Date = date;
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
		public String getName() {
			return Name;
		}
		public void setName(String name) {
			Name = name;
		}
		public String getDepartment() {
			return Department;
		}
		public void setDepartment(String department) {
			Department = department;
		}
		public String getPhone_number() {
			return Phone_number;
		}
		public void setPhone_number(String phone_number) {
			Phone_number = phone_number;
		}
		public String getCollege_id() {
			return College_id;
		}
		public void setCollege_id(String college_id) {
			College_id = college_id;
		}
		public String getAddres() {
			return Addres;
		}
		public void setAddres(String addres) {
			Addres = addres;
		}
		
		
		
		@Override
		public String toString() {
			return "Issue_book [Id=" + Id + ",Date=" + Date + ",Book_Name=" + Book_Name + ", Auther=" + Auther + ", Category=" + Category + ", Book_id="
					+ Book_id + ", Name=" + Name + ", Department=" + Department + ", Phone_number=" + Phone_number
					+ ", College_id=" + College_id + ", Addres=" + Addres + "]";
		}
	
}
