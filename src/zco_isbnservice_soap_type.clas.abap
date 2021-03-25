class ZCO_ISBNSERVICE_SOAP_TYPE definition
  public
  inheriting from CL_PROXY_CLIENT
  create public .

public section.

  methods CONSTRUCTOR
    importing
      !DESTINATION type ref to IF_PROXY_DESTINATION optional
      !LOGICAL_PORT_NAME type PRX_LOGICAL_PORT_NAME optional
    preferred parameter LOGICAL_PORT_NAME
    raising
      CX_AI_SYSTEM_FAULT .
  methods IS_VALID_ISBN10
    importing
      !INPUT type ZIS_VALID_ISBN10SOAP_REQUEST
    exporting
      !OUTPUT type ZIS_VALID_ISBN10SOAP_RESPONSE
    raising
      CX_AI_SYSTEM_FAULT .
  methods IS_VALID_ISBN13
    importing
      !INPUT type ZIS_VALID_ISBN13SOAP_REQUEST
    exporting
      !OUTPUT type ZIS_VALID_ISBN13SOAP_RESPONSE
    raising
      CX_AI_SYSTEM_FAULT .
protected section.
private section.
ENDCLASS.



CLASS ZCO_ISBNSERVICE_SOAP_TYPE IMPLEMENTATION.


  method CONSTRUCTOR.

  super->constructor(
    class_name          = 'ZCO_ISBNSERVICE_SOAP_TYPE'
    logical_port_name   = logical_port_name
    destination         = destination
  ).

  endmethod.


  method IS_VALID_ISBN10.

  data(lt_parmbind) = value abap_parmbind_tab(
    ( name = 'INPUT' kind = '0' value = ref #( INPUT ) )
    ( name = 'OUTPUT' kind = '1' value = ref #( OUTPUT ) )
  ).
  if_proxy_client~execute(
    exporting
      method_name = 'IS_VALID_ISBN10'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.


  method IS_VALID_ISBN13.

  data(lt_parmbind) = value abap_parmbind_tab(
    ( name = 'INPUT' kind = '0' value = ref #( INPUT ) )
    ( name = 'OUTPUT' kind = '1' value = ref #( OUTPUT ) )
  ).
  if_proxy_client~execute(
    exporting
      method_name = 'IS_VALID_ISBN13'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.
ENDCLASS.
