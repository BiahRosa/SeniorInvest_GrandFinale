<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Login - SeniorInvest</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/global.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/navbar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/components.css" rel="stylesheet">
</head>
<body class="login-page ">

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

                    <div class="mt-3">
                        <a href="#" class="text-muted small">
                            Esqueceu a senha?
                        </a>
                    </div>

                    <div class="d-flex justify-between mt-4">
                        <a href="${pageContext.request.contextPath}/usuario/cadastro-usuario.jsp" class="btn btn-success w-50 me-2 ">
                            <i class="bi bi-person-plus"></i> Cadastrar
                        </a>
                        <a href="demo" class="btn btn-warning w-50">
                            <i class="bi bi-person-circle"></i> Visitante
                        </a>
                    </div>

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
