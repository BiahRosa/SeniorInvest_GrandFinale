<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Perfil do Usuário</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/global.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/telas.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/navbar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
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
            <div class="perfil-box">
                <h2 class="mb-4">Perfil do Usuário</h2>
                <div class="profile-icon mb-3 text-center">
                    <i class="bi bi-person-circle" style="font-size: 5rem; color: #198754;"></i>
                </div>
                <p><strong>Nome:</strong> ${sessionScope.usuarioLogado.nome}</p>
                <p><strong>Email:</strong> ${sessionScope.usuarioLogado.email}</p>
                <a href="${pageContext.request.contextPath}/home" class="btn btn-success mt-3">Voltar ao início</a>
            </div>
        </main>

        <%@ include file="/includes/footer.jspf" %>

    </div>
</body>
</html>
