<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Login </title>

  <!-- Font Icon -->
  <link rel="stylesheet"
        href="fonts/material-icon/css/material-design-iconic-font.min.css">
  <!-- Main css -->
  <link rel="stylesheet" href="css/style.css">
  <%@include file="/include/head.jsp"%>
  <style>
    .password-toggle {
      position: absolute;
      right: 10px;
      top: 50%;
      transform: translateY(-50%);
      cursor: pointer;
    }
  </style>
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
<div class="main">
  <!-- Sing in  Form -->
  <section class="sign-in">
    <div class="container">
      <div class="signin-content">
        <div class="signin-image">
          <figure>
            <img src="images/cat.png" alt="sign up image" width=200px">
          </figure>
          <a href="registration.jsp" class="signup-image-link">Create an
            account</a>
        </div>

        <div class="signin-form">
          <h2 class="form-title">Sign in</h2>
          <form method="post" action="LoginServlet" class="register-form"
                id="login-form">
            <div class="form-group">
              <label for="email"><i class="zmdi zmdi-email"></i></label>
              <input type="text" name="email" id="email" placeholder="Email"/>
              <span id="email-error" style="color: red;"></span>
            </div>
            <div class="form-group">
              <label for="password"><i class="zmdi zmdi-lock"></i></label>
              <input type="password" name="password" id="password" placeholder="Password"/>
              <span class="password-toggle" onclick="togglePasswordVisibility()">
                                    <i class="zmdi zmdi-eye" id="eye-open"></i>
                                    <i class="zmdi zmdi-eye-off" id="eye-close" style="display: none;"></i>
                                </span>
            </div>
            <div class="form-group">
              <a href="forgotPassword.jsp" class="signup-image-link" style="text-align: left; text-decoration: none;">Forgot
                Password?</a>
            </div>
            <div class="form-group form-button">
              <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
            </div>
          </form>
          <div class="social-login">
            <span class="social-label">Or login with</span>
            <ul class="socials">
              <li><a href="#"><i
                      class="display-flex-center zmdi zmdi-facebook"></i></a></li>
              <li><a href="#"><i
                      class="display-flex-center zmdi zmdi-twitter"></i></a></li>
              <li><a href="#"><i
                      class="display-flex-center zmdi zmdi-google"></i></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </section>

</div>

<!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
  var status = document.getElementById("status").value;
  if (status === "failed") {
    swal("Sorry", "Wrong Email or Password", "error");
  } else if (status === "resetSuccess") {
    swal("Congrats", "Password Reset Successful", "success");
  } else if (status === "resetFailed") {
    swal("Sorry", "Password Reset Failed", "error");
  } else if (status === "PasswordMismatch") {
    swal("Sorry", "Password mismatch", "error");
  } else if (status === "UserNotFound") {
    swal("Sorry", "User not found", "error");
  }

  function togglePasswordVisibility() {
    var passwordInput = document.getElementById("password");
    var eyeOpen = document.getElementById("eye-open");
    var eyeClose = document.getElementById("eye-close");

    if (passwordInput.type === "password") {
      passwordInput.type = "text";
      eyeOpen.style.display = "none";
      eyeClose.style.display = "inline-block";
    } else {
      passwordInput.type = "password";
      eyeOpen.style.display = "inline-block";
      eyeClose.style.display = "none";
    }
  }

  function validateForm() {
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;

    // Validate Email
    if (!isValidEmail(email)) {
      document.getElementById("email-error").innerText = "Invalid email format";
      return false;
    } else {
      document.getElementById("email-error").innerText = "";
    }

    // Validate Password
    if (password.trim() === "") {
      document.getElementById("password-error").innerText = "Password is required";
      return false;
    } else {
      document.getElementById("password-error").innerText = "";
    }

    return true;
  }

  function isValidEmail(email) {
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/;
    return emailRegex.test(email);
  }
</script>
</body>
</html>