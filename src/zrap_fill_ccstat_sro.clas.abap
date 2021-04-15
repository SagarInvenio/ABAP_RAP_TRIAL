CLASS zrap_fill_ccstat_sro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zrap_fill_ccstat_sro IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA itab TYPE TABLE OF zrap_ccstate_sro.

    itab = VALUE #(
    ( cccard = '123456789123' vendor = '00001' tdate = '20210101' authcode = '001' currency = 'INR' tot_amonut = '100.00' vendor_fee = '2.00' act_amount = '98.00' )
    ( cccard = '123456789123' vendor = '00001' tdate = '20210101' authcode = '002' currency = 'INR' tot_amonut = '103.00' vendor_fee = '3.00' act_amount = '100.00' )
    ( cccard = '123456789123' vendor = '00001' tdate = '20210101' authcode = '003' currency = 'INR' tot_amonut = '105.00' vendor_fee = '5.00' act_amount = '100.00' )
    ( cccard = '123456789123' vendor = '00001' tdate = '20210101' authcode = '004' currency = 'INR' tot_amonut = '200.00' vendor_fee = '4.00' act_amount = '196.00' )
    ( cccard = '123456789123' vendor = '00001' tdate = '20210101' authcode = '005' currency = 'INR' tot_amonut = '300.00' vendor_fee = '6.00' act_amount = '294.00' )
    ( cccard = '123456789111' vendor = '00001' tdate = '20210101' authcode = '001' currency = 'INR' tot_amonut = '100.00' vendor_fee = '2.00' act_amount = '98.00' )
    ( cccard = '123456789111' vendor = '00001' tdate = '20210101' authcode = '002' currency = 'INR' tot_amonut = '103.00' vendor_fee = '3.00' act_amount = '100.00' )
    ( cccard = '123456789111' vendor = '00001' tdate = '20210101' authcode = '003' currency = 'INR' tot_amonut = '105.00' vendor_fee = '5.00' act_amount = '100.00' )
    ( cccard = '123456789122' vendor = '00001' tdate = '20210101' authcode = '001' currency = 'INR' tot_amonut = '100.00' vendor_fee = '2.00' act_amount = '98.00' )
    ( cccard = '123456789122' vendor = '00001' tdate = '20210101' authcode = '002' currency = 'INR' tot_amonut = '103.00' vendor_fee = '3.00' act_amount = '100.00' )
    ( cccard = '123456789122' vendor = '00001' tdate = '20210101' authcode = '003' currency = 'INR' tot_amonut = '105.00' vendor_fee = '5.00' act_amount = '100.00' )
    ( cccard = '123456789133' vendor = '00001' tdate = '20210101' authcode = '001' currency = 'INR' tot_amonut = '100.00' vendor_fee = '2.00' act_amount = '98.00' )
    ( cccard = '123456789133' vendor = '00001' tdate = '20210101' authcode = '002' currency = 'INR' tot_amonut = '103.00' vendor_fee = '3.00' act_amount = '100.00' )
    ( cccard = '123456789133' vendor = '00001' tdate = '20210101' authcode = '003' currency = 'INR' tot_amonut = '105.00' vendor_fee = '5.00' act_amount = '100.00' )
    ).

    DELETE FROM zrap_ccstate_sro.

    INSERT zrap_ccstate_sro FROM TABLE @itab.

    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } entries inserted successfully!| ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
