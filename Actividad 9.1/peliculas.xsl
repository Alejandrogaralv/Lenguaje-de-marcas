<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/web">

        <html lang="en"> 
            <head>
                <title><xsl:value-of select="title"/></title>   
                <link rel="stylesheet" href="peliculas.css"/>         
            </head>
            <body>
                <header><xsl:value-of select="nombre"/></header>
                <div id="introduccion">
                    <h1><xsl:value-of select="encabezado"/></h1>
                    <span><xsl:value-of select="descripcion"/></span>
                </div>
                <div id="peliculas">
                    <h2>Mis películas favoritas:</h2>
                    <div class="containerTarjetasPeliculas">
                        <xsl:for-each select="/web/filmoteca/pelicula">
                            <div class="tarjeta">
                                <h3><xsl:value-of select="titulo"/></h3>
                                <p><b>Dijida por: </b> <xsl:value-of select="director"/></p>
                                <p><b>Sinopsis: </b><xsl:value-of select="sinopsis"/></p>
                                <p><b>Año de estreno: </b><xsl:value-of select="year"/></p>
                                <p><b>Género: </b><xsl:value-of select="generos"/></p>
                                <p><b>Reparto: </b></p>
                                <p><b>Actores principales: </b><xsl:value-of select="reparto/principales"/></p>
                                <p><b>Actores secundarios: </b><xsl:value-of select="reparto/secundarios"/></p>
                                
                            </div>
                        </xsl:for-each>
                    </div>
                </div>
                <footer><h2><xsl:value-of select="protagonista"/></h2></footer>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>