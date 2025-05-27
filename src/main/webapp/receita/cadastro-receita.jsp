<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>Nova Receita</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/global.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/navbar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/cadastro.css" rel="stylesheet">
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
                <h2>Registrar Receita</h2>

                <form method="post" action="../receita">
                    <div class="mb-3">
                        <label>Origem</label>
                        <input class="form-control" name="origem" required>
                    </div>
                    <div class="mb-3">
                        <label>Valor</label>
                        <input class="form-control" type="number" name="valor" step="0.01" required>
                    </div>
                    <div class="mb-3">
                        <label>Data</label>
                        <input class="form-control" type="date" name="data" required>
                    </div>
                    <div class="d-flex justify-content-between mt-3">
                        <a href="${pageContext.request.contextPath}/home" class="btn btn-secondary text-light w-50 me-2">← Voltar</a>
                        <button type="submit" class="btn btn-success w-50">Salvar</button>
                    </div>
                    <div class="mt-3">
                        <a href="${pageContext.request.contextPath}/receita"
                           class="btn btn-dark text-light mb-4">
                            Listar Receitas
                        </a>
                    </div>


                </form>
            </div>
        </main>

        <%@ include file="/includes/footer.jspf" %>

    </div>
</body>
</html>
