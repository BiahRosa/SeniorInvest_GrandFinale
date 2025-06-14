<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="br.dev.biah.seniorinvest.model.Receita" %>

<html>
<head>
    <title>Receitas</title>
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
            <a class="navbar-brand fw-bold text-light" href="${pageContext.request.contextPath}/home">SêniorInvest</a>
            <div>
                <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/logout">Sair</a>
                <a class="btn btn-outline-light me-2" href="${pageContext.request.contextPath}/telas/perfil.jsp">
                    <i class="bi bi-person-circle"></i> Meu Perfil
                </a>
            </div>
        </div>
    </nav>

        <main class="page-content">
            <a href="${pageContext.request.contextPath}/home"
               class="btn btn-outline-secondary mb-3">
                ← Voltar à página inicial
            </a>
            <h2>Receitas Registradas</h2>
            <table class="table table-bordered">
                <tr><th>Data</th><th>Origem</th><th>Valor</th></tr>

                <%
                    List<Receita> receitas = (List<Receita>) request.getAttribute("receitas");
                    if (receitas != null) {
                        for (Receita r : receitas) {
                %>
                <tr>
                    <td><%= r.getData() %></td>
                    <td><%= r.getOrigem() %></td>
                    <td>R$ <%= r.getValor() %></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="4" class="text-danger">Nenhuma receita encontrada.</td>
                </tr>
                <%
                    }
                %>
            </table>
        </main>

        <%@ include file="/includes/footer.jspf" %>

    </div>
</body>
</html>
