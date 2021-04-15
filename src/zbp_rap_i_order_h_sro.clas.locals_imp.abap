CLASS lhc_orderh DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS approveOrder FOR MODIFY
      IMPORTING keys FOR ACTION Orderh~approveOrder RESULT result.

    METHODS valTot FOR VALIDATE ON SAVE
      IMPORTING keys FOR Orderh~valTot.

    METHODS draftOrder FOR MODIFY
      IMPORTING keys FOR ACTION Orderh~draftOrder RESULT result.

    METHODS DetM FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Orderh~DetM.
    METHODS valSt FOR VALIDATE ON SAVE
      IMPORTING keys FOR Orderh~valSt.

ENDCLASS.

CLASS lhc_orderh IMPLEMENTATION.

  METHOD approveOrder.
    LOOP AT keys INTO DATA(ls_key).

    ENDLOOP.

    "EML code. New Concept :)
    MODIFY ENTITIES OF zrap_i_order_h_sro IN LOCAL MODE
           ENTITY Orderh
              UPDATE FIELDS ( Status )
                 WITH VALUE #( FOR key IN keys ( Orderno      = key-Orderno
                                                 Orderty      = key-Orderty
                                                 Status       = 'AP' ) ) " Approved
           FAILED   failed
           REPORTED reported.

    "Read changed data for action result
    READ ENTITIES OF zrap_i_order_h_sro IN LOCAL MODE
         ENTITY Orderh
           FIELDS ( Orderno
                    Orderty
                    Company Currency Description Partner Quantity Spras Status TotQuan TotValue )
             WITH VALUE #( FOR key IN keys ( Orderno      = key-Orderno
                                             Orderty      = key-Orderty ) )
         RESULT DATA(Orderhs).

    "Pass the Result
    result = VALUE #( FOR Order IN Orderhs ( Orderno      = Order-Orderno
                                             Orderty      = Order-Orderty
                                                %param    = Order ) ).

  ENDMETHOD.

  METHOD valTot.
    LOOP AT keys INTO DATA(ls_key).
    ENDLOOP.
    "DATA (err) TYPE reported-%other
    "Read the Entity.
    READ ENTITIES OF zrap_i_order_h_sro IN LOCAL MODE
       ENTITY Orderh
         FIELDS ( Orderno
                  Orderty
                  Company Currency Description Partner Quantity Spras Status TotQuan TotValue )
           WITH VALUE #( FOR key IN keys ( Orderno      = key-Orderno
                                           Orderty      = key-Orderty ) )
       RESULT DATA(Orderhs).

    LOOP AT Orderhs INTO DATA(ls_Orderh).
      IF ls_Orderh-TotValue IS INITIAL.
        "Error - Fill value

        APPEND VALUE #( %tky = ls_orderh-%tky ) TO failed-orderh.
        APPEND VALUE #( %tky                = ls_orderh-%tky
                       %state_area         = 'VALIDATE_TOTAL'
                       %msg                = NEW zrap_clorder_mess(
                                                 textid   = zrap_clorder_mess=>total_blank
                                                 severity = if_abap_behv_message=>severity-error )
                       %element-TotValue   = if_abap_behv=>mk-on
                      ) TO reported-orderh.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD draftOrder.
    "EML code. New Concept :)
    MODIFY ENTITIES OF zrap_i_order_h_sro IN LOCAL MODE
           ENTITY Orderh
              UPDATE FIELDS ( Status )
                 WITH VALUE #( FOR key IN keys ( Orderno      = key-Orderno
                                                 Orderty      = key-Orderty
                                                 Status       = 'DR' ) ) " Draft
           FAILED   failed
           REPORTED reported.

    "Read changed data for action result
    READ ENTITIES OF zrap_i_order_h_sro IN LOCAL MODE
         ENTITY Orderh
           FIELDS ( Orderno
                    Orderty
                    Company Currency Description Partner Quantity Spras Status TotQuan TotValue )
             WITH VALUE #( FOR key IN keys ( Orderno      = key-Orderno
                                             Orderty      = key-Orderty ) )
         RESULT DATA(Orderhs).

    "Pass the Result
    result = VALUE #( FOR Order IN Orderhs ( Orderno      = Order-Orderno
                                             Orderty      = Order-Orderty
                                                %param    = Order ) ).

  ENDMETHOD.

  METHOD DetM.
    LOOP AT keys INTO DATA(ls_keys).
    ENDLOOP.
  ENDMETHOD.

  METHOD valSt.

  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
*METHODS run FOR MODIFY IMPORTING keys FOR ACTION .
