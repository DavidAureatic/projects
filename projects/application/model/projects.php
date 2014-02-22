<?php

/**
 * Get projects array
 * @param array $config
 * @return array
 */
function getProjects($config)
{
	$link = connect($config);
	selectDb($link, $config);
	
	$sql = "SELECT projects.idproject, projects.name, 
				projects.alias,projects.date_ini,
				projects.date_fini, projects.description, 
				projects.tweet, companies.company as company, 
				statuses.status as status
			FROM projects
			LEFT JOIN companies on companies.idcompany=projects.companies_idcompany
			LEFT JOIN statuses on statuses.idstatuses=projects.statuses_idstatuses";
	$result = mysqli_query($link, $sql);
	$rows=array();
	while($row = mysqli_fetch_assoc($result))
	{
		$row['team'] = getTeam($row['idproject'], $config);
		$rows[]=$row;
	}
	return $rows;
}


function getTeam($idproject,$config)
{
	$link = connect($config);
	selectDb($link, $config);

	$sql = "SELECT GROUP_CONCAT(users.user SEPARATOR '|') as team 
			FROM projects.teams
			INNER JOIN users on users.idusers=teams.users_idusers
			WHERE teams.projects_idproject=".$idproject;
	$result = mysqli_query($link, $sql);
	$row = mysqli_fetch_assoc($result);
	return $row['team'];
}

/**
 * Get DBMS link conection
 * @param unknown $config
 * @return link
 */
function connect($config)
{
	$link = mysqli_connect($config['host'],
			$config['user'],
			$config['password']
	);
	return $link;
}


/**
 * Select database
 * @param unknown $config
 * @return null
 */
function selectDb($link, $config)
{
	mysqli_select_db($link, $config['db'] );
	mysqli_query($link, 'SET NAMES utf8');
	return;
}


/**get  project data
 * 
 * @param string $idproject
 * @param array $config
 * @return array
 */

function getProject($idproject, $config)
{
	$link = connect($config);
	selectDb($link, $config);
	
	$sql = "SELECT projects.idproject, projects.name, 
				projects.alias,projects.date_ini,
				projects.date_fini, projects.description, 
				projects.tweet, companies.company as company, 
				statuses.status as status, projects.companies_idcompany,
				projects.statuses_idstatuses
			FROM projects
			LEFT JOIN companies on companies.idcompany=projects.companies_idcompany
			LEFT JOIN statuses on statuses.idstatuses=projects.statuses_idstatuses
			WHERE projects.idproject = ".$idproject;
	$result = mysqli_query($link, $sql);
	while($row = mysqli_fetch_assoc($result))
	{
		$rows[]=$row;
	}
		
	return $rows[0];
}

/**Delete project from database
 * 
 * @param int $idproject
 * @param array $config
 * @return int numbers of files afected
 */
function deleteProject($idproject, $config)
{
	$link = connect($config);
	selectDb($link, $config);	
	$sql = "DELETE FROM projects WHERE idproject = ".$idproject;
	$result = mysqli_query($link, $sql);
	
	return $result;
}


/**insert project data into database
 * 
 * @param string $tablename
 * @param array $data 
 * @param array $config  
 * @return number of files inserted
 */
function insert($tablename, $data, $config)
{
	$fields = getFields($tablename, $data, $config);
	$sql = "INSERT INTO ".$tablename." SET ";
	foreach ($fields[1] as $key => $value)
	{
		$sql.=$key . "='".$value."',";
	}
	$sql = substr($sql, 0, strlen($sql)-1);
	$link = connect($config);
	selectDb($link, $config);
	$result = mysqli_query($link, $sql);
	return $result;
}


function getSelecValues($tablename,$id,$value,$config)
{
	$link = connect($config);
	selectDb($link, $config);
	
	$sql = "SELECT ".$id.",".$value."
			FROM ".$tablename;
	$result = mysqli_query($link, $sql);
	$rows=array();
	while($row = mysqli_fetch_assoc($result))
	{
		$rows[$row[$id]]=$row[$value];
	}
	return $rows;
}



/**update project info
 * 
 * @param string $tablename
 * @param array $data 
 * @param array $config
 * @return number of files afected
 */

function update($tablename, $data, $config)
{
	$fields = getFields($tablename, $data, $config);
	$sql = "UPDATE ".$tablename." SET ";
	foreach ($fields[1] as $key => $value)
	{
		$sql.=$key . "='".$value."',";
	}
	$sql = substr($sql, 0, strlen($sql)-1);
	$sql.= " WHERE ";
	foreach ($fields[0] as $key => $value)
	{
		$sql.=$value."='".$data[$value]."' AND ";
	}
	$sql = substr($sql, 0, strlen($sql)-4);
	
	$link = connect($config);
	selectDb($link, $config);
	$result = mysqli_query($link, $sql);
	return $result;	
}

/**return table fields
 * 
 * @param string $tablename
 * @param arary $data
 * @param array $config
 * @return multitype: fields names and data
 */
function getFields($tablename, $data, $config)
{
	$sql = "DESCRIBE ".$tablename;
	$link = connect($config);
	selectDb($link, $config);
	$result = mysqli_query($link, $sql);
	while($row = mysqli_fetch_assoc($result))
	{		
		if($row['Key']!=='PRI')
			$fields[] = $row['Field'];
		else
			$pkey[]=$row['Field'];			
	}
	foreach ($data as $key => $value)
	{
		if(!in_array($key, $fields))
			unset($data[$key]);
		
	}	
	return array($pkey, $data);
}



