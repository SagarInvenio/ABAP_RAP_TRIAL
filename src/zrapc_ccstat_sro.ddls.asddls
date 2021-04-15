@EndUserText.label: 'Sample CCard Statement SRO Proj View'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define root view entity ZRAPC_CCSTAT_SRO 
  as projection on ZRAP_CDS_CCSTAT_SRO as CCStat
{
  key Cccard,
  key Vendor,
  key Tdate,
  key Authcode,
      Currency,      
      TotAmonut,
      VendorFee,
      ActAmount,
      DistintCccard
}
