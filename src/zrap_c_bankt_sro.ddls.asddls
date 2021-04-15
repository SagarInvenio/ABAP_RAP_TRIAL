@EndUserText.label: 'Projection View for Bank SRO'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZRAP_C_BANKT_SRO
  as projection on ZRAP_I_BANKT_SRO
{
      @Search.defaultSearchElement: true
  key Bankno,
      @Search.defaultSearchElement: true
  key Account,
      @Search.defaultSearchElement: true
  key Spras,
      @Search.defaultSearchElement: true
      Description,
      Currency,
      Country,
      Status,
      Balance
}
