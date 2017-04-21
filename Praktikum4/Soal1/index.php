<!DOCTYPE html>
<html>
<body>
<?php
if(isset($_POST["submit"]) && $_FILES['fileToUpload']['tmp_name']) {
  	$file=file_get_contents($_FILES['fileToUpload']['tmp_name']);;
  	$array = preg_split('/\s+/', $file);
 	//Buble Sort
  	$size_array=count($array);
  	for($i=0;$i<$size_array;$i++){
  		for($j=0;$j<$size_array;$j++){
  			$number1=(int)$array[$i];
  			$number2=(int)$array[$j];
  			if($number1<$number2){
  				$temp=$number1;
  				$array[$i]=$array[$j];
  				$array[$j]=$temp;
  			}
  		}
  	}
  	for($i=0;$i<$size_array;$i++){
  		echo $array[$i];
  		echo "</br>";
  	}
}
?>
<form action="index.php" method="post" enctype="multipart/form-data">
   Pilih File .txt yg berisi kumpulan angka:</br>
    <input type="file" name="fileToUpload" id="fileToUpload">
    </br>
    <input type="submit" value="Submit" name="submit">
</form>

</body>
</html>