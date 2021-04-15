CLASS zrap_fill_lfa1_sro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zrap_fill_lfa1_sro IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA itab TYPE TABLE OF zrap_lfa1_sro.

    itab = VALUE #(
    ( lifnr = '00001' spras = 'EN' descrip = '1st Supplier' )
    ( lifnr = '00002' spras = 'EN' descrip = '2nd Supplier' )
    ( lifnr = '00003' spras = 'EN' descrip = '3rd Supplier' )
    ).

    DATA itab1 TYPE TABLE OF zrap_lfb1_sro.

    itab1 = VALUE #(
    ( lifnr = '00001' spras = 'EN' descrip = '1st Supplier' bukrs = '0001' )
    ( lifnr = '00001' spras = 'EN' descrip = '1st Supplier' bukrs = '0002' )
    ( lifnr = '00001' spras = 'EN' descrip = '1st Supplier' bukrs = '0003' )
    ( lifnr = '00002' spras = 'EN' descrip = '2nd Supplier' bukrs = '0002' )
    ( lifnr = '00002' spras = 'EN' descrip = '2nd Supplier' bukrs = '0003' )
    ( lifnr = '00003' spras = 'EN' descrip = '3rd Supplier' bukrs = '0003')
    ).

    DELETE FROM zrap_lfa1_sro.
    DELETE FROM zrap_lfb1_sro.

    INSERT zrap_lfa1_sro FROM TABLE @itab.
    INSERT zrap_lfb1_sro FROM TABLE @itab1.

    IF sy-subrc EQ 0.
      out->write( |{ sy-dbcnt } entries inserted successfully!| ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
