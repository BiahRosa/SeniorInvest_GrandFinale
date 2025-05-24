<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="br.dev.biah.seniorinvest.model.Gasto" %>
<html>
<head>
    <title>Gastos</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/global.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/navbar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/listar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/components.css" rel="stylesheet">
</head>
<body>
    <div class="page-container">

        <nav class="navbar navbar-expand-lg mb-3">
            <div class="container-fluid">
                <img src="${pageContext.request.contextPath}/assets/logo.svg" alt="Logo" width="30" height="24">
                <a class="navbar-brand fw-bold text-light" href="${pageContext.request.contextPath}/home.jsp">SêniorInvest</a>
                <div>
                    <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/logout">Sair</a>
                    <a class="btn btn-outline-light me-2" href="${pageContext.request.contextPath}/telas/perfil.jsp">
                        <i class="bi bi-person-circle"></i> Meu Perfil
                    </a>
                </div>
            </div>
        </nav>

        <main class="page-content">
            <a href="${pageContext.request.contextPath}/home.jsp"
               class="btn btn-outline-secondary mb-3">
                ← Voltar à página inicial
            </a>
            <h2>Gastos Registrados</h2>
            <table class="table table-striped">
                <tr><th>ID</th><th>Descrição</th><th>Valor</th><th>Data</th></tr>
                <%
                    List<Gasto> gastos = (List<Gasto>) request.getAttribute("gastos"); // <-- CORRETO
                    if (gastos != null) {
                        for (Gasto g : gastos) {
                %>
                <tr>
                    <td><%= g.getId() %></td>
                    <td><%= g.getDescricao() %></td>
                    <td>R$ <%= g.getValor() %></td>
                    <td><%= g.getData() %></td>
                </tr>
                <%      }
                } else {
                %>
                <tr><td colspan="4" class="text-danger">Nenhum gasto encontrado.</td></tr>
                <% } %>
            </table>
        </main>

        <%@ include file="/includes/footer.jspf" %>

    </div>
</body>
</html>
