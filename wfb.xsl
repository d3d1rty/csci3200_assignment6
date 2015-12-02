<!-- 
  NAME: Richard Davis
  SECTION: CSCI 3200 W1
  Assignment 6
-->
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" />
  <xsl:variable name="config" select="document('fb_config.xml')" />
  <xsl:template match="/">
    <xsl:text disable-output-escaping='yes'>
      &lt;!DOCTYPE html&gt; &#xA;
    </xsl:text>
    <html>
      <head>
        <title>
          <xsl:text>CIA World Factbook</xsl:text>
        </title>
      </head>
      <body>
        <h1>CIA World <xsl:value-of select="WFB/@YEAR" /> Factbook</h1>
        <xsl:choose>
          <xsl:when test="$config/config/order/@output = 'dec'">
            <xsl:apply-templates select="WFB/PLACE">
              <xsl:sort select="NAME" data-type="text" order="descending" />
            </xsl:apply-templates>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="WFB/PLACE" />
          </xsl:otherwise>
        </xsl:choose>
      </body> 
    </html>
  </xsl:template>
  <xsl:template match="PLACE">
    <div style="border:1px solid black;">
      <xsl:apply-templates select="NAME" />
      <xsl:apply-templates select="INTRODUCTION/Background" />
      <xsl:apply-templates select="GEOGRAPHY/Location" />
      <xsl:apply-templates select="GEOGRAPHY/Climate" />
      <xsl:apply-templates select="PEOPLE/Population" />
      <xsl:apply-templates select="PEOPLE/Age_structure" />
    </div>
  </xsl:template>
  <xsl:template match="NAME">
      <h2>
        <xsl:value-of select="current()" />
      </h2>
  </xsl:template>
  <xsl:template match="INTRODUCTION/Background">
    <xsl:if test="$config/config/background/@output = 'true' or 
                  $config/config/background/@output = '1' and
                  string-length(current()) &gt; 0">
      <p>
        <b>Background: </b><xsl:value-of select="current()" />
      </p>
    </xsl:if>
  </xsl:template>
  <xsl:template match="GEOGRAPHY/Location">
    <xsl:if test="($config/config/location/@output = 'true' or 
                  $config/config/location/@output = '1') and
                  string-length(current()) &gt; 0">
      <p>
        <b>Location: </b><xsl:value-of select="current()" />
      </p>
    </xsl:if>
  </xsl:template>
  <xsl:template match="GEOGRAPHY/Climate">
    <xsl:if test="($config/config/climate/@output = 'true' or 
                  $config/config/climate/@output = '1') and
                  string-length(current()) &gt; 0">
      <p>
        <b>Climate: </b><xsl:value-of select="current()" />
      </p>
    </xsl:if>
  </xsl:template>
  <xsl:template match="PEOPLE/Population">
    <xsl:if test="($config/config/population/@output = 'true' or 
                  $config/config/population/@output = '1') and
                  string-length(current()) &gt; 0">
      <p>
        <b>Population: </b><xsl:value-of select="current()" />
      </p>
    </xsl:if>
  </xsl:template>
  <xsl:template match="PEOPLE/Age_structure">
    <xsl:if test="($config/config/population/@output = 'true' or 
                  $config/config/population/@output = '1') and
                  (string-length(age_0_14_years) &gt; 0 or
                  string-length(age_15_64_years) &gt; 0 or
                  string-length(age_65_years_and_over) &gt; 0)">
      <ul>
        <xsl:apply-templates select="age_0_14_years" />
        <xsl:apply-templates select="age_15_64_years" />
        <xsl:apply-templates select="age_65_years_and_over" />
      </ul>
    </xsl:if>
  </xsl:template>
  <xsl:template match="PEOPLE/Age_structure/age_0_14_years">
    <xsl:if test="string-length(current()) &gt; 0">
      <li>
        <b>Age 0 to 14: </b><xsl:value-of select="current()" />
      </li>
    </xsl:if>
  </xsl:template>
  <xsl:template match="PEOPLE/Age_structure/age_15_64_years">
    <xsl:if test="string-length(current()) &gt; 0">
      <li>
        <b>Age 15 to 64: </b><xsl:value-of select="current()" />
      </li>
    </xsl:if>
  </xsl:template>
  <xsl:template match="PEOPLE/Age_structure/age_65_years_and_over">
    <xsl:if test="string-length(current()) &gt; 0">
      <li>
        <b>Age 65 and older: </b><xsl:value-of select="current()" />
      </li>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
