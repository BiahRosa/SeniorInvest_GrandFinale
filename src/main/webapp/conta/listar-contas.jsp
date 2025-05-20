<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="br.dev.biah.seniorinvest.model.Conta" %>
<html>
<head>
  <title>Contas</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body class="container mt-4">
  <h2>Contas Registradas</h2>
  <a href="${pageContext.request.contextPath}/home.jsp"
     class="btn btn-outline-secondary mb-3">
    ← Voltar à página inicial
  </a>
  <table class="table table-bordered">
    <tr><th>ID</th><th>Tipo</th><th>Nome</th><th>Saldo</th><th>Instituição</th><th>Data</th></tr>
    <%
      List<Conta> contas = (List<Conta>) request.getAttribute("contas");
      if (contas != null) {
        for (Conta c : contas) {
    %>
    <tr>
      <td><%= c.getIdConta() %></td>
      <td><%= c.getTipoConta() %></td>
      <td><%= c.getNomeConta() %></td>
      <td>R$ <%= c.getSaldo() %></td>
      <td><%= c.getInstituicao() %></td>
      <td><%= c.getDataCriacao() %></td>
    </tr>
    <%
        }
      } else {
    %>
    <tr>
      <td colspan="4" class="text-danger">Nenhuma conta encontrada.</td>
    </tr>
    <%
      }
    %>
  </table>
</body>
<footer class="text-center text-light">
  <div>
    © 2025 Copyright:
    <a class="text-light" href="#!">SeniorInvest.biah.dev.br</a>
  </div>
</footer>
</html>
