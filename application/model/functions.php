<?php

function my_print_r($var)
{
	echo '<pre>';
	print_r($var);
	echo '</pre>';
	die;
}

