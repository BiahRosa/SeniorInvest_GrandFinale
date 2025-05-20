<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Nova Conta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body class="container mt-5">
<h2>Cadastrar Conta</h2>
<form action="../conta" method="post">
    <div class="mb-3">
        <label>Tipo</label>
        <input name="tipoConta" class="form-control" required>
    </div>
    <div class="mb-3">
        <label>Nome</label>
        <input name="nomeConta" class="form-control" required>
    </div>
    <div class="mb-3">
        <label>Saldo</label>
        <input name="saldo" type="number" step="0.01" class="form-control" required>
    </div>
    <div class="mb-3">
        <label>Instituição</label>
        <input name="instituicao" class="form-control">
    </div>
    <button type="submit" class="btn btn-primary">Salvar</button>
</form>
</body>
<footer class="text-center text-light">
    <div>
        © 2025 Copyright:
        <a class="text-light" href="#!">SeniorInvest.biah.dev.br</a>
    </div>
</footer>
</html>
