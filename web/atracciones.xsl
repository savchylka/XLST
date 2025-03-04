<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="legacy-compat" encoding="utf-8"/>

<xsl:template match='/gestionParque'>

<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="gastrobar.xml">Gastrobar</a>
			<a href="atracciones.xml">Atracciones</a>
			<a href="eventos.xml">Eventos</a>
		</header>
		
		<main>
			<h1>ATRACCIONES</h1>
			<table>
				<tr>
					<th>ATRACCION</th>
					<th>EDAD MINIMA</th>
					<th>PESO MAXIMO</th>
				</tr>

				<!-- Seleccionamos las atracciones/atraccion/restricciones -->
				<xsl:for-each select="atracciones/atraccion/restricciones">
					 <!-- Creamos una variable llamada "dato_intermedio" que almacena el nombre de la atracción,
        		     reemplazando los espacios por guiones bajos (_) para formar una URL válida de Wikipedia. -->
 					<xsl:variable name="dato_intermedio" select="translate(../nombre, ' ', '_')"/>
				
				<tr>
				    <!-- Se crea un enlace en la primera celda de la fila. El enlace apunta a Wikipedia con el nombre 
                    de la atracción, utilizando la variable $dato_intermedio, que reemplaza los espacios en blanco 
                    por guiones bajos (_) para formar una URL válida. -->
					<td><a href="https://es.wikipedia.org/wiki/{$dato_intermedio}" target="_blank"><xsl:value-of select='../nombre' /></a></td>
					<td><xsl:value-of select='edadMinima' /></td>
					<td><xsl:value-of select='pesoMaximo' /></td>
				</tr>

				</xsl:for-each>
			
			</table>			
		</main>
		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>

    </xsl:template>

</xsl:stylesheet>