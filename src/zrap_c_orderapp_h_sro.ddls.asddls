@EndUserText.label: 'Projection View for Order Approver SRO'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define root view entity ZRAP_C_ORDERAPP_H_SRO
  as projection on ZRAP_I_ORDER_H_SRO
{
  key Orderno,
  key Orderty,
      //      Company,
      //      Partner,
      //      Spras,
      Description,
      Status,
      Currency,
      TotValue,
      Quantity,
      TotQuan,
      /* Associations */
      _Orderi
}
