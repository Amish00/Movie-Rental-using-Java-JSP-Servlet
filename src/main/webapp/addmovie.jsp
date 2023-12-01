<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="com.example.vinchirental.connection.DbCon" %>
<%
    if(request.getParameter("submit")!=null)
    {
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String image = request.getParameter("image");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;

        con = DbCon.getConnection();
        pst = con.prepareStatement("insert into products(name,category,price,image)values(?,?,?,?)");
        pst.setString(1, name);
        pst.setString(2, category);
        pst.setString(3, price);
        pst.setString(4, image);
        pst.executeUpdate();

%>
<script>
    alert("Record Added");
</script>
<%
    }
%>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <%@include file="/include/head.jsp"%>
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
                <li class="nav-item active">
                    <a class="nav-link  " href="addmovie.jsp">Add Movies</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="return.jsp">Return</a>
                </li>
            </ul>
            <div class="mt-1 d-flex justify-content-between">
                <button type="button" class="btn btn-warning"><a class="nav-link text-dark" href="Logout">Logout</a></button>
            </div>
        </div>
    </div>
</nav>
<div class="container-fluid">
<h4 class="p-1 mt-3">Add Movies</h4>
</br>
    <div class="row px-2">
        <div class="col-sm-4">
            <div class="card form-container">
                <div class="card-body">
                    <form method="POST" action="#">

                        <div alight="left">
                            <label class="form-label">Movie Name</label>
                            <input type="text" class="form-control" placeholder="Movie Name" name="name" id="name" required >
                        </div>

                        <div alight="left">
                            <label class="form-label">Category</label>
                            <input type="text" class="form-control" placeholder="Category" name="category" id="category" required >
                        </div>

                        <div alight="left">
                            <label class="form-label">Price</label>
                            <input type="text" class="form-control" placeholder="Price" name="price" id="price" required >
                        </div>

                        <div alight="left">
                            <label class="form-label">Image Url</label>
                            <input type="text" class="form-control" placeholder="Image" name="image" id="image" required >
                        </div>
                        <br>

                        <div alight="right">
                            <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info w-100">
                        </div>

                    </form>
                </div>
            </div>
        </div>

    <div class="col-sm-8">
        <div class="panel-body">
                <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%" style="display: inline-table!important;">
                <thead>
                <tr class="table-active">
                    <th>Movie Name</th>
                    <th>Genre</th>
                    <th>Price</th>
                    <th>Image Url</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>

                    <%

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;

                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/newtry","root","System@991");

                                  String query = "select * from products";
                                  Statement st = con.createStatement();

                                    rs =  st.executeQuery(query);

                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>

                <tr>
                    <td><%=rs.getString("name") %></td>
                    <td><%=rs.getString("category") %></td>
                    <td><%=rs.getString("price") %></td>
                    <td><%=rs.getString("image") %></td>
                    <td>
                        <a href="update.jsp?id=<%=id%>" class="btn btn-primary">Edit</a>
                    </td>
                    <td>
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal<%=id%>">
                            Delete
                        </button>

                        <div class="modal" id="deleteModal<%=id%>" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure you want to delete this item?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                        <a class="btn btn-danger" href="delete.jsp?id=<%=id%>">Delete</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>

                </tr>


                    <%

                                 }
                               %>

            </table>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
