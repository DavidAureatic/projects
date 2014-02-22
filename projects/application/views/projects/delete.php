<form method="post" 
	  enctype="multipart/form-data">
<ul>
<li>
Id: <input type="hidden" name="idproject" value="<?=$_GET['id'];?>"/>
</li>
<li>
Name: <?=isset($project['name'])?$project['name']:'';?>
</li>
<li>
Start Date: <?=isset($project['date_ini'])?$project['date_ini']:'';?>
</li>
<li>
Status: <?=isset($project['status'])?$project['status']:'';?>
</li>
<li>
Si: <input type="submit" name="Borrar" value="Si"/>
</li>
<li>
No: <input type="submit" name="Borrar" value="No"/>
</li>

</ul>
</form>