<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <!-- Template for the root element -->
  <xsl:template match="/">
    <html>
      <head>
        <title>XML to HTML Example</title>
        <style>
          @font-face {
            font-family: 'BarcodeFont';
            src: url('free3of9.ttf') format('truetype');
          }
                    @font-face {
            font-family: 'font';
            src: url('Montserrat-VariableFont_wght.ttf') format('truetype');
          }

          .barcode {
            font-family: 'BarcodeFont';
            font-size: 24px;
            letter-spacing: 2px; /* Adjust spacing for better readability */
          }
* {
      font-family: "font";

}
          table {
            width: 100%;
            border-collapse: collapse;
          }

          th, td {
                        text-align: left;
                vertical-align: baseline;
                            font-weight: normal;
                                font-size: 14px;
          }
          li {
            list-style: none;
            display: flex;
                gap: 2rem;
                    border-bottom: 1px solid;
    padding-bottom: 2rem;
    margin-bottom: 2rem;
            justify-content: space-between;
          }
          ul {
            padding: 0;
            margin:1rem 0;
          }
          .left-space {
            padding-left: 1rem;
          }
          .nowrap {
            white-space: nowrap;
          }
          .bottom-space {
            padding-bottom: 1rem;
          }
          .barcode_wrapper {
            display: flex;
        align-items: center;
        flex-direction: column;
        justify-content: flex-end;
          }
          .info {
            width: 40%;
          }
          p {
            font-weight: 600;
          }
          .uppercase {
            text-transform: uppercase;
          }
        </style>
      </head>
      <body>
        <ul>
          <!-- Loop through each item in the XML -->
          <xsl:for-each select="root/row">
            <li>
            <div class="image">
                 <img src="{original_url}" alt="Product Image" style="max-width: 140px; max-height: 140px; scale: 1.2;" />
            </div>

            <div class="info">
                <table>
                    <tbody>

                            <p class="nowrap uppercase"><xsl:value-of select="style_name" /></p>

                        <tr>
                            <th class="nowrap">STYLE NO</th>
                            <th class="left-space"><xsl:value-of select="style_no" /></th>
                        </tr>
                        <tr>
                            <th>QUALITY</th>
                            <th class="left-space"><xsl:value-of select="quality" /></th>
                        </tr>
                        <tr>
                            <xsl:choose>
                            <xsl:when test="normalize-space(colour) != ''">
                                <th>COLOR</th>
                                <th class="left-space"><xsl:value-of select="colour" /></th>
                            </xsl:when>
                            <xsl:otherwise>
                                <td></td> <!-- Empty cell -->
                            </xsl:otherwise>
                            </xsl:choose>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="price">
                <table>
                    <tbody>
                            <p class="nowrap">PRICE</p>

                        <tr>
                            <th>DKK</th>
                            <th class="left-space"><xsl:value-of select="wsp_dkk" /> / <xsl:value-of select="rrp_dkk" /></th>
                        </tr>
                        <tr>
                            <th>EUR</th>
                            <th class="left-space"><xsl:value-of select="wsp_eur" /> / <xsl:value-of select="rrp_eur" /></th>
                        </tr>
                        <tr>
                            <th>SEK</th>
                            <th class="left-space"><xsl:value-of select="wsp_sek" /> / <xsl:value-of select="rrp_sek" /></th>
                        </tr> 
                        <tr>
                            <th>NOK</th>
                            <th class="left-space"><xsl:value-of select="wsp_nok" /> / <xsl:value-of select="rrp_nok" /></th>
                        </tr>
                        <tr>
                            <th>GBP</th>
                            <th class="left-space"><xsl:value-of select="wsp_gbp" /> / <xsl:value-of select="rrp_gbp" /></th>
                        </tr>                          
                    </tbody>
                </table>
            </div>

            <div class="barcode_wrapper">    
                <div class="barcode">
                    *<xsl:value-of select="ean" />*
                </div>
                <xsl:value-of select="ean" />
            </div>

            </li>
          </xsl:for-each>
        </ul>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
