<%@ page session="true" %>
<%
    if (session.getAttribute("usuarioLogado") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<html>
<head>
    <title>Dashboard - SeniorInvest</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
<h2>Oie, ${sessionScope.usuarioLogado} </h2>
<div class="mt-4">
    <a href="conta/cadastro-conta.jsp" class="btn btn-primary">Cadastrar Conta</a>
    <a href="gasto/cadastro-gasto.jsp" class="btn btn-danger">Registrar Gasto</a>
    <a href="receita/cadastro-receita.jsp" class="btn btn-success">Registrar Receita</a>
    <a href="conta" class="btn btn-outline-primary">Listar Contas</a>
    <a href="gasto" class="btn btn-outline-danger">Listar Gastos</a>
    <a href="receita" class="btn btn-outline-success">Listar Receitas</a>
    <a href="logout" class="btn btn-dark">Sair</a>
</div>
</body>
</html>
