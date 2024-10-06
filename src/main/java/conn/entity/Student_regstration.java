package conn.entity;

import java.util.Objects;

public class Student_regstration {
	private int Id;
	private String Name;
	private String Department;
	private String Phone_number;
	private String College_id;
	private String Addres;

	public Student_regstration() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
	public Student_regstration(int id, String name, String department, String phone_number, String college_id,
			String addres) {
		super();
		Id = id;
		Name = name;
		Department = department;
		Phone_number = phone_number;
		College_id = college_id;
		Addres = addres;
	}




	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
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
		return "Student_regstration [Id=" + Id + ", Nmae=" + Name + ", Department=" + Department + ", Phone_number="
				+ Phone_number + ", College_id=" + College_id + ", Addres=" + Addres + "]";
	}

}
