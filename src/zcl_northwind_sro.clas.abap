CLASS zcl_northwind_sro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_northwind_sro IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA: lt_business_data TYPE TABLE OF zcategories,
*          lo_http_client   TYPE REF TO if_web_http_client,
*          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
*          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
*          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.
*
*    "DATA: lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
*    "      lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
*    "      lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
*    "      lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
*    "      lt_range_categoryid TYPE RANGE OF <element_name>,
*    "      lt_range_categoryname TYPE RANGE OF <element_name>.
*
*
*    TRY.
*        " Create http client
*        " Details depend on your connection settings
**        lo_http_client = cl_web_http_client_manager=>
*
*        "create_by_http_destination( i_destination = 'https://services.odata.org/V2/Northwind/Northwind.svc' ).
*
*        "Set Destination
*        DATA(dest) = cl_http_destination_provider=>create_by_url( 'https://services.odata.org/V2/Northwind/Northwind.svc' ).
*
*        "Set Client - to be used for request
*        DATA(lo_client) = cl_web_http_client_manager=>create_by_http_destination( dest ).
*
**                         CATCH cx_web_http_client_error.
**        create_by_http_destination(
**                                  cl_http_destination_provider=>create_by_url( i_url = 'https://services.odata.org/V2/Northwind/Northwind.svc' )
***                                  CATCH cx_http_dest_provider_error.
***                                  create_by_cloud_destination(
***                                          i_name                  = '<Name of Cloud Destination>'
***                                          i_service_instance_name = '<Service Instance Name>' )
**                                          ).
**
*        lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
*          EXPORTING
*            iv_service_definition_name = 'ZSC_NORTHWIND_ODATA'
*            io_http_client             = lo_client
*            iv_relative_service_root   = ' '). " '<service_root>' ).
*
*
*        " Navigate to the resource and create a request for the read operation
*        lo_request = lo_client_proxy->create_resource_for_entity_set( 'CATEGORIES' )->create_request_for_read( ).
*
*
*        " Create the filter tree
*        "lo_filter_factory = lo_request->create_filter_factory( ).
*        "
*        "lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'categoryid'
*        "                                                        it_range             = lt_range_categoryid ).
*        "lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'categoryname'
*        "                                                        it_range             = lt_range_categoryname ).
*        "lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
*        "
*        "lo_request->set_filter( lo_filter_node_root ).
*
*        lo_request->set_top( 50 )->set_skip( 0 ).
*
*        " Execute the request and retrieve the business data
*        lo_response = lo_request->execute( ).
*        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).
*
*      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
*        " Handle remote Exception
*        " It contains details about the problems of your http(s) connection
*
*      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
*        " Handle Exception
*
*      CATCH cx_web_http_client_error.
*        "handle exception
*      catch cx_http_dest_provider_error.
*        "handle exception
*    ENDTRY.

    TRY.
        DATA(destination) = cl_soap_destination_provider=>create_by_url( i_url = 'http://webservices.daehosting.com/services/isbnservice.wso' ).
*                        CATCH cx_soap_destination_error.

*    create_by_cloud_destination(
*                          i_name = '<Name of your Cloud Destination>'
*                          i_service_instance_name = '<Service Instance Name>'
*                        ).


        DATA(proxy) = NEW zco_isbnservice_soap_type(
                        destination = destination
                      ).
        DATA(request) = VALUE zis_valid_isbn13soap_request( ).

        request-s_isbn = '978-1-56619-909-4'.
        proxy->is_valid_isbn13(
          EXPORTING
            input = request
          IMPORTING
            output = DATA(response)
        ).

        IF response IS NOT INITIAL.

        ENDIF.
        "handle response
      CATCH cx_soap_destination_error.
        "handle error
      CATCH cx_ai_system_fault.
        "handle error
    ENDTRY.



  ENDMETHOD.
ENDCLASS.
