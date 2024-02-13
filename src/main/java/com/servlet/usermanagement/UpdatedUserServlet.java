package com.servlet.usermanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/updateusernew")
public class UpdatedUserServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId=Integer.parseInt(req.getParameter("userId"));
		String userName=req.getParameter("userName");
		String userEmail=req.getParameter("userEmail");
		String userAddress=req.getParameter("userAddress");
		
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","root");
			PreparedStatement ps=con.prepareStatement("UPDATE user SET userName=?,userEmail=?,userAddress=? WHERE userId=?");
			ps.setString(1, userName);
			ps.setString(2, userEmail);
			ps.setString(3, userAddress);
			ps.setInt(4, userId);
			int result=ps.executeUpdate();
			PrintWriter p=resp.getWriter();
			if(result>0) {
				p.print("Updated Successfully!");
			}
			else {
				p.print("Update unsuccessful!");
			}
		
			
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		finally {
			if(con!=null) {
				try {
					con.close();
				}
				catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

}
