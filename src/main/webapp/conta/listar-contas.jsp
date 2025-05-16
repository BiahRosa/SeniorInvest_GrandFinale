<%@ page import="java.util.List" %>
<%@ page import="br.dev.biah.seniorinvest.model.Conta" %>
<html>
<head>
  <title>Contas</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
  <h2>Contas Registradas</h2>
  <a href="cadastro-conta.jsp" class="btn btn-success mb-3">Nova Conta</a>
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
</html>
