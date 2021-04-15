@EndUserText.label: 'Projection View for Order Item SRO'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZRAP_C_ORDER_I_SRO
  as projection on ZRAP_I_ORDER_I_SRO
{
  key Orderno,
  key Orderty,
  key Orderit,
      Delind,
      Status,
      Spras,
      Txtitm,
      Matnr,
      @Semantics.currencyCode: true
      Currency,
      @Semantics.amount.currencyCode: 'Currency'
      NetValue,
      @Semantics.unitOfMeasure: true
      Quantity,
      @Semantics.quantity.unitOfMeasure: 'Quantity'
      NetQuan,
      /* Associations */
      _Orderh : redirected to parent ZRAP_C_ORDER_H_SRO
}
