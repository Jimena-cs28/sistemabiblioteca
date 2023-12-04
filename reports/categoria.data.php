<div class="nav">
    <img class="img" src="../img/logo2.png" alt="logo">
    <h1 class="text-md text-center">Reporte de los libros mas pedidos por categoria</h1>
</div>

<table class="table table-border mt-3">
    <colgroup>
        <col style='width: 10%'>
        <col style='width: 50%'>
        <col style='width: 20%'>
        <col style='width: 20%'>
    </colgroup>
    <thead>
        <tr>
            <th>ID</th>
            <th>CATEGORIA</th>
            <th>CODIGO</th>
            <th>CANTIDAD</th>
        </tr>
    </thead>
    <tbody class="text-center">
        <?php foreach($datos as $registro): ?>
            <tr>
            <td><?=$registro['idcategoria']?></td>
            <td><?=$registro['categoria']?></td>
            <td><?=$registro['codigo']?></td>
            <td><?=$registro['CantidadPrestada']?></td>
            </tr>
        <?php endforeach?>
    </tbody>
</table>