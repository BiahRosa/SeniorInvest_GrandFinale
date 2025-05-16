<%@ page import="java.util.List" %>
<%@ page import="br.dev.biah.seniorinvest.model.Receita" %>

<html>
<head>
    <title>Receitas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
<h2>Receitas Registradas</h2>
<table class="table table-bordered">
    <tr><th>ID</th><th>Origem</th><th>Valor</th><th>Data</th></tr>

    <%
        List<Receita> receitas = (List<Receita>) request.getAttribute("receitas");
        if (receitas != null) {
            for (Receita r : receitas) {
    %>
    <tr>
        <td><%= r.getId() %></td>
        <td><%= r.getOrigem() %></td>
        <td>R$ <%= r.getValor() %></td>
        <td><%= r.getData() %></td>
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
</body>
</html>
