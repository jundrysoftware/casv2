<?php
/*~ Archivo listar-subcuentas.php
.---------------------------------------------------------------------------.
|    Software: CAS - Computerized Accountancy System                        |
|     Versión: 1.0                                                          |
|   Lenguajes: PHP, HTML, CSS3 y Javascript                                 |
| ------------------------------------------------------------------------- |
|   Autores: Ricardo Vigil (alexcontreras@outlook.com)                      |
|          : Vanessa Campos                                                 |
|          : Ingrid Aguilar                                                 |
|          : Jhosseline Rodriguez                                           |
| Copyright (C) 2013, FIA-UES. Todos los derechos reservados.               |
| ------------------------------------------------------------------------- |
|                                                                           |
| Este archivo es parte del sistema de contabilidad C.A.S para la cátedra   |
| de Sistemas Contables de la Facultad de Ingeniería y Arquitectura de la   |
| Universidad de El Salvador.                                               |
|                                                                           |
'---------------------------------------------------------------------------'
*/
?>
<?php 
	include("sesion.php");
	if(!$_COOKIE["sesion"]){
		header("Location: salir.php");
	}
?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="../css/estilos.css"/>
	<link rel="shortcut icon" type="image/x-icon" href="../favicon.ico" />
	<script>
	    !window.jQuery && document.write("<script src='../js/jquery.min.js'><\/script>");
	</script>
	<title>C.A.S | Listado de Subcuentas</title>
</head>

