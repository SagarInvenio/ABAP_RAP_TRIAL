CLASS zrap_fill_order_sro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZRAP_FILL_ORDER_SRO IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    "Data Declaration
    DATA: itab  TYPE TABLE OF zrap_order_h_sro,
          itab2 TYPE TABLE OF zrap_order_i_sro.

    itab = VALUE #(
    ( orderno = 'P000000001' orderty = 'PO' company = '0001' partner = '0000000001' spras = 'EN' description = '1st Purchase Order' status = 'DR' currency = 'INR' tot_value = '1000' quantity = 'EA' tot_quan = '100.00' )
    ( orderno = 'S000000001' orderty = 'SO' company = '0001' partner = '0000000002' spras = 'EN' description = '1st Sales Order' status = 'DR' currency = 'INR' tot_value = '2000' quantity = 'EA' tot_quan = '100.00' )
    ( orderno = 'P000000002' orderty = 'PO' company = '0001' partner = '0000000001' spras = 'EN' description = '2nd Purchase Order' status = 'AP' currency = 'INR' tot_value = '1000' quantity = 'EA' tot_quan = '100.00' )
    ( orderno = 'S000000002' orderty = 'SO' company = '0001' partner = '0000000002' spras = 'EN' description = '2nd Sales Order' status = 'AP' currency = 'INR' tot_value = '2000' quantity = 'EA' tot_quan = '100.00' )
    ).

    itab2 = VALUE #(
    ( orderno = 'P000000001' orderty = 'PO' orderit = '0001' delind = ' ' status = 'DR' spras = 'EN' txtitm = '1st Purchase Item' matnr = '00001' currency = 'INR' net_value = '500' quantity = 'EA' net_quan = '50.00' )
    ( orderno = 'P000000001' orderty = 'PO' orderit = '0002' delind = ' ' status = 'DR' spras = 'EN' txtitm = '2nd Purchase Item' matnr = '00001' currency = 'INR' net_value = '500' quantity = 'EA' net_quan = '50.00' )
    ( orderno = 'S000000001' orderty = 'SO' orderit = '0001' delind = ' ' status = 'AP' spras = 'EN' txtitm = '1st Sales Item' matnr = '00001' currency = 'INR' net_value = '1000' quantity = 'EA' net_quan = '50.00' )
    ( orderno = 'S000000001' orderty = 'SO' orderit = '0002' delind = ' ' status = 'AP' spras = 'EN' txtitm = '2nd Sales Item' matnr = '00001' currency = 'INR' net_value = '1000' quantity = 'EA' net_quan = '50.00' )
    ( orderno = 'P000000002' orderty = 'PO' orderit = '0001' delind = ' ' status = 'DR' spras = 'EN' txtitm = '1st Purchase Item' matnr = '00001' currency = 'INR' net_value = '250' quantity = 'EA' net_quan = '25.00' )
    ( orderno = 'P000000002' orderty = 'PO' orderit = '0002' delind = ' ' status = 'DR' spras = 'EN' txtitm = '2nd Purchase Item' matnr = '00001' currency = 'INR' net_value = '250' quantity = 'EA' net_quan = '25.00' )
    ( orderno = 'P000000002' orderty = 'PO' orderit = '0003' delind = ' ' status = 'DR' spras = 'EN' txtitm = '3rd Purchase Item' matnr = '00001' currency = 'INR' net_value = '250' quantity = 'EA' net_quan = '25.00' )
    ( orderno = 'P000000002' orderty = 'PO' orderit = '0004' delind = ' ' status = 'DR' spras = 'EN' txtitm = '4th Purchase Item' matnr = '00001' currency = 'INR' net_value = '250' quantity = 'EA' net_quan = '25.00' )
    ( orderno = 'S000000002' orderty = 'SO' orderit = '0001' delind = ' ' status = 'AP' spras = 'EN' txtitm = '1st Sales Item' matnr = '00001' currency = 'INR' net_value = '1000' quantity = 'EA' net_quan = '50.00' )
    ( orderno = 'S000000002' orderty = 'SO' orderit = '0002' delind = ' ' status = 'AP' spras = 'EN' txtitm = '2nd Sales Item' matnr = '00001' currency = 'INR' net_value = '1000' quantity = 'EA' net_quan = '50.00' )
    ).

    DELETE FROM zrap_order_h_sro.
    DELETE FROM zrap_order_i_sro.

    INSERT zrap_order_h_sro FROM TABLE @itab.
    INSERT zrap_order_i_sro FROM TABLE @itab2.

    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } entries inserted successfully!| ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
