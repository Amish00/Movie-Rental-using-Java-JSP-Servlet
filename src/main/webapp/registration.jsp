<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up</title>

    <!-- Font Icon -->
    <link rel="stylesheet"
          href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
    <style>
        .password-toggle {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }
    </style>
    <%@include file="/include/head.jsp"%>
</head>
<body>

<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">

<div class="main">

    <!-- Sign up form -->
    <section class="signup">
        <div class="container">
            <div class="signup-content">
                <div class="signup-form">
                    <h2 class="form-title">Sign up</h2>

                    <form method="post" action="RegistrationServlet" class="register-form"
                          id="register-form">
                        <div class="form-group">
                            <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="name" id="name" placeholder="Your Name" />
                        </div>
                        <div class="form-group">
                            <label for="email"><i class="zmdi zmdi-email"></i></label>
                            <input type="email" name="email" id="email" placeholder="Your Email" />
                            <span id="email-error" style="color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="password" id="pass" placeholder="Password" />
                            <span class="password-toggle" onclick="togglePasswordVisibility('pass')">
                                    <i class="zmdi zmdi-eye" id="eye-open-pass"></i>
                                    <i class="zmdi zmdi-eye-off" id="eye-close-pass" style="display: none;"></i>
                                </span>
                        </div>
                        <div class="form-group">
                            <label for="re_pass"><i class="zmdi zmdi-lock-outline"></i></label>
                            <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password" />
                            <span class="password-toggle" onclick="togglePasswordVisibility('re_pass')">
                                    <i class="zmdi zmdi-eye" id="eye-open-re_pass"></i>
                                    <i class="zmdi zmdi-eye-off" id="eye-close-re_pass" style="display: none;"></i>
                                </span>
                            <span id="password-error" style="color: red;"></span>
                        </div>
                        <div class="form-group">
                            <label for="phone"><i class="zmdi zmdi-phone"></i></label>
                            <input type="text" name="phone" id="phone"
                                   placeholder="Contact no" />
                        </div>
                        <div class="form-group">
                            <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                            <label for="agree-term" class="label-agree-term">
                                <span><span></span></span>I agree all statements in <a href="#" class="term-service">Terms of service</a>
                            </label>
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
                        </div>
                    </form>
                </div>
                <div class="signup-image">
                    <figure>
                        <img src="images/cine.png" alt="sing up image">
                    </figure>
                    <a href="index.jsp" class="signup-image-link">I am already
                        member</a>
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
    if(status == "success"){
        swal("Congrats","Account Created Successfully","success");
    }
    function togglePasswordVisibility(inputId) {
        var passwordInput = document.getElementById(inputId);
        var eyeOpen = document.getElementById("eye-open-" + inputId);
        var eyeClose = document.getElementById("eye-close-" + inputId);

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
        var password = document.getElementById("pass").value;
        var confirmPassword = document.getElementById("re_pass").value;

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
        } else if (password.length < 6) {
            document.getElementById("password-error").innerText = "Password must be at least 6 characters";
            return false;
        } else {
            document.getElementById("password-error").innerText = "";
        }

        // Validate Confirm Password
        if (confirmPassword !== password) {
            document.getElementById("password-error").innerText = "Passwords do not match";
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

if(status == "success"){
swal("Congrats","Account Created Successfully","success");
}else if(status === "failed"){
swal("Sorry","Wrong Email or Password","error");
} else if (status == "restSuccess"){
swal("Congrats","Password Reset Successful","success");
}else if (status == "resetFailed"){
swal("Sorry","Password Reset Failed","error")}

