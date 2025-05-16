<%--
  Created by IntelliJ IDEA.
  User: beatr
  Date: 15/05/2025
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Cadastro de Conta</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="card p-4 shadow">
        <h2>Nova Conta</h2>
        <form action="conta" method="post">
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
                <input name="saldo" class="form-control" type="number" required>
            </div>
            <div class="mb-3">
                <label>Instituição</label>
                <input name="instituicao" class="form-control">
            </div>
            <button type="submit" class="btn btn-primary">Salvar</button>
        </form>
    </div>
</div>
</body>
</html>
