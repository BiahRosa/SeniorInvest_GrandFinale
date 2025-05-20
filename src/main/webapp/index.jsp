<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Login - SeniorInvest</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
</head>
<body class="login-page">
<div class="login-box">
    <img src="assets/senior.svg" alt="Logo SêniorInvest" class="logo-image mb-4">
    <h2 class="mb-4">Login</h2>

    <%
        String msg = (String) session.getAttribute("mensagemCadastro");
        if (msg != null) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <%= msg %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Fechar"></button>
    </div>
    <%
            session.removeAttribute("mensagemCadastro");
        }
    %>

    <form action="login" method="post">
        <input class="form-control mb-3" type="text" name="email" placeholder="Email" required>
        <input class="form-control mb-3" type="password" name="senha" placeholder="Senha" required>
        <div class="container">
        <button class="btn btn-success w-100" type="submit">Entrar</button>
        <a href="usuario/cadastro-usuario.jsp" class="btn btn-outline-dark btn-dark text-light mt-3">Cadastrar</a>
        </div>
    </form>
    <p class="text-danger mt-3">${erro}</p>
</div>
</body>
<footer class="text-center text-light">
    <div>
        © 2025 Copyright:
        <a class="text-light" href="#!">SeniorInvest.biah.dev.br</a>
    </div>
</footer>
</html>
