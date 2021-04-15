@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data Model for Order Header'
define root view entity ZRAP_I_ORDER_H_SRO
  as select from zrap_order_h_sro
  composition [0..*] of ZRAP_I_ORDER_I_SRO as _Orderi
{
  key zrap_order_h_sro.orderno     as Orderno,
  key zrap_order_h_sro.orderty     as Orderty,
      zrap_order_h_sro.company     as Company,
      zrap_order_h_sro.partner     as Partner,
      zrap_order_h_sro.spras       as Spras,
      zrap_order_h_sro.description as Description,
      zrap_order_h_sro.status      as Status,
      zrap_order_h_sro.currency    as Currency,
      zrap_order_h_sro.tot_value   as TotValue,
      zrap_order_h_sro.quantity    as Quantity,
      zrap_order_h_sro.tot_quan    as TotQuan,
      // Make association public
      _Orderi
}
