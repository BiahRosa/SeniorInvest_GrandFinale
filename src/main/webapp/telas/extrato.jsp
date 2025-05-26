<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="br.dev.biah.seniorinvest.model.Movimento" %>

<html>
<head>
    <title>Extrato</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/icon.png">
    <link href="${pageContext.request.contextPath}/css/global.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/listar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/navbar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
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
        <h2 class="mb-4">Extrato Financeiro</h2>

        <a href="${pageContext.request.contextPath}/home.jsp" class="btn btn-outline-secondary mb-4">← Voltar</a>

        <table class="table table-hover">
            <thead>
            <tr>
                <th>Data</th>
                <th>Tipo</th>
                <th>Descrição</th>
                <th>Valor</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Movimento> movimentos = (List<Movimento>) request.getAttribute("movimentos");
                if (movimentos != null && !movimentos.isEmpty()) {
                    for (Movimento m : movimentos) {
            %>
            <tr class="<%= m.getTipo().equals("Gasto") ? "table-danger" : "table-success" %>">
                <td><%= m.getData().format(java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy")) %></td>
                <td><%= m.getTipo() %></td>
                <td><%= m.getDescricao() %></td>
                <td>R$ <%= m.getValor() %></td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="4" class="text-center text-muted">Nenhum movimento encontrado.</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </main>

    <%@ include file="/includes/footer.jspf" %>
    
</div>
</body>
</html>
