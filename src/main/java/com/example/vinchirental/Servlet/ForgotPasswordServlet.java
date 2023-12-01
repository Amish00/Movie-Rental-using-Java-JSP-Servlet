package com.example.vinchirental.Servlet;

import com.example.vinchirental.connection.DbCon;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


@WebServlet(name = "ForgotPasswordServlet", urlPatterns = {"/ForgotPasswordServlet"})
public class ForgotPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String newPassword = request.getParameter("pass"); // Change to "pass" since that's the input name
        String confirmPassword = request.getParameter("re_pass");
        RequestDispatcher dispatcher = null;

        try {
            Connection con = DbCon.getConnection();
            int check = 0;

            // Use a PreparedStatement to prevent SQL injection
            String query = "SELECT * FROM users WHERE email=? AND phone=?";
            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setString(1, email);
                ps.setString(2, phone);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    check = 1;
                    if (newPassword.equals(confirmPassword)) {
                        String updateQuery = "UPDATE users SET password=? WHERE email=?";
                        try (PreparedStatement updatePs = con.prepareStatement(updateQuery)) {
                            updatePs.setString(1, newPassword);
                            updatePs.setString(2, email);
                            int rowCount = updatePs.executeUpdate();

                            if (rowCount > 0) {
                                request.setAttribute("status", "resetSuccess");
                            } else {
                                request.setAttribute("status", "resetFailed");
                            }
                        }
                    } else {
                        System.out.println("Password mismatch");
                        request.setAttribute("status", "resetFailed"); // Password mismatch
                    }
                } else {
                    System.out.println("User not found");
                    request.setAttribute("status", "resetFailed"); // User not found
                }
            }

            dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
