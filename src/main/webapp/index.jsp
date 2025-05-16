<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login - SeniorInvest</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
<h2 class="mb-4">Login</h2>
<form action="login" method="post">
    <input class="form-control mb-3" type="text" name="email" placeholder="Email" required>
    <input class="form-control mb-3" type="password" name="senha" placeholder="Senha" required>
    <button class="btn btn-primary" type="submit">Entrar</button>
</form>
<p class="text-danger mt-3">${erro}</p>
</body>
</html>
