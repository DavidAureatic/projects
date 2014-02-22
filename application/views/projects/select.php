<h2 class="sub-header">Projects</h2>
<a href="?action=insert">New Project</a>
<table class="table table-striped">
 <thead>
                <tr>
                  <th>Id</th>
                  <th>Name</th>
                  <th>Alias</th>
                  <th>Start Date</th>
                  <th>End Date</th>
                  <th>Description</th>
                  <th>Tweet</th>
                  <th>Company</th>
                  <th>Status</th>
                  <th>Team</th>
                  <th>Actions</th>                  
                </tr>
              </thead>
<?php 
foreach($filas as $key => $fila):	?>
	<tr>
		<?php 		
		foreach($fila as $column):?>
			<td><?=$column;?></td>
		<?php endforeach; ?>
		<td>
			<a href="teams.php?id=<?=$fila['idproject'];?>">Team</a>
			<?php //TODO team view ?>
			<a href="?action=update&id=<?=$fila['idproject'];?>">Update</a>
			<a href="?action=delete&id=<?=$fila['idproject'];?>">Delete</a>
		</td>
	</tr>
<?php endforeach;?>
</table>