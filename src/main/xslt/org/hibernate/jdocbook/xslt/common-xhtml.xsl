<?xml version="1.0"?>
<!--
  ~ Hibernate, Relational Persistence for Idiomatic Java
  ~
  ~ Copyright (c) 2008-2012, Red Hat Inc. or third-party contributors as
  ~ indicated by the @author tags or express copyright attribution
  ~ statements applied by the authors.  All third-party contributions are
  ~ distributed under license by Red Hat Inc.
  ~
  ~ This copyrighted material is made available to anyone wishing to use, modify,
  ~ copy, or redistribute it subject to the terms and conditions of the GNU
  ~ Lesser General Public License, as published by the Free Software Foundation.
  ~
  ~ This program is distributed in the hope that it will be useful,
  ~ but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
  ~ or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License
  ~ for more details.
  ~
  ~ You should have received a copy of the GNU Lesser General Public License
  ~ along with this distribution; if not, write to:
  ~ Free Software Foundation, Inc.
  ~ 51 Franklin Street, Fifth Floor
  ~ Boston, MA  02110-1301  USA
  -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:d="http://docbook.org/ns/docbook">
    <xsl:import href="common-base.xsl"/>

    <xsl:param name="siteHref" select="'http://www.hibernate.org'"/>
    <xsl:param name="docHref" select="'http://hibernate.org/Documentation/DocumentationOverview'"/>
    <xsl:param name="siteLinkText" select="'Hibernate.org'"/>

    <xsl:param name="legalnotice.filename">legalnotice.html</xsl:param>

    <xsl:template match="d:legalnotice" mode="chunk-filename">
        <xsl:value-of select="$legalnotice.filename"/>
    </xsl:template>

    <!--
        Comes from xhtml/docbook.xsl
        Used to add google analytics script.
    -->
    <xsl:template name="user.footer.content">
        <!-- copied from PressGang, tried ot use apply-imports but did not work -->

        <script type="text/javascript" src="highlight.js/highlight.pack.js">
            <!-- Workaround to force outputting "</script>". The space is required. -->
            <xsl:text> </xsl:text>
        </script>
        <script type="text/javascript">
            <xsl:text>hljs.initHighlightingOnLoad();</xsl:text>
        </script>
        <xsl:if test="$html.googleAnalyticsId != ''">
            <xsl:element name="script" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="type">
                    <xsl:text>text/javascript</xsl:text>
                </xsl:attribute>
                <xsl:text>
dataLayer = [{'channel' : '</xsl:text>
                <xsl:value-of select="$html.googleTagManagerChannel"/>
                <xsl:text>', 'additional_tracking_code' : '</xsl:text>
                <xsl:value-of select="$html.googleAnalyticsId"/>
                <xsl:text disable-output-escaping="yes">'}];
(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&amp;l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','</xsl:text>
                <xsl:value-of select="$html.googleTagManagerId"/>
                <xsl:text>');</xsl:text>
            </xsl:element>
            <!-- TODO this <noscript> element should be immediately under the body tag according to GTM guidelines -->
            <xsl:element name="noscript" namespace="http://www.w3.org/1999/xhtml">
                <xsl:element name="iframe" namespace="http://www.w3.org/1999/xhtml">
                    <xsl:attribute name="src">
                        <xsl:text>//www.googletagmanager.com/ns.html?id=</xsl:text><xsl:value-of select="$html.googleTagManagerId"/>
                    </xsl:attribute>
                    <xsl:attribute name="height"><xsl:text>0</xsl:text></xsl:attribute>
                    <xsl:attribute name="width"><xsl:text>0</xsl:text></xsl:attribute>
                    <xsl:attribute name="style"><xsl:text>display:none;visibility:hidden</xsl:text></xsl:attribute>
                    <!-- Workaround to force outputting "</iframe>". The space is required. -->
                    <xsl:text> </xsl:text>
                </xsl:element>
            </xsl:element>
        </xsl:if>

        <!-- end of PressGang copy -->

        <hr/>
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="$legalnotice.filename"/>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="//d:book/d:bookinfo/d:copyright[1]">
                    <xsl:apply-templates select="//d:book/d:bookinfo/d:copyright[1]" mode="titlepage.mode"/>
                </xsl:when>
                <xsl:when test="//d:legalnotice[1]">
                    <xsl:apply-templates select="//d:legalnotice[1]" mode="titlepage.mode"/>
                </xsl:when>
            </xsl:choose>
        </a>
    </xsl:template>
</xsl:stylesheet>
