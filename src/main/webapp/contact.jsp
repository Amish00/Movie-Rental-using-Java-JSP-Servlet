
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.vinchirental.model.User" %>
<%@ page import="com.example.vinchirental.model.Cart" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Contact Us</title>
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
                <li class="nav-item ">
                    <a class="nav-link" href="About.jsp">About</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link text-black" href="contact.jsp">Contact Us</a>
                </li>
            </ul>
            <div class="mt-1 d-flex justify-content-between">
                <button type="button" class="btn btn-warning"><a class="nav-link text-dark" href="Logout">Logout</a></button>
            </div>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row p-3">
        <!-- Google Map Section (Left) -->
        <div class="col-md-6">
            <!-- Replace the iframe src with your Google Map embed code -->
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1139.0662695856125!2d85.31987374808159!3d27.671846632920482!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb183244b62fe9%3A0x8db3c17407943a52!2sLalitpur%20Zoo!5e0!3m2!1sen!2sus!4v1653981563038!5m2!1sen!2sus" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>

        <!-- Contact Form Section (Right) -->
        <div class="col-md-6">
            <div class="card border-2">
                <h3 class="pt-3 ps-1 text-center">Contact Us</h3>
                <div class="card-body">
                    <form method="POST" action="Thank.jsp">
                        <div class="pt-2">
                            <label class="name">Name:</label>
                            <input type="text" class="form-control" name="name" id="name" required>
                        </div>

                        <div class="pt-2">
                            <label for="email" class="form-label">Email:</label>
                            <input type="text" class="form-control" id="email" name="email" required>
                        </div>

                        <div class="pt-2">
                            <label class="subject">Subject:</label>
                            <input type="text" class="form-control" name="subject" id="subject" required>
                        </div>

                        <div class="pt-2">
                            <label class="form-label">Message</label>
                            <textarea rows="6" cols="70" class="form-control" name="message" id="message" required></textarea>
                        </div>

                        <br>

                        <div class="d-grid gap-2">
                            <button class="btn btn-warning" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
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
