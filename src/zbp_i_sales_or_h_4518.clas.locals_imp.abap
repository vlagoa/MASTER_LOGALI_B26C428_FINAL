CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Header RESULT result.

    METHODS setorderid FOR DETERMINE ON SAVE
      IMPORTING keys FOR header~setorderid.

    METHODS validateemail FOR VALIDATE ON SAVE
       keys FOR header~validateemail.

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

    SELECT SINGLE FROM zsales_or_h_4518 FIELDS MAX( so_id ) INTO @DATA(max_soid).
    MODIFY ENTITIES OF zi_sales_or_h_4518 IN LOCAL MODE
    ENTITY Header
    UPDATE FIELDS ( SoID )
    WITH VALUE #(
    FOR Header IN so_headers INDEX INTO i (
        %tky = Header-%tky
        SoID = max_soid + 1
        )
    ).

  ENDMETHOD.

  METHOD validateEmail.

    READ ENTITIES OF zi_sales_or_h_4518 IN LOCAL MODE
      ENTITY Header
      FIELDS ( Email ) WITH CORRESPONDING #( keys )
      RESULT DATA(headers).

     DATA(lv_regex_pattern) = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'.
    LOOP AT headers INTO DATA(head).
      IF head-Email IS INITIAL.

        APPEND VALUE #( %tky = head-%tky ) TO failed-header.


        APPEND VALUE #(
            %tky        = head-%tky
            %element-email = if_abap_behv=>mk-on
            %msg        = new_message(
                               id       = 'ZMS_SALES_4518'
                               number   = '002'
                               severity = if_abap_behv_message=>severity-error
                          )
        ) TO reported-header.
      ELSEIF NOT matches( val = CONV string( head-Email ) pcre = lv_regex_pattern ).

        APPEND VALUE #( %tky = head-%tky ) TO failed-header.
        APPEND VALUE #(
            %tky           = head-%tky
            %element-email = if_abap_behv=>mk-on
            %msg           = new_message(
                               id       = 'ZMS_SALES_4518'
                               number   = '001'
                               severity = if_abap_behv_message=>severity-error
                             )
        ) TO reported-header.



      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
