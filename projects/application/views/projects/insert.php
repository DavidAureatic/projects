<?php include ('../application/views/helpers/helpers.php') ?>
<form method="post" 
	  enctype="multipart/form-data">
<ul>
<li>
Id: <input type="hidden" name="idproject" value="<?=isset($_GET['id'])?$_GET['id']:'';?>"/>
</li>
<li>
Name: <input type="text" name="name" value="<?=isset($project['name'])?$project['name']:'';?>"/>
</li>
<li>
Alias: <input type="text" name="alias" value="<?=isset($project['alias'])?$project['alias']:'';?>"/>
</li>
<li>
Star Date: <input type="date" name="date_ini" value="<?=isset($project['date_ini'])?$project['date_ini']:'';?>"/>
</li>
<li>
End Date: <input type="date" name="date_fini" value="<?=isset($project['date_fini'])?$project['date_fini']:'';?>"/>
</li>
<li> 
Description: <textarea rows="10" cols="10" name="description"><?=isset($project['description'])?$project['description']:'';?></textarea>
</li>
<li>
Tweet: <input type="text" name="tweet" value="<?=isset($project['tweet'])?$project['tweet']:'';?>"/>
</li>
<li>
<?=(getSelect($optionsC,'Company','companies_idcompany',(isset($project['companies_idcompany'])?$project['companies_idcompany']:''),''))?>
</li>
<li>
<?=(getSelect($optionsS,'Status','statuses_idstatuses',(isset($project['statuses_idstatuses'])?$project['statuses_idstatuses']:''),''))?>
<li>
Enviar: <input type="submit" name="Enviar"/>
</li>
<li>
Borrar: <input type="reset" name="Borrar"/>
</li>
</ul>
</form>