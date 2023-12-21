<div class="">
    <img class="img" src="../img/logo2.png" alt="logo">
    <h1 class="text-md text-center">REPORTE DEL HISTORIAL DE LOS USUARIOS</h1>
</div>
<?php foreach($datosGroup as $registros): ?>
    <h3 class="text-end mt-2">Nombres:    <?=$registros['nombres']?></h3>
    <h3 class="text-end mt-2">Rol:    <?=$registros['nombrerol']?></h3>
    <h3 class="text-end mt-2">Curso o Grado:    <?=$registros['descripcion']?></h3>
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
            <th>LIBRO</th>
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
            <td><?=$registro['libro']?></td>
            <td><?=$registro['codigo']?> - <?=$registro['codigo_libro']?></td>
            <td><?=$registro['condicionentrega']?></td>
            <td><?=$registro['condiciondevolucion']?></td>
            <td><?=$registro['observaciones']?></td>
            <td><?=$registro['fechaprestamo']?></td>
            <td><?=$registro['fechadevolucion']?></td>
            </tr>
        <?php endforeach?>
    </tbody>
</table>