<body>
	<!-- Barra de navegación -->
	<?php include("nav.php"); ?>

	<!-- Contenido de la página -->
	<div class="container" id="contenido">
		<div class="row row-offcanvas row-offcanvas-right">
			<div class="col-xs-12 col-sm-9">
				<div class="page-header">
        			<h3>Listado de subcuentas</h3>
        		</div>

        		<!-- Activos -->
        		<div class="row">
        			<div class="col-lg-12">
        				<div class="page-header">
        					<h4>1. Activos</h4>
        				</div>
        				<?php 
        					include("conexion.php");
        					$consulta = "SELECT 
        								CONCAT_WS('. ', b.`codigo_grupo`, b.`nombre_grupo`) AS Grupo,
        								CONCAT_WS('. ', c.`codigo_subgrupo`, c.`nombre_subgrupo`) AS Subgrupo,
        								CONCAT_WS('. ', d.`codigo_cuenta`, d.`nombre_cuenta`) AS Cuenta,
        								CONCAT_WS('. ', e.`codigo_subcuenta`, e.`nombre_subcuenta`) AS Subcuenta
        								FROM 
        								clasificaciones a, 
        								catalogo_grupos b, 
        								catalogo_subgrupos c, 
        								catalogo_cuentas d, 
        								catalogo_subcuentas e
        								WHERE
        								e.`cuenta`=d.`codigo_cuenta` AND
        								d.`subgrupo`=c.`codigo_subgrupo` AND
        								c.`grupo`=b.`codigo_grupo` AND
        								b.`clasificacion`=a.`codigo_clasificacion` AND
        								a.`codigo_clasificacion`=1";

        					$ejecutar_consulta = $conexion->query($consulta);

        					echo "<div>";
									echo "<table class='table table-hover table-bordered table-striped  table-condensed table-responsive text-left'>";
									echo "<thead>";
									echo "<tr>";
									echo "<th class='text-center'>Grupo</th>";
									echo "<th class='text-center'>Subgrupo</th>";
									echo "<th class='text-center'>Cuenta</th>";
									echo "<th class='text-center'>Subcuenta</th>";
									echo "</tr>";
									echo "</thead>";
									echo "<tbody>";

									while($registro = $ejecutar_consulta->fetch_assoc()){
										echo "<tr>";
										echo "<td>".utf8_encode($registro["Grupo"])."</td>";
										echo "<td>".utf8_encode($registro["Subgrupo"])."</td>";
										echo "<td>".utf8_encode($registro["Cuenta"])."</td>";
										echo "<td>".utf8_encode($registro["Subcuenta"])."</td>";
										echo "</tr>";
									}
									
									echo "</tbody>";
									echo "</table>";
									echo "</div>";
        				?>
        			</div>
        		</div>

        		<!-- Pasivos -->
        		<div class="row">
        			<div class="col-lg-12">
        				<div class="page-header">
        					<h4>2. Pasivos</h4>
        				</div>
        				<?php 
        					$consulta = "SELECT 
        								CONCAT_WS('. ', b.`codigo_grupo`, b.`nombre_grupo`) AS Grupo,
        								CONCAT_WS('. ', c.`codigo_subgrupo`, c.`nombre_subgrupo`) AS Subgrupo,
        								CONCAT_WS('. ', d.`codigo_cuenta`, d.`nombre_cuenta`) AS Cuenta,
        								CONCAT_WS('. ', e.`codigo_subcuenta`, e.`nombre_subcuenta`) AS Subcuenta
        								FROM 
        								clasificaciones a, 
        								catalogo_grupos b, 
        								catalogo_subgrupos c, 
        								catalogo_cuentas d, 
        								catalogo_subcuentas e
        								WHERE
        								e.`cuenta`=d.`codigo_cuenta` AND
        								d.`subgrupo`=c.`codigo_subgrupo` AND
        								c.`grupo`=b.`codigo_grupo` AND
        								b.`clasificacion`=a.`codigo_clasificacion` AND
        								a.`codigo_clasificacion`=2";

        					$ejecutar_consulta = $conexion->query($consulta);

        					echo "<div>";
									echo "<table class='table table-hover table-bordered table-striped  table-condensed table-responsive text-left'>";
									echo "<thead>";
									echo "<tr>";
									echo "<th class='text-center'>Grupo</th>";
									echo "<th class='text-center'>Subgrupo</th>";
									echo "<th class='text-center'>Cuenta</th>";
									echo "<th class='text-center'>Subcuenta</th>";
									echo "</tr>";
									echo "</thead>";
									echo "<tbody>";

									while($registro = $ejecutar_consulta->fetch_assoc()){
										echo "<tr>";
										echo "<td>".utf8_encode($registro["Grupo"])."</td>";
										echo "<td>".utf8_encode($registro["Subgrupo"])."</td>";
										echo "<td>".utf8_encode($registro["Cuenta"])."</td>";
										echo "<td>".utf8_encode($registro["Subcuenta"])."</td>";
										echo "</tr>";
									}
									
									echo "</tbody>";
									echo "</table>";
									echo "</div>";
        				?>
        			</div>
        		</div>

        		<!-- Capital -->
        		<div class="row">
        			<div class="col-lg-12">
        				<div class="page-header">
        					<h4>3. Capital</h4>
        				</div>
        				<?php 
        					$consulta = "SELECT 
        								CONCAT_WS('. ', b.`codigo_grupo`, b.`nombre_grupo`) AS Grupo,
        								CONCAT_WS('. ', c.`codigo_subgrupo`, c.`nombre_subgrupo`) AS Subgrupo,
        								CONCAT_WS('. ', d.`codigo_cuenta`, d.`nombre_cuenta`) AS Cuenta,
        								CONCAT_WS('. ', e.`codigo_subcuenta`, e.`nombre_subcuenta`) AS Subcuenta
        								FROM 
        								clasificaciones a, 
        								catalogo_grupos b, 
        								catalogo_subgrupos c, 
        								catalogo_cuentas d, 
        								catalogo_subcuentas e
        								WHERE
        								e.`cuenta`=d.`codigo_cuenta` AND
        								d.`subgrupo`=c.`codigo_subgrupo` AND
        								c.`grupo`=b.`codigo_grupo` AND
        								b.`clasificacion`=a.`codigo_clasificacion` AND
        								a.`codigo_clasificacion`=3";

        					$ejecutar_consulta = $conexion->query($consulta);

        					echo "<div>";
									echo "<table class='table table-hover table-bordered table-striped  table-condensed table-responsive text-left'>";
									echo "<thead>";
									echo "<tr>";
									echo "<th class='text-center'>Grupo</th>";
									echo "<th class='text-center'>Subgrupo</th>";
									echo "<th class='text-center'>Cuenta</th>";
									echo "<th class='text-center'>Subcuenta</th>";
									echo "</tr>";
									echo "</thead>";
									echo "<tbody>";

									while($registro = $ejecutar_consulta->fetch_assoc()){
										echo "<tr>";
										echo "<td>".utf8_encode($registro["Grupo"])."</td>";
										echo "<td>".utf8_encode($registro["Subgrupo"])."</td>";
										echo "<td>".utf8_encode($registro["Cuenta"])."</td>";
										echo "<td>".utf8_encode($registro["Subcuenta"])."</td>";
										echo "</tr>";
									}
							
									echo "</tbody>";
									echo "</table>";
									echo "</div>";
        				?>
        			</div>
        		</div>

        		<!-- Resultados -->
        		<div class="row">
        			<div class="col-lg-12">
        				<div class="page-header">
        					<h4>4. Resultados</h4>
        				</div>
        				<?php 
        					$consulta = "SELECT 
        								CONCAT_WS('. ', b.`codigo_grupo`, b.`nombre_grupo`) AS Grupo,
        								CONCAT_WS('. ', c.`codigo_subgrupo`, c.`nombre_subgrupo`) AS Subgrupo,
        								CONCAT_WS('. ', d.`codigo_cuenta`, d.`nombre_cuenta`) AS Cuenta,
        								CONCAT_WS('. ', e.`codigo_subcuenta`, e.`nombre_subcuenta`) AS Subcuenta
        								FROM 
        								clasificaciones a, 
        								catalogo_grupos b, 
        								catalogo_subgrupos c, 
        								catalogo_cuentas d, 
        								catalogo_subcuentas e
        								WHERE
        								e.`cuenta`=d.`codigo_cuenta` AND
        								d.`subgrupo`=c.`codigo_subgrupo` AND
        								c.`grupo`=b.`codigo_grupo` AND
        								b.`clasificacion`=a.`codigo_clasificacion` AND
        								a.`codigo_clasificacion`=4";

        					$ejecutar_consulta = $conexion->query($consulta);

        					echo "<div>";
									echo "<table class='table table-hover table-bordered table-striped  table-condensed table-responsive text-left'>";
									echo "<thead>";
									echo "<tr>";
									echo "<th class='text-center'>Grupo</th>";
									echo "<th class='text-center'>Subgrupo</th>";
									echo "<th class='text-center'>Cuenta</th>";
									echo "<th class='text-center'>Subcuenta</th>";
									echo "</tr>";
									echo "</thead>";
									echo "<tbody>";

									while($registro = $ejecutar_consulta->fetch_assoc()){
										echo "<tr>";
										echo "<td>".utf8_encode($registro["Grupo"])."</td>";
										echo "<td>".utf8_encode($registro["Subgrupo"])."</td>";
										echo "<td>".utf8_encode($registro["Cuenta"])."</td>";
										echo "<td>".utf8_encode($registro["Subcuenta"])."</td>";
										echo "</tr>";
									}
									
									echo "</tbody>";
									echo "</table>";
									echo "</div>";
        				?>
        			</div>
        		</div>
        	</div><!--/span-->

			<!-- Barra lateral o sidebar -->
        	<?php include("sidebar.php"); ?>
        	
        </div>
    </div>

	<!-- Pie de página o Footer -->
	<?php include("footer.php"); ?>

	<!-- Ventanas flotantes -->
	<?php include("modal.php"); ?>

	<script src="../js/bootstrap.min.js"></script>
</body>
</html>