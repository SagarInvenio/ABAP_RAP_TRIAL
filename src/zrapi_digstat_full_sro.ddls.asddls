@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data Model for Digital Statement SRO'
define root view entity ZRAPI_DIGSTAT_FULL_SRO
  as select from zrap_digstat_sro
{
  key vendor      as Vendor,
  key bank        as Bank,
  key cccard      as Cccard,
  key tdate       as Tdate,
  key authcode    as Authcode,
      currency    as Currency,
      bank_fti    as BankFti,
      trans_descr as TransDescr,
      trans_place as TransPlace,
      trans_pin   as TransPin,
      trans_time  as TransTime,
      trans_zone  as TransZone,
      @Semantics.amount.currencyCode:'Currency'
      tot_amonut  as TotAmonut,
      @Semantics.amount.currencyCode:'Currency'
      vendor_fee  as VendorFee,
      @Semantics.amount.currencyCode:'Currency'
      trans_fee   as TransFee,
      @Semantics.amount.currencyCode:'Currency'
      act_amount  as ActAmount

}
