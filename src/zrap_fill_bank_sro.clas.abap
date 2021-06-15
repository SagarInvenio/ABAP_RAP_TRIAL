CLASS zrap_fill_bank_sro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZRAP_FILL_BANK_SRO IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA itab TYPE TABLE OF zrap_bankt_SRO.
    itab = VALUE #(
    ( bankno = '00000001' account = '1000000001' spras = 'EN' description = '1st Bank 1st Acc' currency = 'INR' country = 'India' status = '00' balance = '100.00' )
    ( bankno = '00000001' account = '1000000002' spras = 'EN' description = '1st Bank 2nd Acc' currency = 'EUR' country = 'France' status = '00' balance = '200.00' )
    ( bankno = '00000002' account = '2000000001' spras = 'EN' description = '2nd Bank 1st Acc' currency = 'EUR' country = 'Germany' status = '00' balance = '300.00' )
    ( bankno = '00000002' account = '2000000002' spras = 'EN' description = '2nd Bank 2nd Acc' currency = 'GBP' country = 'United Kingdom' status = '00' balance = '400.00' )
    ( bankno = '00000003' account = '3000000001' spras = 'EN' description = '3rd Bank 1st Acc' currency = 'USD' country = 'United States' status = '00' balance = '500.00' )
    ).

    DELETE FROM zrap_bankt_sro.
    INSERT zrap_bankt_sro FROM TABLE @itab.

    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } entries inserted successfully!| ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
