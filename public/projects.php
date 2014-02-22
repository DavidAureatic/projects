<?php 

include('../application/model/functions.php');
include('../application/model/projects.php');

$config=parse_ini_file('../application/configs/settings.ini', true);


if(isset($_GET['action']))
	$action = $_GET['action'];
else
	$action = "select";
$optionsC=getSelecValues('companies','idcompany','company',$config['database']);
$optionsS=getSelecValues('statuses','idstatuses','status',$config['database']);
switch ($action)
{
	case 'update':	
		if($_POST)
		{
			update('projects', $_POST, $config['database']);		
			header("Location: /projects.php");
		}
		else
		{			
			$project = getProject($_GET['id'], $config['database']);
			ob_start();
				include('../application/views/projects/insert.php');
				$content=ob_get_contents();
			ob_end_clean();
		}		
	break;
	
	case 'insert':
		if($_POST)
		{
			insert('projects', $_POST, $config['database']);			
			header("Location: /projects.php");
		}
		else 
		{
			ob_start();
				include('../application/views/projects/insert.php');
				$content=ob_get_contents();
			ob_end_clean();
		}				
	break;
	
	case 'delete':
		if($_POST)
		{
			if($_POST['Borrar']=="Si")
			{	
				deleteProject($_POST['idproject'], $config['database']);			
			}
			header("Location: /projects.php");
		}
		else
		{
			$project = getProject($_GET['id'], $config['database']);
			ob_start();
				include('../application/views/projects/delete.php');
				$content=ob_get_contents();
			ob_end_clean();
		}
	break;
	
	case 'select':
		$filas = getProjects($config['database']);
		ob_start();
			include ('../application/views/projects/select.php');
			$content=ob_get_contents();
		ob_end_clean();		
	break;
	
	default:
	break;
}


include('../application/views/layouts/backend.phtml');



