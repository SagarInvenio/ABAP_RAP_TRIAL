@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sample CDS View for LFB1 SRO'
define view entity ZRAP_CDS_LFB1_SRO
  as select from zrap_lfb1_sro
  association        to parent ZRAP_CDS_LFA1_SRO as _lfa1 on  $projection.Lifnr = _lfa1.Lifnr
                                                          and $projection.Spras = _lfa1.Spras
  association [0..*] to ZRAP_CDS_T001_SRO        as _t001 on  $projection.Bukrs = _t001.Bukrs
{
  key lifnr   as Lifnr,
  key spras   as Spras,
  key bukrs   as Bukrs,
      descrip as Descrip,
      // Make association public
      _lfa1,
      _t001
}
