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
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="#">SeniorInvest</a>
                <div>
                    <a class="btn btn-outline-light" href="logout">Sair</a>
                </div>
        </div>
    </nav>
    <div class="logo-container">
        <img src="assets/logo-text.svg" alt="Logo SêniorInvest" class="logo-image">
    </div>

<div class="container mt-5">
    <h2 class="mb-4">Bem-vindo, <span class="text-primary">${sessionScope.usuarioLogado}</span></h2>
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card card-custom text-white bg-primary">
                <div class="card-body">
                    <h5 class="card-title">Contas</h5>
                    <p>Gerencie suas contas bancarias</p>
                    <a href="conta/cadastro-conta.jsp" class="btn btn-light">Cadastrar Conta</a>
                    <a href="conta" class="btn btn-outline-light mt-2">Ver Contas</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card card-custom text-white bg-danger">
                <div class="card-body">
                    <h5 class="card-title">Gastos</h5>
                    <p>Registre seus gastos mensais.</p>
                    <a href="gasto/cadastro-gasto.jsp" class="btn btn-light">Novo Gasto</a>
                    <a href="gasto" class="btn btn-outline-light mt-2">Ver Gastos</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card card-custom text-white bg-success">
                <div class="card-body">
                    <h5 class="card-title">Receitas</h5>
                    <p>Cadastre entradas e investimentos.</p>
                    <a href="receita/cadastro-receita.jsp" class="btn btn-light">Nova Receita</a>
                    <a href="receita" class="btn btn-outline-light mt-2">Ver Receitas</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
