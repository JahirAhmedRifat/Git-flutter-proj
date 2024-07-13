package com.example.demo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentDA {

	PreparedStatement pstmt;
	Connection con;
	
	public Student insert(Student p) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stdb", "root", "nclc123456");
			pstmt = con.prepareStatement("insert into student values(?,?,?,?)");
			pstmt.setInt(1, p.id);
			pstmt.setString(2, p.name);
			pstmt.setString(3, p.email);
			pstmt.setString(4, p.round);
			int n = pstmt.executeUpdate();

			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return p;
	}



	public Student studentSigninById(int id) {
		Student s = new Student();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stdb", "root", "nclc123456");
			pstmt = con.prepareStatement("select * from student where id=" + id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				s = new Student(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
			}
			
			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return s;
	}
	
}
