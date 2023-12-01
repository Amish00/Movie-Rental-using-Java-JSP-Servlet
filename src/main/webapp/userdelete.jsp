
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<%@ page import="com.example.vinchirental.connection.DbCon" %>
<%
  String id = request.getParameter("id");
  Connection con = null;
  PreparedStatement pst = null;

  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/newtry","root","System@991");
    pst = con.prepareStatement("DELETE FROM users WHERE id = ?");
    pst.setString(1, id);
    pst.executeUpdate();
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    try {
      if (pst != null) {
        pst.close();
      }
      if (con != null) {
        con.close();
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
  // Redirect to add.jsp after deletion
  response.sendRedirect("adduser.jsp");
%>
<%@include file="/include/head.jsp"%>
