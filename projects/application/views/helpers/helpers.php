
<?php
/**
 * 
 * @param array $options
 * @param string $name
 * @param string $id
 * @param int $value
 * @param string $multiple  /if multiple value must be 'multiple' else ''
 * @return string
 */

function getSelect($options,$label,$name,$selected,$multiple)
{
$string=$label.":<select ".$multiple." name=\"".$name."\">"."\n";
foreach ($options as $key => $value)
 {
 	if ($selected==$key)	
  		$string.="<option value=\"".$key."\" selected>".$value."</option>"."\n";
 	else 
 		$string.="<option value=\"".$key."\" >".$value."</option>"."\n";
 }

 $string.='</select>'."\n";
 return $string;
}

/**
 * 
 * @param array $options
 * @param string $labe
 * @param string $id
 * @param unknown $value
 * @param unknown $type
 * @return string
 */
function getCheck($options,$label,$name,$selected,$type)
{
$string=$label.": "."\n";
	foreach ($options as $key => $value)
	{		
		if ($selected==$key)
			$string.=$value."<input type=\"".$type."\" name=\"".$name."\" value=\"".$key."\" checked>"."\n";
		else
			$string.=$value."<input type=\"".$type."\" name=\"".$name."\" value=\"".$key."\" >"."\n";
	}
	return $string;
}


?>
