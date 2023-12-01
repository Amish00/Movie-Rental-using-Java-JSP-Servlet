<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.vinchirental.model.User" %>
<%@ page import="com.example.vinchirental.model.Cart" %>
<%@ page import="com.example.vinchirental.Dao.MovieDao" %>
<%@ page import="com.example.vinchirental.connection.DbCon" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  User auth = (User) request.getSession().getAttribute("auth");
  if (auth ==null){
    response.sendRedirect("index.jsp");
  }
  ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
  List<Cart> cartProduct = null;
  if(cart_list != null){
    MovieDao movieDao = new MovieDao(DbCon.getConnection());
    cartProduct = movieDao.getCartProducts(cart_list);
    double total = movieDao.getTotalCartPrice(cart_list);
     request.setAttribute("cart_list",cart_list);
    request.setAttribute("total",total);
  }
%>
<html>
<head>
    <title>Cart Page</title>
</head>
<%@include file="include/head.jsp"%>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #eeeeee;">
  <div class="container">
    <a class="navbar-brand fs-4" href="movies.jsp" style="font-family: 'EB Garamond',sans-serif; font-weight: bolder; color:rgb(79,204,243);">Vinchi Movie Rental</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mx-auto">
        <li class="nav-item ">
          <a class="nav-link" href="movies.jsp">Home</a>
        </li>

        <li class="nav-item active">
          <a class="nav-link " href="cart.jsp">Cart<span class="badge badge-danger">${ cart_list.size()}</span> </a>
        </li>
        <li class="nav-item ">
          <a class="nav-link" href="About.jsp">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="contact.jsp">Contact</a>
        </li>
      </ul>
      <div class="mt-1 d-flex justify-content-between">
        <button type="button" class="btn btn-warning"><a class="nav-link text-dark" href="Logout">Logout</a></button>
      </div>
    </div>
  </div>
</nav>

<div class="d-flex py-3 p-2 mt-3"><h4>Total Price: Rs ${(total>0)?total:0} </h4><a class="mx-3 btn btn-primary" href="CheckOut">Check Out</a> </div>
<div class="container-fluid" style="min-height: 400px;">
  <table class="table table-light table-hover px-auto">
    <thead class="table table-active">
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Category</th>
      <th scope="col">Price</th>
      <th scope="col">Cancel</th>
    </tr>
    </thead>
    <tbody>
    <% if(cart_list !=null){
      for(Cart c:cartProduct){%>
    <tr>
      <td><%=c.getName()%></td>
      <td><%=c.getCategory()%></td>
      <td><%=c.getPrice()%></td>
      <td><a class="btn btn-sm btn-danger" href="remove-from-cart?id=<%= c.getId()%>">Remove</a> </td>
    </tr>
    <% }
    }
    %>
    </tbody>
  </table>
</div>
<div class="container-fluid my-5 position-absolute align-bottom">
  <footer class="text-center " style="background-color: #f1f1f1">
    <div class="container">
      <section class="mt-5">
        <div class="row text-center d-flex justify-content-center pt-5">
          <div class="col-md-2">
            <h6 class="text-uppercase font-weight-bold">
              <a href="About.jsp" class="text-black text-decoration-none">About us</a>
            </h6>
          </div>
          <div class="col-md-2">
            <h6 class="text-uppercase font-weight-bold">
              <a href="movies.jsp" class="text-black text-decoration-none">Home</a>
            </h6>
          </div>
          <div class="col-md-2">
            <h6 class="text-uppercase font-weight-bold">
              <a href="cart.jsp" class="text-black text-decoration-none">Cart</a>
            </h6>
          </div>
          <div class="col-md-2">
            <h6 class="text-uppercase font-weight-bold">
              <a href="#!" class="text-black text-decoration-none">Help</a>
            </h6>
          </div>
          <div class="col-md-2">
            <h6 class="text-uppercase font-weight-bold">
              <a href="contact.jsp" class="text-black text-decoration-none">Contact</a>
            </h6>
          </div>
        </div>
      </section>
      <hr class="my-5" />
      <section class="mb-0">
        <div class="row d-flex justify-content-center">
          <div class="col-lg-8">
            <p>
              Welcome to Vinchi Rental! We’re thrilled to have you here. Get ready to embark on a cinematic journey like no other.With our vast collection of movies, you can explore
              the new world of cinema and watch your favorite movies anytime.
              We hope you enjoy your tim e with us!
            </p>
          </div>
        </div>
      </section>
      <section class="text-center mb-5">
        <a href="https://www.facebook.com/" class="text-decoration-none text-black me-4">
          <i class="fab fa-facebook-f"></i>
        </a>
        <a href="https://twitter.com/" class="text-decoration-none text-black me-4">
          <i class="fab fa-twitter"></i>
        </a>
        <a href="https://www.google.com/" class="text-decoration-none text-black me-4">
          <i class="fab fa-google"></i>
        </a>
        <a href="https://www.instagram.com/" class="text-decoration-none text-black me-4">
          <i class="fab fa-instagram"></i>
        </a>
        <a href="https://www.linkedin.com/" class="text-decoration-none text-black me-4">
          <i class="fab fa-linkedin"></i>
        </a>
        <a href="https://github.com/" class="text-decoration-none text-black me-4">
          <i class="fab fa-github"></i>
        </a>
      </section>
    </div>
    <div
            class="text-center p-3"
            style="background-color: rgba(0, 0, 0, 0.2)"
    >
      © 2023 Copyright: Amish Man Joshi
    </div>
  </footer>
</div>
<%@include file="include/footer.jsp"%>
</body>
</html>
