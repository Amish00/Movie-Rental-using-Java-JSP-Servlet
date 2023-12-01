<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>
<%@ page import="com.example.vinchirental.connection.DbCon" %>

<%
    if (request.getParameter("submit") != null) {
        String id = request.getParameter("id");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/newtry", "root", "System@991");
        pst = con.prepareStatement("update users set name = ?,email =?,phone =?,password= ? where id = ?");
        pst.setString(1, name);
        pst.setString(2, email);
        pst.setString(3, phone);
        pst.setString(4, password);
        pst.setString(5, id);
        pst.executeUpdate();

%>

<script>
    alert("Record Updated");
</script>
<%
    }

%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Account</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <%@include file="/include/head.jsp" %>
    <style>
        /* Set the height of the image and form to be the same */
        .image-container {
            height: 90%;
        }

        /* Style for the buttons */
        .btn-container {
            display: flex;
            flex-direction: column;
            padding: 20px 0;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #eeeeee;">
    <div class="container">
        <a class="navbar-brand fs-4" href="dash.jsp"
           style="font-family: 'EB Garamond',sans-serif; font-weight: bolder; color:rgb(79,204,243);">Vinchi Movie
            Rental</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item ">
                    <a class="nav-link " href="dash.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="adduser.jsp">Add User</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link  " href="addmovie.jsp">Add Movies</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="return.jsp">Return</a>
                </li>
            </ul>
            <div class="mt-1 d-flex justify-content-between">
                <button type="button" class="btn btn-warning"><a class="nav-link text-dark" href="Logout">Logout</a>
                </button>
            </div>
        </div>
    </div>
</nav>
<h3 class=" p-3">Update Users</h3>
<div class="container-fluid" style="margin-bottom: 10px;">
    <div class="row p-2">
        <div class="col-md-4">
            <!-- Left side form -->
            <div class="card form-container">
                <div class="card-body">
                    <form method="POST" action="#">

                        <%
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;

                            Class.forName("com.mysql.cj.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost/newtry", "root", "System@991");

                            String id = request.getParameter("id");

                            pst = con.prepareStatement("select * from users where id = ?");
                            pst.setString(1, id);
                            rs = pst.executeQuery();

                            while (rs.next()) {

                        %>
                        <div alight="center">
                            <label class="form-label">Customer Name</label>
                            <input type="text" class="form-control" placeholder="Customer Name"
                                   value="<%= rs.getString("name")%>" name="name" id="name" required>
                        </div>

                        <div alight="center">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" placeholder="Email"
                                   value="<%= rs.getString("email")%>" name="email" id="email" required>
                        </div>

                        <div alight="center">
                            <label class="form-label">Phone Number</label>
                            <input type="text" class="form-control" placeholder="Phone Number" name="phone"
                                   value="<%= rs.getString("phone")%>" id="phone" required>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="password" name="password" value="<%= rs.getString("password")%>" required>
                                <span class="input-group-text" id="togglePassword">
                                    <i class="fas fa-eye" onclick="togglePasswordVisibility()"></i>
                                </span>
                            </div>
                        </div>


                        <% } %>

                        </br>

                        <div class="btn-container d-grid gap-2">
                            <input type="submit" id="submit" value="Submit" name="submit" class="btn btn-info mb-3">
                            <button type="button" class="btn btn-warning"><a class="nav-link text-dark"
                                                                             href="adduser.jsp"> Back</a></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <!-- Right side image -->
            <div class="image-container">
                <img src="images/adamS.jpg" alt="Movie Image" class="img-fluid w-100 h-100">
            </div>
        </div>
    </div>
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
            <hr class="my-5"/>
            <section class="mb-0">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <p>
                            Welcome to Vinchi Rental! We’re thrilled to have you here. Get ready to embark on a
                            cinematic journey like no other.With our vast collection of movies, you can explore
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script>
    function togglePasswordVisibility() {
        var passwordField = document.getElementById("password");
        var toggleIcon = document.getElementById("togglePassword").querySelector("i");

        if (passwordField.type === "password") {
            passwordField.type = "text";
            toggleIcon.classList.remove("fa-eye");
            toggleIcon.classList.add("fa-eye-slash");
        } else {
            passwordField.type = "password";
            toggleIcon.classList.remove("fa-eye-slash");
            toggleIcon.classList.add("fa-eye");
        }
    }
</script>
<%@include file="include/footer.jsp" %>
</body>
</html>