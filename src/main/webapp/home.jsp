<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="css/home.css" rel="stylesheet">
</head>
<body class="dashboard-body">

    <nav class="navbar navbar-expand-lg mb-3">
        <div class="container-fluid">
            <img src="assets/logo-light.svg" alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
            <a class="navbar-brand fw-bold" href="#">SêniorInvest</a>
            <div>
                <a class="btn btn-outline-light" href="logout">Sair</a>
            </div>
        </div>
    </nav>

    <div class="container text-center">
        <h2 class="mb-4">Bem-vindo, <span class="text-primary">${sessionScope.usuarioLogado.nome}</span></h2>
        <p class="mb-3 fs-5">Escolha gerenciar suas receitas e gastos</p>

        <!-- Gráfico estático add js depois -->
        <div class="grafico-circular mb-4">
            <div class="fatia fatia-verde"></div>
            <div class="fatia fatia-vermelha"></div>
            <div class="centro-circulo"></div>
        </div>

        <div class="d-grid gap-3 col-6 mx-auto mb-5">
            <a href="receita/cadastro-receita.jsp" class="btn btn-success btn-lg">Receitas</a>
            <a href="gasto/cadastro-gasto.jsp" class="btn btn-danger btn-lg">Gastos</a>
        </div>

        <div class="grid gap-3 col-6 mx-auto mb-5">
            <div class="bg-primary text-center rounded p-3">
                <h5 class="card-title text-light mb-0">Contas</h5>
                <p class="text-light small">Gerencie suas contas bancarias</p>
                <div>
                    <a href="conta/cadastro-conta.jsp" class="btn btn-outline-dark btn-dark text-light">Cadastrar</a>
                    <a href="conta" class="btn btn-outline-light">Ver Contas</a>
                </div>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-6">
                <ul class="list-group">
                    <a href="telas/investimento.jsp" class="btn btn-outline-secondary btn-lg">
                        <i class="bi bi-clock"></i> Investimento
                    </a>
                    <a href="telas/aulas.jsp" class="btn btn-outline-secondary btn-lg">
                        <i class="bi bi-camera-video"></i> Assistir aulas
                    </a>
                    <a href="telas/fale.jsp" class="btn btn-outline-secondary btn-lg">
                        <i class="bi bi-chat"></i> Fale com o Sinhô
                    </a>
                </ul>
            </div>
        </div>

        <div class="justify-content">
                <img src="assets/transperent-footer.svg" width="100" height="100">
        </div>

    </div>
</body>
<footer class="footer text-center mt-auto">
    <div>
        © 2025 Copyright:
        <a class="text-light" href="#!">SeniorInvest.biah.dev.br</a>
    </div>
</footer>
</html>
