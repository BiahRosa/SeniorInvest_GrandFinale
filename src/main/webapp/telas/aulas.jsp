<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Aulas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body class="dashboard-body">
<nav class="navbar navbar-expand-lg mb-3">
    <div class="container-fluid">
        <img src="${pageContext.request.contextPath}/assets/logo.svg" alt="Logo" width="30" height="24">
        <a class="navbar-brand fw-bold text-light" href="${pageContext.request.contextPath}/home.jsp">SêniorInvest</a>
        <div>
            <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/logout">Sair</a>
        </div>
    </div>
</nav>

<h2 class="mb-4">Aulas</h2>
<p>Esta é uma página de exemplo para mostrar que a rota está funcionando.</p>
<a href="${pageContext.request.contextPath}/home.jsp" class="btn btn-primary">Voltar ao início</a>
</body>
</html>
