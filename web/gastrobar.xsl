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
	  
		<main id="gastrobar">
          	
			<h1>ENTRANTES</h1>
			<!-- Se aplican plantillas solo a los platos cuyo categoria es 'Entrantea'. -->
            <xsl:apply-templates select="gastrobar/platos/plato[@categoria='Entrante']" />
        
		</main>
       
		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
 
 </xsl:template>
 <!-- Formateamos los platos -->
<xsl:template match="plato">

<article class="articulo">
  <!-- Si el código empiece por "A", se destacarán con la etiqueta "New". -->	 
  <xsl:if test="starts-with(@codigo,'A')">
    <img src="../img/icono-novedad.png" class="novedad-icono"/>	
  </xsl:if>
    <!-- Usamos las {} para combinar codigo HTML y XSLT -->
	<img src="../img/{foto}" class="imagen"/>	
	<!-- Mostrará el nombre y el precio de todos los entrantes.	-->	
	<h2><xsl:value-of select='nom_plato' /></h2>
	<h3><xsl:value-of select='precio' /></h3>           
</article>

	</xsl:template>

</xsl:stylesheet>


