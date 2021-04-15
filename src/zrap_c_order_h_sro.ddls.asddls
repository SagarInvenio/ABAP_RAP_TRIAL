@EndUserText.label: 'Projection View for Order Header SRO'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define root view entity ZRAP_C_ORDER_H_SRO
  as projection on ZRAP_I_ORDER_H_SRO
{
  key Orderno,
  key Orderty,
      Company,
      Partner,
      Spras,
      Description,
      Status,
      @Semantics.currencyCode: true
      Currency,
      @Semantics.amount.currencyCode: 'Currency'
      TotValue,
      @Semantics.unitOfMeasure: true
      Quantity,
      @Semantics.quantity.unitOfMeasure: 'Quantity'
      TotQuan,
      /* Associations */
      _Orderi : redirected to composition child ZRAP_C_ORDER_I_SRO
}
