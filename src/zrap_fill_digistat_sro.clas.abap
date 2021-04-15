CLASS zrap_fill_digistat_sro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zrap_fill_digistat_sro IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA itab TYPE TABLE OF zrap_digstat_sro.

    itab = VALUE #(
    ( vendor = '00001' bank = '00000001' cccard = '123456789123' tdate = '20210101' authcode = 'A001' currency = 'INR' bank_fti = '123456789' trans_descr = '2 Cups of Ice Cream' trans_place = 'Pune' trans_pin = '411004' trans_time = '210012' trans_zone =
'IST' tot_amonut = '100.00' vendor_fee = '2.00' trans_fee = '1.00' act_amount = '97.00' )
    ( vendor = '00002' bank = '00000001' cccard = '123456789123' tdate = '20210101' authcode = 'A002' currency = 'INR' bank_fti = '123456789' trans_descr = '3 Tshirts' trans_place = 'Pune' trans_pin = '411004' trans_time = '212032' trans_zone = 'IST'
tot_amonut = '1000.00' vendor_fee = '20.00' trans_fee = '1.00' act_amount = '979.00' )
    ( vendor = '00002' bank = '00000002' cccard = '123456789123' tdate = '20210101' authcode = 'A003' currency = 'INR' bank_fti = '912345678' trans_descr = '2 Pants' trans_place = 'Pune' trans_pin = '411004' trans_time = '213054' trans_zone = 'IST'
tot_amonut = '2000.00' vendor_fee = '20.00' trans_fee = '1.00' act_amount = '1979.00' )

    ( vendor = '00002' bank = '00000002' cccard = '123456789111' tdate = '20210103' authcode = 'B001' currency = 'INR' bank_fti = '912345671' trans_descr = '1 Shirts' trans_place = 'Mumbai' trans_pin = '400004' trans_time = '103054' trans_zone = 'IST'
tot_amonut = '2000.00' vendor_fee = '20.00' trans_fee = '1.00' act_amount = '1979.00' )
    ( vendor = '00002' bank = '00000002' cccard = '123456789111' tdate = '20210103' authcode = 'B002' currency = 'INR' bank_fti = '912345673' trans_descr = '1 Pant' trans_place = 'Mumbai' trans_pin = '400004' trans_time = '103054' trans_zone = 'IST'
tot_amonut = '2000.00' vendor_fee = '20.00' trans_fee = '1.00' act_amount = '1979.00' )

    ).

    DELETE FROM zrap_digstat_sro.

    INSERT zrap_digstat_sro FROM TABLE @itab.

    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } entries inserted successfully!| ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
