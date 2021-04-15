@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data Model for Order Item'
define view entity ZRAP_I_ORDER_I_SRO
  as select from zrap_order_i_sro
  association to parent ZRAP_I_ORDER_H_SRO as _Orderh
      on  $projection.Orderno = _Orderh.Orderno 
      and $projection.Orderty = _Orderh.Orderty
{
  key orderno   as Orderno,
  key orderty   as Orderty,
  key orderit   as Orderit,
      delind    as Delind,
      status    as Status,
      spras     as Spras,
      txtitm    as Txtitm,
      matnr     as Matnr,
      currency  as Currency,
      net_value as NetValue, 
      quantity  as Quantity,
      net_quan  as NetQuan,
      // Make association public
      _Orderh
}
