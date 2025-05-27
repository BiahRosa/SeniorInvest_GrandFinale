<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Cadastro de Usuário</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/global.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/navbar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/components.css" rel="stylesheet">
</head>
<body class="login-page">
<h2>Cadastro de Usuário</h2>
<a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Voltar ao início</a>
<form id="formCadastro" method="post" action="${pageContext.request.contextPath}/usuario">
    <div class="mb-3">
        <label>Nome</label>
        <input type="text" name="nome" class="form-control" required>
    </div>
    <div class="mb-3">
        <label>Email</label>
        <input type="email" name="email" class="form-control" required>
    </div>
    <div class="mb-3">
        <label>Senha</label>
        <input type="password" name="senha" class="form-control" required>
    </div>
    <div class="mb-3">
        <label>Confirmar Senha</label>
        <input type="password" name="confirmarSenha" class="form-control" required>
    </div>
    <div id="erroSenha" class="alert alert-danger d-none" role="alert">
        As senhas não coincidem!
    </div>
    <button class="btn btn-success" type="submit">Cadastrar</button>

    <div class="mt-4 text-center">
        <p>ou cadastre-se com:</p>
        <a href="#" class="btn btn-outline-danger me-2"><i class="bi bi-google"></i> Google</a>
        <a href="#" class="btn btn-outline-primary"><i class="bi bi-facebook"></i> Facebook</a>
    </div>
</form>
<script>
    document.getElementById("formCadastro").addEventListener("submit", function (e) {
        const senha = document.querySelector("input[name='senha']").value;
        const confirmar = document.querySelector("input[name='confirmarSenha']").value;
        const erroDiv = document.getElementById("erroSenha");

        if (senha !== confirmar) {
            e.preventDefault(); //barrar
            erroDiv.classList.remove("d-none");
        } else {
            erroDiv.classList.add("d-none"); //liberar
        }
    });
</script>
</body>
<footer class="text-center text-light">
    <div>
        © 2025 Copyright:
        <a class="text-light" href="#!">SeniorInvest.biah.dev.br</a>
    </div>
</footer>
</html>
