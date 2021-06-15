CLASS zrap_fill_t001_sro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZRAP_FILL_T001_SRO IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Type declaration
    DATA itab TYPE TABLE OF zrap_t001_sro.

    itab = VALUE #(
    ( bukrs = '0001' spras = 'EN'     description = '1st Company Entry' )
    ( bukrs = '0002' spras = sy-langu description = '2nd Company Entry' )
    ( bukrs = '0003' spras = 'EN'     description = '3rd Company Entry' )
     ).

    "Clear table
    DELETE FROM zrap_t001_sro.

    "Insert records
    INSERT zrap_t001_sro FROM TABLE @itab.

    out->write( |{ sy-dbcnt } entries inserted successfully!| ).

  ENDMETHOD.
ENDCLASS.
