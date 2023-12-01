package com.example.vinchirental.Servlet;

import com.example.vinchirental.Dao.UserDao;
import com.example.vinchirental.connection.DbCon;
import com.example.vinchirental.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newtry?useSSl = false", "root", "System@991");
            PreparedStatement pst = con.prepareStatement("Select * from users where email = ?");
            pst.setString(1, email);

            ResultSet rs = pst.executeQuery();
            UserDao udao = new UserDao(DbCon.getConnection());
            User user = udao.userLogin(email, password);

            if (rs.next()) {
                String storedPassword = rs.getString("password");
                String storedRole = rs.getString("role");

                if (password.equals(storedPassword) && storedRole.equals("admin")) {
                    // Passwords match, user is authenticated
                    response.sendRedirect("dash.jsp"); // Redirect to a welcome page
                } else if (password.equals(storedPassword) && storedRole.equals("user")) {
                    request.getSession().setAttribute("auth", user);
                    response.sendRedirect("movies.jsp"); // Redirect to a welcome page
                } else {
                    // Passwords do not match
                    response.sendRedirect("index.jsp"); // Redirect with an error parameter
                }
            } else {
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}