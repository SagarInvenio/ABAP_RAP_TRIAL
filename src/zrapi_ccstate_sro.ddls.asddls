@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sample CCard Statement SRO Data Model'
define root view entity ZRAPI_CCSTATE_SRO
  as select from zrap_ccstate_sro as CCStat
  //composition of target_data_source_name as _association_name
{
  key cccard     as Cccard,
  key vendor     as Vendor,
  key tdate      as Tdate,
  key authcode   as Authcode,
      currency   as Currency,
      tot_amonut as TotAmonut,
      vendor_fee as VendorFee,
      act_amount as ActAmount,
      quanitity  as Quanitity,
      nooftrans  as Nooftrans
      //    _association_name // Make association public
}
