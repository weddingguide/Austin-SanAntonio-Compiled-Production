<?php
require_once('fpdf.php');

class BridalPDF{
	
	private $_pdf;
	private $_json;
	
	
	public function __construct(){
		
		$this->_pdf = new FPDF('P','mm');
		$this->_pdf->AddPage();
		$this->_pdf->SetMargins(10,10);
		
	}
	
	public function setJSON($json=false){

		
		if($json){
			
			$this->_json		=	$json;
			
		}
		
	}
	
	public function generate(){
		
		$this->_buildHeader();
		$this->_buildCategories();
	}
	
	private function _buildHeader(){
		
		$budget			=	'$'.$this->_json->budget;
		$guests			=	$this->_json->guests;
		$total			=	'$'.$this->_json->total;
		
		$this->_pdf->SetFont('Arial','B',13);
		$this->_pdf->SetFillColor(232,237,243);
		$this->_pdf->Cell(63,20,"Your Budget: {$budget}",0,0,'L',true);
		$this->_pdf->Cell(63,20,"# of guests: {$guests}",0,0,'L',true);
		$this->_pdf->Cell(64,20,"Actual Cost: {$total}",0,1,'L',true);
		
		$this->_pdf->SetFont('Arial','B',11);
		$this->_pdf->SetFillColor(37,37,37);
		$this->_pdf->SetTextColor(255,255,255);
		$this->_pdf->Cell(63,10,"Category",0,0,'L',true);
		$this->_pdf->Cell(63,10,"Estimated Cost",0,0,'L',true);
		$this->_pdf->Cell(64,10,"Actual Cost",0,1,'L',true);
		
	}
	
	private function _buildCategories(){
		
		foreach($this->_json->categories as $category){
			
			$this->_addCategory($category);
			
		}
		
	}
	
	private function _addCategory($category){
		
		$name			=	$category->name;
		$estimate		=	'$'.$category->estimate;
		$total			=	'$'.$category->total;
		
		$this->_pdf->SetFont('Arial','B',11);
		$this->_pdf->SetFillColor(232,237,243);
		$this->_pdf->SetTextColor(0,0,0);
		$this->_pdf->Cell(63,15,$name,0,0,'L',true);
		$this->_pdf->Cell(63,15,$estimate,0,0,'L',true);
		$this->_pdf->Cell(64,15,$total,0,1,'L',true);
		
		if(isset($category->items) && !empty($category->items)){

			
			foreach($category->items as $item){
				
				$this->_addItem($item);
				
			}
			
		}
		
	}
	
	private function _addItem($item){
		
		$name			=	' - '.$item->name;
		$cost			=	'$'.$item->cost;
		
		$this->_pdf->SetFont('Arial','',10);
		$this->_pdf->SetFillColor(255,255,255);
		$this->_pdf->SetTextColor(0,0,0);
		$this->_pdf->Cell(63,10,$name,0,0,'L',true);
		$this->_pdf->Cell(63,10,'',0,0,'L',true);
		$this->_pdf->Cell(64,10,$cost,0,1,'L',true);
		
	}
	
	public function output(){
		
		//$this->_pdf->Output();
		$this->_pdf->Output('bridal-budget.pdf', 'D');
	}
	
	
}

?>