<?php 
include_once 'dbConnection.php';

function chkValueFromArray($arr,$val,$findPos,$returnPos){
	if(count($arr) > 0){
		$result = null;
		for($i=0; $i<count($arr); $i++){
			if($arr[$i][$findPos] == $val){
				$result = $arr[$i][$returnPos];
			}
		}
		return $result;
	}
}

// Import customer csv data
$customerData = array_map('str_getcsv', file('./csv_files/customer_category.csv'));
// print_R($customerData);

// Skip heading by started loop from 1.
for($i=1; $i<count($customerData); $i++){
	$companyName   = $customerData[$i][0];
	$category      = $customerData[$i][1];
			
	// Check already exists record
	// $getQuery = "SELECT id FROM users WHERE company_name = '".$companyName."'";
	// $getResult = $db->query($getQuery);
		
	// Insert data in the database
	// $db->query("INSERT INTO users (company_name) VALUES ('".$companyName."')");
}

$priceData = array_map('str_getcsv', file('./csv_files/price_category.csv'));
// print_R($priceData);
// Skip heading by started loop from 1.
for($i=1; $i<count($priceData); $i++){
	$partNo   = $priceData[$i][0];
	$price    = $priceData[$i][1];
	$category = $priceData[$i][2];
	
	// Check if already exists Part Number
	$getQuery = "SELECT part_number FROM product WHERE part_number = '".$partNo."'";
	$getResult = $db->query($getQuery);
		
	if($getResult->num_rows == 0){
		// Insert New Part Number into Product Table
		$db->query("INSERT INTO product (part_number) VALUES ('".$partNo."')");
	}
}
	
// Fetch company from user table
$usersArr = [];
$getCompany = "SELECT * FROM users";
$getData = $db->query($getCompany);
if($getData->num_rows > 0) {
	while($row = mysqli_fetch_array($getData)){
		$categoryID = chkValueFromArray($customerData, $row['company_name'],0,1);
		$arrData = ['0'=>$row['id'],'1'=>$categoryID];
		// echo $row['id'];
		// echo $row['company_name'];
		array_push($usersArr, $arrData);
	}
}

// print_R($usersArr);
for($i=1; $i<count($priceData); $i++){
	$getQuery = "SELECT id FROM product WHERE part_number = '".$priceData[$i][0]."'";
	$getResult = $db->query($getQuery);
	if($getResult->num_rows > 0) {
		$row = mysqli_fetch_array($getResult);
		$pid = $row['id'];
		// echo $priceData[$i][2];
		$userId = chkValueFromArray($usersArr,$priceData[$i][2],1,0);
		if($userId){
			$getQuery = "SELECT * FROM product_prices WHERE product_id = '".$pid."' AND user_id= '".$userId."'";
			$getResult = $db->query($getQuery);			
			if($getResult->num_rows > 0){
				// Update member data in the database
				$db->query("UPDATE product_prices SET product_price = ".$priceData[$i][1]." WHERE product_id = '".$pid."' AND user_id= '".$userId."'");			
			}else{
				//echo "Insert";
				// Insert New Part Number into Product Table
				echo $db->query("INSERT INTO product_prices (product_id, user_id, product_price) VALUES (".$pid.",".$userId.",".$priceData[$i][1].")");			
			}
		}
	}
}