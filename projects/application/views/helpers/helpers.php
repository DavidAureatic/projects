<?php
/** get intup select or select multiple
 * 
 * @param array $options
 * @param string $label
 * @param string $name
 * @param string $selected 
 * @param string $multiple  /if multiple value must be 'multiple' else ''
 * @return string
 */

function getSelect($options,$label,$name,$selected,$multiple)
{
	$string=$label.":<select ".$multiple." name=\"".$name."\">"."\n";
	foreach ($options as $key => $value)
		$string.="<option value=\"".$key."\"".(($selected==$key)?'selected':'').">".$value."</option>"."\n";
	$string.='</select>'."\n";
	print $string;
	return;
}


/**
 * 
 * @param array $options
 * @param string $label
 * @param string $name
 * @param unknown $selected
 * @param unknown $type   /type must be radio or check
 * @return string
 */
function getCheck($options,$label,$name,$selected,$type)
{
$string=$label.": "."\n";
	foreach ($options as $key => $value)
			$string.=$value."<input type=\"".$type."\" name=\"".$name."\" value=\"".$key."\"".(($selected==$key)?'checked':'').">"."\n";
	print $string;
	return;
}
?>
