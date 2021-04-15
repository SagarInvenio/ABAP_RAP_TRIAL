@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sample CDS View for LFA1 SRO'
define root view entity ZRAP_CDS_LFA1_SRO
  as select from zrap_lfa1_sro
  composition [1..*] of ZRAP_CDS_LFB1_SRO as _lfb1
{
  key zrap_lfa1_sro.lifnr   as Lifnr,
  key zrap_lfa1_sro.spras   as Spras,
      zrap_lfa1_sro.descrip as Descrip,
      _lfb1 // Make association public
} 
 