CLASS zrap_hello_sro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZRAP_HELLO_SRO IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    out->write( |Hello world! ({ cl_abap_context_info=>get_user_alias(  ) })| ).
  ENDMETHOD.
ENDCLASS.
