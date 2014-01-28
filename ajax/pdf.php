<?php


require_once('php/class.bridalpdf.php');

$pdf			=	new BridalPDF();

$pdf->setJSON(json_decode($_POST['json']));

$pdf->generate();

$pdf->output();



?>