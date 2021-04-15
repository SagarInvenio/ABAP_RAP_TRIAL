@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sample CDS View for T001 SRO'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZRAP_CDS_T001_SRO
  as select from zrap_t001_sro
{
  key bukrs       as Bukrs,
  key spras       as Spras,
      description as Description
}
