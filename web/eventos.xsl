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
			<a href="web/gastrobar.xml">Gastrobar</a>
			<a href="web/atracciones.xml">Atracciones</a>
			<a href="web/eventos.xml">Eventos</a>
		</header>
		
		<main>
			<h1>Eventos del 2024</h1>
			
			<!-- Se define una variable llamada 'year' con el valor '2024'. 
            Esto permite si se cambia el valor de la variable, cambiarán los eventos que se muestran. -->
			<xsl:variable name="year" select="'2024'"/>
			
			<!-- Se aplican plantillas solo a los eventos cuyo año en 'fechaHora' sea igual a la variable 'year'. 
            - 'substring(fechaHora, 1, 4)' extrae los primeros 4 caracteres de la fecha, es decir, el año. 
        	- 'number()' convierte la cadena en un número para hacer una comparación correcta. -->
            <xsl:apply-templates select="eventos/evento	[number(substring(fechaHora, 1, 4)) = number($year)]">
            	<xsl:sort select="fechaHora" order="descending"/>
        	</xsl:apply-templates>
			
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>

    </xsl:template>

	<!-- Formateamos los eventos -->
	<xsl:template match="evento">
	
	<article class="eventos">
				<!-- Mostramos el nombre del evento, el total de comentarios y cada uno de los comentarios -->
				<h4> <xsl:value-of select="descripcion"/> - <xsl:value-of select="count(comentarios/comentario)"/> Comentarios</h4>
				<ul>
					<xsl:for-each select="comentarios/comentario">
                        <li><xsl:value-of select="."/></li>  
                    </xsl:for-each>	
				</ul>
	</article>
	
	</xsl:template>
				   

</xsl:stylesheet>