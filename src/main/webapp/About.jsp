
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.vinchirental.model.User" %>
<%@ page import="com.example.vinchirental.model.Cart" %>

<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth ==null){
        response.sendRedirect("index.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list != null){
        request.setAttribute("cart_list",cart_list);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>About Us</title>
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
                <li class="nav-item ">
                    <a class="nav-link " href="movies.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link " href="cart.jsp">Cart<span class="badge badge-danger">${ cart_list.size()}</span> </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link text-black" href="About.jsp">About</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="contact.jsp">Contact</a>
                </li>
            </ul>
            <div class="mt-1 d-flex justify-content-between">
                <button type="button" class="btn btn-warning"><a class="nav-link text-dark" href="Logout">Logout</a></button>
            </div>
        </div>
    </div>
</nav>
<section class="hero position-relative">
    <img src="https://ktla.com/wp-content/uploads/sites/4/2022/08/IMG_2073.jpg" class="img-fluid" alt="Cinema Image" style="width: 100%; height: 250px; object-fit: cover;">
    <div class="overlay position-absolute top-0 start-0 w-100 h-100" style="background-color: rgba(0, 0, 0, 0.5);"></div>
    <div class="heading text-center text-white position-absolute top-50 start-50 translate-middle">
        <h2>About Us</h2>
    </div>
</section>
<div class="container my-5">
    <div class="row">
        <div class="col-md-6">
            <figure class="figure">
                <h3 class="mb-2 mt-2 text-center">Welcome to Vinchi Movie Rental</h3>
                <p class="text-justify fs-5">Vinchi Movie Rental Store is a premier destination for cinephiles seeking a diverse and extensive collection of movies for rent. With a wide range of genres and the latest blockbuster releases, Vinchi Movie Rental Store offers a convenient and enjoyable way for customers to access their favorite
                    films. The store prides itself on providing a seamless rental experience, allowing users to browse through an impressive catalog, select their preferred
                    movies, and enjoy them in the comfort of their homes. Vinchi Movie Rental Storeis committed to delivering high-quality entertainment to movie enthusiasts,
                    ensuring a delightful movie-watching experience for all.</p>
            </figure>
        </div>
        <div class="col-md-6">
            <!-- Your additional image on the right -->
            <img src="images/the-peanuts-movie-.jpg" class="img-fluid" alt="Additional Image">
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


