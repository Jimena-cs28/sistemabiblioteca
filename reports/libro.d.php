<div class="">
    <img class="img" src="../img/logo2.png" alt="logo">
    <h1 class="text-md text-center mb-4">REPORTE DEL HISTORIAL DE LIBROS PEDIDOS</h1>
</div>

<?php foreach($datosGroup as $registros): ?>
    <h3 class="text-end mt-2">Libro:    <?=$registros['libro']?></h3>
    <h3 class="text-end mt-2">Codigo:    <?=$registros['codigo']?></h3>
<?php endforeach?>

<table class="table table-border mt-3">
    <colgroup>
        <col style='width: 4%'>
        <col style='width: 25%'>
        <col style='width: 10%'>
        <col style='width: 10%'>
        <col style='width: 13%'>
        <col style='width: 13%'>
        <col style='width: 12%'>
        <col style='width: 12%'>
    </colgroup>
    <thead>
        <tr>
            <th>ID</th>
            <th>USUARIOS</th>
            <th>CODIGO</th>
            <th>C.ENTREGA</th>
            <th>C.DEVOLUCION</th>
            <th>OBSERVACION</th>
            <th>F.PRESTAMO</th>
            <th>F.DEVOLUCION</th>
        </tr>
    </thead>
    <tbody class="text-center">
        <?php foreach($datos as $registro): ?>
            <tr>
            <td><?=$registro['idlibroentregado']?></td>
            <td><?=$registro['nombres']?></td>
            <td><?=$registro['codigo_libro']?></td>
            <td><?=$registro['condicionentrega']?></td>
            <td><?=$registro['condiciondevolucion']?></td>
            <td><?=$registro['observaciones']?></td>
            <td><?=$registro['fechaprestamo']?></td>
            <td><?=$registro['fechadevolucion']?></td>
            </tr>
        <?php endforeach?>
    </tbody>
</table>