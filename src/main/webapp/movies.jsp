<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth == null){
        response.sendRedirect("index.jsp");
    }
    MovieDao md = new MovieDao(DbCon.getConnection());
    List<Movie> movies = md.getAllMovies();

    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list != null){
        request.setAttribute("cart_list",cart_list);
    }
%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.vinchirental.model.User" %>
<%@ page import="com.example.vinchirental.Dao.MovieDao" %>
<%@ page import="com.example.vinchirental.connection.DbCon" %>
<%@ page import="com.example.vinchirental.model.Movie" %>
<%@ page import="com.example.vinchirental.model.Cart" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Amish Rental</title>
    <%@include file="/include/head.jsp"%>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #eeeeee;">
    <div class="container">
        <a class="navbar-brand fs-4" href="movies.jsp" style="font-family: 'EB Garamond',sans-serif; font-weight: bolder; color:rgb(79,204,243);">Vinchi Movie Rental</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item active">
                    <a class="nav-link text-black" href="movies.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link " href="cart.jsp">Cart<span class="badge badge-danger">${ cart_list.size()}</span> </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="About.jsp">About</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="contact.jsp">Contact</a>
                </li>
            </ul>
            <div class="mt-1 d-flex justify-content-between">
                <button type="button" class="btn btn-warning"><a class="nav-link text-dark" href="Logout">logout</a></button>
            </div>
        </div>
    </div>
</nav>


<style>
    #carouselExampleFade .carousel-inner {
        height: 400px; /* Set your desired height */
    }

    #carouselExampleFade .carousel-inner img {
        object-fit: cover; /* Maintain aspect ratio */
        height: 100%; /* Take up full height of the carousel-inner */
    }
</style>

<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="images/wallpaperflare.com_wallpaper%20(3).jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="images/wp1945913-movie-posters-wallpapers.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="images/wp1945919-movie-posters-wallpapers.jpg" class="d-block w-100" alt="...">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>


<div class = "container">
    <div class = "card-header my-3"><h3>All Movies</h3></div>
    <div class = "row">
        <%
            if(!movies.isEmpty()){
                for(Movie m:movies){


        %>
        <div class="col-md-3 my-3">
            <div class="card w-100" style="width: 18rem;">
                <img class="card-img-top" src="product-images/<%=m.getImage() %>" alt="Card image cap">
                <div class="card-body">
                    <div class="mt-3 d-flex justify-content-between">
                        <a href="" class="card-title text-decoration-none text-dark"><h5><%=m.getName() %></h5></a>
                        <a href="" class="btn btn-outline-dark">HD</a>
                    </div>
                    <h6 class="category"><%=m.getCategory() %></h6>
                    <h6 class="price">Rs.<%=m.getPrice() %></h6>
                    <div class="mt-3 d-flex justify-content-between">
                        <a href="AddToCart?id=<%= m.getId()%>" class="btn btn-primary">Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>

    </div>
</div>


<div class="container-fluid my-5 position-absolute">
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
        <%@include file="/include/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
