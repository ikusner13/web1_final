<html>
<head>
  <link href="https://www.w3schools.com/w3css/4/w3.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="/static/css/login.css">
  <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-2021.css"/>
  <script src="https://kit.fontawesome.com/6e36a7f304.js" crossorigin="anonymous"></script>
</head> 
<body class="w3-2021-buttercream">
<div class="login">
    <div class="login-form">
        <div class ="login-header">
            <h2>Login</h2>
        <div>
        <form action="/login" method="POST">
            <div class= "fields">
                <span class="far fa-user"></span>
                <input placeholder="username" type="text" size="100" maxlength="100" name="username">
            </div>

            <div class="fields">
                <span class="fas fa-key"></span>
                <input placeholder="password" type="text" size="100" maxlength="100" name="password">
            </div>


            <input class="w3-hover-shadow" type="submit" name="login" value="Login"/>
            <p class="register w3-margin-top">
                Don't have an account?
                <a class="w3-hover-opacity" href="/register">
                    Register
                </a>
            <p>
        </form>
    </div>
</div>
</body>
</html>
    <!--Token: <input type="text" size="100" maxlength="100" name="csrf_token" value="{{csrf_token}}"/><br>
    <hr> -->