<?php

require_once '../vendor/autoload.php';
require_once '../models/reporte.php';

use Spipu\Html2Pdf\Html2Pdf;
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Exception\ExceptionFormatter;

try {
    //instanciar clase 
    $fechasolicitud = isset($_GET['fechasolicitud']) ? $_GET['fechasolicitud'] : null;
    $fechasolicitud1 = isset($_GET['fechasolicitud1']) ? $_GET['fechasolicitud1'] : null;

    $report = new Reporte();
    $datos = $report->reporteSolicitud(['fechasolicitud' => $fechasolicitud, 'fechasolicitud1' => $fechasolicitud1]);


    // $datos = $report->reporteSolicitud($_GET['fechasolicitud'],['fechasolicitud1']);
    $titulo = $_GET['fechasolicitud'];
    $titulo1 = $_GET['fechasolicitud1'];
    ob_start();

    //hoJa de estilos
    include './estilo.html';
    //archivo con datos(estaticos/dinamicoa)
    include './tiempo.data.php';

    $content = ob_get_clean();

    $html2pdf = new Html2Pdf('L', 'A4', 'es');
    $html2pdf->writeHTML($content);
    $html2pdf->output('Mediateca.pdf');

} catch (Html2PdfException $e) {
    $html2pdf->clean();

    $formatter = new ExceptionFormatter($e);
    echo $formatter->getHtmlMessage();
}