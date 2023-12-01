
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Return Page</title>
    <%@include file="include/head.jsp"%>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #eeeeee;">
    <div class="container">
        <a class="navbar-brand fs-4" href="dash.jsp" style="font-family: 'EB Garamond',sans-serif; font-weight: bolder; color:rgb(79,204,243);">Vinchi Movie Rental</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item ">
                    <a class="nav-link " href="dash.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link " href="adduser.jsp">Add User</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="addmovie.jsp">Add Movies</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link " href="return.jsp">Return</a>
                </li>
            </ul>
            <div class="mt-1 d-flex justify-content-between">
                <button type="button" class="btn btn-warning"><a class="nav-link text-dark" href="Logout">Logout</a></button>
            </div>
        </div>
    </div>
</nav>

<div class="p-5">

    <h5>Rental List</h5>
    <table class="table table-light table-hover table-bordered px-auto">
        <thead class="table table-active">
        <tr>
            <th scope="col">Customer Name</th>
            <th scope="col">Movie Name</th>
            <th scope="col">Price</th>
            <th scope="col">Borrow Date</th>
            <th scope="col">Return Date</th>
        </tr>
        </thead>
        <tbody>
        <%
            Connection con;
            PreparedStatement pst;
            ResultSet rs;

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/newtry","root","System@991");

            String query = "SELECT r.rentalId,r.user_id AS customerID,u.name AS customerName,r.movie_id AS movieID,p.name AS movieName,r.price,r.borrowDate,r.returnDate FROM  rentals r JOIN  users u ON r.user_id = u.id JOIN  products p ON r.movie_id = p.id order by returnDate asc ;";
            Statement st = con.createStatement();

            rs =  st.executeQuery(query);

            while(rs.next())
            {
                String id = rs.getString("rentalid");
        %>
        <tr>
            <td><%=rs.getString("customername") %></td>
            <td><%=rs.getString("moviename") %></td>
            <td><%=rs.getDouble("price") %></td>
            <td><%=rs.getDate("borrowDate") %></td>
            <td><%=rs.getDate("returnDate") %></td>
        </tr>
        <%

            }
        %>
        </tbody>
    </table>
</div>
<div class="container-fluid my-5 position-absolute">
    <footer class="text-center " style="background-color: #f1f1f1">
        <div class="container">
            <section class="mt-5">
                <div class="row text-center d-flex justify-content-center pt-5">
                    <div class="col-md-2">
                        <h6 class="text-uppercase font-weight-bold">
                            <a href="dash.jsp" class="text-black text-decoration-none">Home</a>
                        </h6>
                    </div>
                    <div class="col-md-2">
                        <h6 class="text-uppercase font-weight-bold">
                            <a href="adduser.jsp" class="text-black text-decoration-none">Add Users</a>
                        </h6>
                    </div>
                    <div class="col-md-2">
                        <h6 class="text-uppercase font-weight-bold">
                            <a href="addmovie.jsp" class="text-black text-decoration-none">Add Movies</a>
                        </h6>
                    </div>
                    <div class="col-md-2">
                        <h6 class="text-uppercase font-weight-bold">
                            <a href="return.jsp" class="text-black text-decoration-none">Return</a>
                        </h6>
                    </div>
                    <div class="col-md-2">
                        <h6 class="text-uppercase font-weight-bold">
                            <a href="#" class="text-black text-decoration-none">Help</a>
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
                style="background-color: rgba(0, 0, 0, 0.2)">
            © 2023 Copyright: Amish Man Joshi
        </div>
    </footer>
</div>
<%@include file="include/footer.jsp"%>
</body>
</html>
