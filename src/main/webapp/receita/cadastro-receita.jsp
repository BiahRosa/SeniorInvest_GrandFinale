<html>
<head>
    <title>Nova Receita</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
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
    <button class="btn btn-success">Salvar</button>
</form>
</body>
</html>
