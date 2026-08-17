CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Header RESULT result.
    METHODS setorderid FOR DETERMINE ON SAVE
      IMPORTING keys FOR header~setorderid.

ENDCLASS.

CLASS lhc_Header IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD setOrderId.

    READ ENTITIES OF zi_sales_or_h_4518 IN LOCAL MODE
    ENTITY Header
    FIELDS ( SoID )
    WITH CORRESPONDING #( keys )
    RESULT DATA(so_headers).

    DELETE so_headers WHERE SoID IS NOT INITIAL.
    CHECK so_headers IS NOT INITIAL.

    SELECT single from zsales_or_h_4518 fields max( so_id ) into @data(max_soid).
    modify ENTITIES OF zi_sales_or_h_4518 in LOCAL MODE
    ENTITY Header
    UPDATE FIELDS ( SoID )
    with VALUE #(
    for Header in so_headers INDEX INTO i (
        %tky = Header-%tky
        SoID = max_soid + 1
        )
    ).

  ENDMETHOD.

ENDCLASS.
