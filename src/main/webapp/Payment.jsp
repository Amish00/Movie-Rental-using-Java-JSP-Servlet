<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
        html,
        body {
            height: 100%;
        }

        .full-height {
            height: 100%;
        }
    </style>
</head>
<body class="full-height">
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

<div class="container-fluid full-height d-flex align-items-center justify-content-center pt-2">
    <!-- Image and Form in the Same Box -->
    <div class="row g-0">
        <!-- Image on the Left -->
        <div class="col-md-6">
            <img src="images/4142132.jpg" class="img-fluid h-100" alt="Additional Image">
        </div>

        <!-- Contact Form Section (Right) -->
        <div class="col-md-6">
            <h3 class="pt-3 ps-1 text-center">Payment</h3>
            <div class="card-body">
                <form method="POST" action="Thank.jsp">

                    <div class="pt-2">
                        <label class="form-label">Card Number</label>
                        <input type="text" class="form-control" placeholder="Card Number" name="name" id="name" required>
                    </div>

                    <div class="pt-2">
                        <label class="form-label">Expiry Date</label>
                        <input type="date" class="form-control" placeholder="Expiry Date" name="Expiry" id="Expiry" required>
                    </div>

                    <div class="pt-2">
                        <label class="form-label">CVV</label>
                        <input type="text" class="form-control" placeholder="CVV" name="CVV" id="CVV" required>
                    </div>

                    <div class="pt-2">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" placeholder="example@email.com" name="email" id="email" required>
                    </div>
                    <br>

                    <div class="d-grid gap-2 pt-2">
                        <button class="btn btn-success" type="submit">Payment</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid my-5">
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
