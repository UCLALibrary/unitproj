<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="iso-8859-1">


<html />

<head /><title />Load Report Parser</title></head>



<body bgcolor="black" text="white" />

<center />



<form method="POST" action="<?php echo $PHP_SELF;?>" />


<textarea name="log" wrap="soft" rows="10" cols="40" />
</textarea><br />

<input type="submit" name="submit_button">
</form>



<?php


 if (isset($_POST['submit_button'])) {
 
    $errorlog = $_POST['log']; 

 define ("LINE", "____________________________________________________________________________________________________");
 

 $records = explode("\r\n\r\n", $errorlog);

 
 $max = sizeof($records);


 for ($i=1; $i <= $max; $i++) {

    if (strpos($records[$i-1], 'ERROR')) {

       $errors[] = $records[$i-1];

       } // END ERROR

    elseif (strpos($records[$i-1], 'failed overlay')) {

       $failedoverlays[] = $records[$i-1];

       } // END elseif failed overlay

    elseif (strpos($records[$i-1], 'Added Voyager hol')) {

       if (strpos($records[$i-1], 'Updated Voyager bib')) {

          $failedhld[] = $records[$i-1];

       } // END if Updated Voyager bib

    } // END elseif Added Voyager hol

 } // END FOR
 
 $max = sizeof($errors);



 $errorlist = $errorlist.LINE."\n";

 $errorlist = $errorlist."ERRORS:\n";

 $errorlist = $errorlist.LINE."\n\n";


 for ($i=1; $i <= $max; $i++) {

     $errorlist = $errorlist.$errors[$i-1]."\n\n";

 }

 $errorlist = $errorlist.LINE."\n";

 $errorlist = $errorlist."FAILED BIB OVERLAYS:\n";

 $errorlist = $errorlist.LINE."\n\n";



 $max = sizeof($failedoverlays);


 for ($i=1; $i <= $max; $i++) {

     $errorlist = $errorlist.$failedoverlays[$i-1]."\n\n";

 }


 $errorlist = $errorlist.LINE."\n";

 $errorlist = $errorlist."FAILED HOLDINGS OVERLAYS:\n";

 $errorlist = $errorlist.LINE."\n\n";


 $max = sizeof($failedhld);


 for ($i=1; $i <= $max; $i++) {

     $errorlist = $errorlist.$failedhld[$i-1]."\n\n";

 }

 echo "<textarea cols=\"100\" rows=\"50\" />";

 echo $errorlist;

 echo "</textarea>";

} // END if isset


?>



</center>


</body>
</html>