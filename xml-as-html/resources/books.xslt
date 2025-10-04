<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rsm="urn:un:unece:uncefact:data:standard:CrossIndustryInvoice:100"
  xmlns:ram="urn:un:unece:uncefact:data:standard:ReusableAggregateBusinessInformationEntity:100"
  xmlns:udt="urn:un:unece:uncefact:data:standard:UnqualifiedDataType:100"
  xmlns:qdt="urn:un:unece:uncefact:data:standard:QualifiedDataType:100"
  xmlns="http://www.w3.org/1999/xhtml">

  <xsl:output method="html" indent="yes" encoding="UTF-8"/>

  <xsl:template match="/rsm:CrossIndustryInvoice">
    <html>
      <head>
        <title>Rechnung: <xsl:value-of select="rsm:ExchangedDocument/ram:ID"/></title>
        <style>
          body { font-family: Arial; margin: 2em; }
          h1 { color: #2a2a2a; }
          table { border-collapse: collapse; width: 100%; margin-top: 1em; }
          th, td { border: 1px solid #ccc; padding: 0.5em; text-align: left; }
        </style>
      </head>
      <body>
        <h1>Rechnung <xsl:value-of select="rsm:ExchangedDocument/ram:ID"/></h1>
        <p><strong>Ausstellungsdatum:</strong>
          <xsl:value-of select="rsm:ExchangedDocument/ram:IssueDateTime/udt:DateTimeString"/>
        </p>
        <p><strong>Lieferant:</strong>
          <xsl:value-of select="rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:SellerTradeParty/ram:Name"/>
        </p>
        <p><strong>Kunde:</strong>
          <xsl:value-of select="rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:BuyerTradeParty/ram:Name"/>
        </p>

        <h2>Rechnungspositionen</h2>
        <table>
          <tr>
            <th>Bezeichnung</th>
            <th>Menge</th>
            <th>Einzelpreis</th>
            <th>Gesamt</th>
          </tr>
          <xsl:for-each select="rsm:SupplyChainTradeTransaction/ram:IncludedSupplyChainTradeLineItem">
            <tr>
              <td>
                <xsl:value-of select="ram:SpecifiedTradeProduct/ram:Name"/>
              </td>
              <td>
                <xsl:value-of select="ram:SpecifiedLineTradeDelivery/ram:BilledQuantity"/>
              </td>
              <td>
                <xsl:value-of select="ram:SpecifiedLineTradeAgreement/ram:GrossPriceProductTradePrice/ram:ChargeAmount"/>
              </td>
              <td>
                <xsl:value-of select="ram:SpecifiedLineTradeSettlement/ram:SpecifiedTradeSettlementLineMonetarySummation/ram:LineTotalAmount"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>

        <h2>Gesamtbetrag</h2>
        <p><strong>Summe:</strong>
          <xsl:value-of select="rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:GrandTotalAmount"/> EUR
        </p>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
