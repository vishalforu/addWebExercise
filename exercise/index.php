<?php 
include_once 'dbConnection.php';

$customer = fopen("./csv_files/customer_category.csv", "r");


// Import customer csv data
if ($customer) {
	// Skip the first line
	fgetcsv($customer);
	while(($row = fgetcsv($customer, 0, ",")) !== FALSE) {
		$companyName   = $row[0];
		$category  = $row[1];
		
		// Need unique value to match with existing Database records which are missing in csv.
		$csvRowValue = '';
		
		// Check already exists record
		// $getQuery = "SELECT id FROM customer_name WHERE dbColumnName = '".csvRowValue."'";
		// $getResult = $db->query($getQuery);
		
		/* if($getResult->num_rows > 0){
			// Update data in the database
			$db->query("UPDATE customer_name SET dbColumnName = '".$csvRowValue."' WHERE dbColumnName = '".$csvRowValue."'");
		}else{ */
			// Insert data in the database
			$db->query("INSERT INTO users (company_name) VALUES ('".$companyName."')");
		/* } */
	}
	// Close opened CSV file
	fclose($customer);
}

// Import price csv data
$price = fopen("./csv_files/price_category.csv", "r");
if ($price) {
	// Skip the first line
	fgetcsv($price);
	while(($row1 = fgetcsv($price, 0, ",")) !== FALSE) {
		// Get row data
		$partNo   = $row1[0];
		$price  = $row1[1];
		echo $category  = $row1[2];
		
		// Check already exists record
		// $getQuery = "SELECT id FROM product_prices WHERE dbColumnName = '".csvRowValue."'";
		// $getResult = $db->query($getQuery);
		
		/* if($prevResult->num_rows > 0){
			// Update member data in the database
			$db->query("UPDATE product_price SET product_price = '".$price."' WHERE product_id = '".$productId."'");
		}else{		
			// Insert member data in the database
		   $db->query("INSERT INTO product_prices (product_price) VALUES ('".$price."')");
		}*/
	}
	// Close opened CSV file
	fclose($price);
}
    

	
// I have assumed the db column names into sql queries, these are depends on csv data which are not matching with the database columns. 
