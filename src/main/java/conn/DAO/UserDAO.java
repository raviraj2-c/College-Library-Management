package conn.DAO;


import conn.DB.DBConnect;
import conn.entity.Student_regstration;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    public Student_regstration getUserById(String College_id) {
    	Student_regstration user = null;
        try {
            Connection conn = DBConnect.getConn();
            String query = "SELECT Name,Department,Phone_number,Addres,College_id FROM callege_library_managment WHERE College_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, College_id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new Student_regstration();
                user.setName(rs.getString("name"));
                user.setDepartment(rs.getString("department"));
                user.setAddres(rs.getString("addres"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setCollege_id(rs.getString("College_id"));
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
