<%@ page import="java.util.List" %>
<%@ page import="br.dev.biah.seniorinvest.model.Gasto" %>
<html>
<head>
    <title>Gastos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
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
</body>
</html>
