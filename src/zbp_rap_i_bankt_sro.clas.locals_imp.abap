CLASS lhc_Bank DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE Bank.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE Bank.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE Bank.

    METHODS read FOR READ
      IMPORTING keys FOR READ Bank RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK Bank.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Bank RESULT result.

*    METHODS earlyNumbering_Create method FOR NUMBERING
*      IMPORTING entities FOR CREATE Bank.
*    METHODS lock FOR LOCK
*      IMPORTING keys FOR LOCK Bank.

ENDCLASS.

CLASS lhc_Bank IMPLEMENTATION.

  METHOD create.
    DATA ls_bank TYPE zrap_bankt_sro.
    LOOP AT entities INTO DATA(ls_entities).
      MOVE-CORRESPONDING ls_entities TO ls_bank.
      INSERT zrap_bankt_sro FROM @ls_bank.
    ENDLOOP.
  ENDMETHOD.

  METHOD update.
    SELECT *
      FROM zrap_bankt_sro
       FOR ALL ENTRIES IN @entities
     WHERE bankno  EQ @entities-Bankno
       AND account EQ @entities-Account
       AND spras   EQ @entities-Spras
      INTO TABLE @DATA(lt_bank).
    LOOP AT entities INTO DATA(ls_entities).
      READ TABLE lt_bank INTO DATA(ls_bank)
      WITH KEY bankno  = ls_entities-Bankno
               account = ls_entities-Account
               spras   = ls_entities-Spras.
      IF sy-subrc EQ 0.
        MOVE-CORRESPONDING ls_entities TO ls_bank.
        MODIFY zrap_bankt_sro FROM @ls_bank.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD delete.
    IF 1 = 2.
    ENDIF.
  ENDMETHOD.

  METHOD read.
    IF 1 = 2.
    ENDIF.
  ENDMETHOD.

  METHOD lock.
*    TRY.
*        DATA(lock) = cl_abap_lock_object_factory=>get_instance( iv_name = 'Bank' ).
*      CATCH cx_abap_lock_failure INTO DATA(lx_lock).
*        "handle exception
*    ENDTRY.

    LOOP AT keys INTO DATA(ls_key).
    ENDLOOP.
  ENDMETHOD.

  METHOD get_instance_features.
    LOOP AT keys INTO DATA(ls_key).
    ENDLOOP.

  ENDMETHOD.

*  METHOD earlynumbering_create.
*  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZRAP_I_BANKT_SRO DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

    METHODS adjust_numbers REDEFINITION.

ENDCLASS.

CLASS lsc_ZRAP_I_BANKT_SRO IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.

  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

  METHOD adjust_numbers.
    "Late Numbering
    IF  1 = 2.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
