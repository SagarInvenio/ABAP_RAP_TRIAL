@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data Model for Bank Data'
define root view entity ZRAP_I_BANKT_SRO
  as select from zrap_bankt_sro
  //composition of target_data_source_name as _association_name
{
  key bankno      as Bankno,
  key account     as Account,
  key spras       as Spras,
      description as Description,
      currency    as Currency,
      country     as Country,
      status      as Status,
      balance     as Balance
      //    _association_name // Make association public
}
