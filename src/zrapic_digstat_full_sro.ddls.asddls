@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Full Projection View Digi Statement SRO'
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZRAPIC_DIGSTAT_FULL_SRO
  as projection on ZRAPI_DIGSTAT_FULL_SRO
{
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZRAP_CDS_LFA1_SRO', element: 'Lifnr'} }]
  key Vendor,
      //      @Consumption.valueHelpDefinition: [{ entity: { name: 'zrap_bankt_sro', element: ''} }]
  key Bank,
  key Cccard,
  key Tdate,
  key Authcode,
      Currency,
      BankFti,
      @Search.defaultSearchElement: true
      TransDescr,
      TransPlace,
      TransPin,
      TransTime,
      TransZone,
      @Semantics.amount.currencyCode: 'Currency'
      TotAmonut,
      @Semantics.amount.currencyCode: 'Currency'
      VendorFee,
      @Semantics.amount.currencyCode: 'Currency'
      TransFee,
      @Semantics.amount.currencyCode: 'Currency'
      ActAmount
}
