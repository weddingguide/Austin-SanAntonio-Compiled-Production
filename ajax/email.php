<?php

require_once('php/settings.php');
require_once('php/class.phpmailer.php');



if(isset($_POST['json']) && strlen($_POST['json']) > 0 && json_decode($_POST['json'])){
	
	
	$json			=	json_decode($_POST['json']);
	
	
	if(isset($_POST['email']) && !empty($_POST['email'])){
		
		$email		=	(string)$_POST['email'];
		
	}
	else{
		die('missing email address');
		
	}
	
	$base_tmpl		=	file_get_contents('tmpl/email/base.html');
	$category_tmpl	=	file_get_contents('tmpl/email/category.html');
	$items_tmpl		=	file_get_contents('tmpl/email/items.html');
	$item_tmpl		=	file_get_contents('tmpl/email/item.html');
	
	$html			=	$base_tmpl;
	
	$category_html	=	"";
	
	foreach($json->categories as $category){
		
		$tmp		=	$category_tmpl;
		
		$tmp		=	str_replace('#CATEGORYNAME#',$category->name,$tmp);
		$tmp		=	str_replace('#ESTIMATEDCOST#',"$".$category->estimate,$tmp);
		$tmp		=	str_replace('#ACTUALCOST#',"$".$category->total,$tmp);
		
		if(isset($category->items) && !empty($category->items)){
			
			$items		=	$items_tmpl;
			$items_html	=	"";
			
			foreach($category->items as $item){
				
				$itm		=	$item_tmpl;
				
				$itm		=	str_replace('#ITEMNAME#',$item->name,$itm);
				$itm		=	str_replace('#ITEMCOST#',"$".$item->cost,$itm);
				
				$items_html	.=	$itm;
				
			}
			
			$items_html		=	str_replace('#ITEMS#',$items_html,$items);
			$tmp			=	str_replace('#ITEMS#',$items_html,$tmp);
		}
		else{
			$tmp			=	str_replace('#ITEMS#',"",$tmp);
		}
		
		$category_html	.=	$tmp;
		
	}
	
	$html			=	str_replace('#CATEGORIES#',$category_html,$html);
	$html			=	str_replace('#BUDGET#',"$".$json->budget,$html);
	$html			=	str_replace('#GUESTS#',$json->guests,$html);
	$html			=	str_replace('#COST#',"$".$json->total,$html);
	
	$mail			=	new PHPMailer();
				
//	$mail->SMTPDebug  = 2; 
				
	$mail->IsSMTP(); // telling the class to use SMTP
	$mail->Host       = SMTP_HOST;
	$mail->SMTPAuth   = true; 
	$mail->SMTPSecure = "tls";                 
	$mail->Port       = 587;                  
	$mail->Username   = SMTP_USER;
	$mail->Password   = SMTP_PASSWORD;        
//	$mail->AuthType	  = "PLAIN";
				
				
				
	$mail->SetFrom(SMTP_FROM_ADDRESS,SMTP_FROM_NAME);
				
	$mail->AddReplyTo(SMTP_REPLY_ADDRESS,SMTP_FROM_NAME);
				
	$mail->Subject    = "Test Bridal Calc Email";
				
	$mail->AltBody    = "Please use an HTML capable viewer to read this message.";
				
	$mail->MsgHTML($html);
				
				
	$mail->AddAddress($email,$email);

				
				
	//send the mail
	if($mail->Send()) {
				
		die('ok');					
					
	}
	else{
		
		die();
	}
	
	
	
}
else{
	
	die('Invalid JSON payload');
}



?>