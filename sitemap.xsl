<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9">

  <xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <title>Athenah Site Map</title>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <style>
          body{font-family:Arial,sans-serif;max-width:900px;margin:auto;padding:20px;background:#fafafa;color:#333}
          h1{text-align:center;color:#444}
          table{width:100%;border-collapse:collapse;margin-top:20px}
          th,td{padding:8px;border-bottom:1px solid #ccc;vertical-align:top}
          th{background:#f4f4f4;text-align:left}
          tr:nth-child(even){background:#fcfcfc}
          a{color:#1a0dab;text-decoration:none}
          a:hover{text-decoration:underline}
          .muted{color:#777}
        </style>
      </head>
      <body>
        <h1>Athenah – Site Map</h1>
        <table>
          <tr>
            <th>URL</th>
            <th>Change Frequency</th>
            <th>Priority</th>
            <th>Last Modified</th>
          </tr>

          <!-- sort by priority (desc), then loc -->
          <xsl:for-each select="sitemap:urlset/sitemap:url">
            <xsl:sort select="number(sitemap:priority)" data-type="number" order="descending"/>
            <xsl:sort select="sitemap:loc" data-type="text" order="ascending"/>

            <tr>
              <td><a href="{sitemap:loc}" target="_blank"><xsl:value-of select="sitemap:loc"/></a></td>
              <td>
                <xsl:choose>
                  <xsl:when test="string(sitemap:changefreq)!=''">
                    <xsl:value-of select="sitemap:changefreq"/>
                  </xsl:when>
                  <xsl:otherwise><span class="muted">—</span></xsl:otherwise>
                </xsl:choose>
              </td>
              <td>
                <xsl:choose>
                  <xsl:when test="string(sitemap:priority)!=''">
                    <xsl:value-of select="sitemap:priority"/>
                  </xsl:when>
                  <xsl:otherwise><span class="muted">—</span></xsl:otherwise>
                </xsl:choose>
              </td>
              <td>
                <xsl:choose>
                  <xsl:when test="string(sitemap:lastmod)!=''">
                    <xsl:value-of select="sitemap:lastmod"/>
                  </xsl:when>
                  <xsl:otherwise><span class="muted">—</span></xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
