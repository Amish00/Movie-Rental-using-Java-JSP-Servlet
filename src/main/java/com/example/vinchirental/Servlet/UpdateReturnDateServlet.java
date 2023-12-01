package com.example.vinchirental.Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
@WebServlet("/updateReturnDate")
public class UpdateReturnDateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int rentalid = Integer.parseInt(request.getParameter("rentalid"));

            Connection con;
            PreparedStatement pst;

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/newtry","root","System@991");

            String query = "UPDATE rentals SET returnDate = CURDATE() WHERE rentalid = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, rentalid);

            int result = pst.executeUpdate();
            if (result > 0) {
                response.sendRedirect("dash.jsp");
            } else {
                out.println("Return date update failed!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
