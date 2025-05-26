<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="${pageContext.request.contextPath}/css/global.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/navbar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/components.css" rel="stylesheet">
    <link href="css/home.css" rel="stylesheet">
</head>
<body>
    <div class="page-container d-flex flex-column min-vh-100">

        <main class="flex-fill">
            <nav class="navbar navbar-expand-lg mb-3">
                <div class="container-fluid">
                    <img src="${pageContext.request.contextPath}/assets/logo.svg" alt="Logo" width="30" height="24">
                    <a class="navbar-brand fw-bold text-light" href="#">SêniorInvest</a>
                    <div>
                        <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/logout">Sair</a>
                        <a class="btn btn-outline-light me-2" href="${pageContext.request.contextPath}/telas/perfil.jsp">
                            <i class="bi bi-person-circle"></i> Meu Perfil
                        </a>
                    </div>
                </div>
            </nav>

                <div class="container text-center">
                    <h2 class="mb-4">Bem-vindo, <span class="text-primary">${sessionScope.usuarioLogado.nome}</span></h2>
                    <p class="mb-3 fs-5">Escolha gerenciar suas receitas e gastos</p>

                    <div class="alert alert-success shadow-sm w-50 mx-auto">
                        <strong>Saldo total:</strong> R$ ${saldoTotal}
                    </div>

                    <!-- c:if tag JSTL - lembrar - modo DEMO-->
                    <c:if test="${sessionScope.usuarioLogado.email == 'demo@seniorinvest.com'}">
                        <div class="alert alert-warning text-center">
                            Você está usando o <strong>modo demonstração</strong>. Seus dados são salvos, mas podem ser apagados a qualquer momento.
                        </div>
                    </c:if>

                    <!-- Gráfico estático add js depois
                    <div class="grafico-circular mb-4">
                        <div class="fatia fatia-verde"></div>
                        <div class="fatia fatia-vermelha"></div>
                        <div class="centro-circulo"></div>
                    </div>-->
                    <div class="grafico-container my-4">
                        <canvas id="graficoReceitaGasto"></canvas>
                    </div>

                    <div class="d-grid gap-3 col-6 mx-auto mb-5">
                        <a href="receita/cadastro-receita.jsp" class="btn btn-success btn-lg">Receitas</a>
                        <a href="gasto/cadastro-gasto.jsp" class="btn btn-danger btn-lg">Gastos</a>
                    </div>

                    <div class="grid gap-3 col-6 mx-auto mb-5">
                        <div class="bg-secondary text-center rounded p-3">
                            <h5 class="card-title text-light mb-0">Minhas Caixinhas</h5>
                            <p class="text-light small">Gerencie suas reservas com segurança</p>
                            <div>
                                <a href="conta/cadastro-conta.jsp" class="btn btn-dark text-light">Cadastrar</a>
                                <a href="conta" class="btn btn-outline-light">Ver Todas</a>
                            </div>
                        </div>
                    </div>

                    <div class="row justify-content-center">
                        <div class="col-md-6">
                            <ul class="list-group">
                                <a href="telas/investimento.jsp" class="btn btn-secondary btn-outline-dark btn-lg">
                                    <i class="bi bi-clock"></i> Investimento
                                </a>
                                <a href="telas/aulas.jsp" class="btn btn-secondary btn-outline-dark btn-lg">
                                    <i class="bi bi-camera-video"></i> Assistir aulas
                                </a>
                                <a href="telas/fale.jsp" class="btn btn-secondary btn-outline-dark btn-lg">
                                    <i class="bi bi-chat"></i> Fale com o Sinhô
                                </a>
                            </ul>
                        </div>
                    </div>

                    <div class="justify-content">
                            <img src="assets/transperent-footer.svg" width="100" height="100">
                    </div>

                </div>

            <script>
                const ctx = document.getElementById('graficoReceitaGasto').getContext('2d');
                new Chart(ctx, {
                    type: 'doughnut',
                    data: {
                        labels: ['Receitas', 'Gastos'],
                        datasets: [{
                            label: 'R$',
                            data: [1000, 600], // teste
                            backgroundColor: ['#0e8046', '#981229'],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                position: 'bottom',
                            }
                        }
                    }
                });
            </script>

        </main>

        <%@ include file="/includes/footer.jspf" %>

    </div>
</body>
</html>
