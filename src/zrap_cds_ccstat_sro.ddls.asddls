@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sample CDS View for CC Statement SRO'
define root view entity ZRAP_CDS_CCSTAT_SRO
  as select from zrap_ccstate_sro
  //composition of target_data_source_name as _association_name
{
  key cccard                as Cccard,
  key vendor                as Vendor,
  key tdate                 as Tdate,
  key authcode              as Authcode,
      currency              as Currency,
      tot_amonut            as TotAmonut,
      vendor_fee            as VendorFee,
      act_amount            as ActAmount,
      @Aggregation.referenceElement: ['Cccard']
      @Aggregation.default: #COUNT_DISTINCT
      cast(1 as abap.int4 ) as DistintCccard

      //    _association_name // Make association public
}
