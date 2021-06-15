CLASS zrap_fill_partner_sro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZRAP_FILL_PARTNER_SRO IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA itab TYPE TABLE OF zrap_partner_sro.
    itab = VALUE #(
    ( partner = '0000000001' spras = 'EN' description = '1st Customer' bankno = '00000001' cccard  = '123456789123' currency = 'INR' )
    ( partner = '0000000002' spras = 'EN' description = '2nd Customer' bankno = '00000001' cccard  = '123456789111' currency = 'INR' )
    ( partner = '0000000003' spras = 'EN' description = '3rd Customer' bankno = '00000001' cccard  = '123456789122' currency = 'INR' )
    ( partner = '0000000004' spras = 'EN' description = '4th Customer' bankno = '00000001' cccard  = '123456789133' currency = 'INR' )
    ).

    DELETE FROM zrap_partner_sro.
    INSERT zrap_partner_sro FROM TABLE @itab.

    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } entries inserted successfully!| ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
