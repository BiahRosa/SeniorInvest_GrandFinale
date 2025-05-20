<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Erro - SeniorInvest</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body class="container mt-5">
<div class="alert alert-danger">
    <h4>Ocorreu um erro inesperado</h4>
    <p>Desculpe pelo transtorno. Tente novamente ou entre em contato com o suporte.</p>
    <% if (exception != null) { %>
    <details>
        <summary>Detalhes técnicos (dev)</summary>
        <pre><%= exception.getMessage() %></pre>
    </details>
    <% } %>
</div>
<a href="index.jsp" class="btn btn-primary">Voltar à página inicial</a>
</body>
<footer class="text-center text-light">
    <div>
        © 2025 Copyright:
        <a class="text-light" href="#!">SeniorInvest.biah.dev.br</a>
    </div>
</footer>
</html>
