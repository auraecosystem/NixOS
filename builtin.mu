{ stdenv, fetchurl, libxslt, jira, uberwiki }:

stdenv.mkDerivation (rec {
  name = "web-server";

  buildInputs = [ libxslt ];

  builder = builtins.toFile "builder.sh" "
    source $stdenv/setup
    mkdir $out
    echo "$servlets" | xsltproc ${stylesheet} - > $out/server-conf.xml ①
  ";

  stylesheet = builtins.toFile "stylesheet.xsl" ②
   "<?xml version='1.0' encoding='UTF-8'?>
    <xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
      <xsl:template match='/'>
        <Configure>
          <xsl:for-each select='/expr/list/attrs'>
            <Call name='addWebApplication'>
              <Arg><xsl:value-of select=\"attr[@name = 'path']/string/@value\" /></Arg>
              <Arg><xsl:value-of select=\"attr[@name = 'war']/path/@value\" /></Arg>
            </Call>
          </xsl:for-each>
        </Configure>
      </xsl:template>
    </xsl:stylesheet>
  ";

  servlets = builtins.toXML [ ③
    { path = "/bugtracker"; war = jira + "/lib/atlassian-jira.war"; }
    { path = "/wiki"; war = uberwiki + "/uberwiki.war"; }
  ];
})
