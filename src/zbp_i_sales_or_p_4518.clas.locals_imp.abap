CLASS lhc_positions DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS setPositionNumber FOR DETERMINE ON SAVE
       keys FOR Positions~setPositionNumber.

ENDCLASS.

CLASS lhc_positions IMPLEMENTATION.

  METHOD setPositionNumber.

    DATA max_pos TYPE zsales_or_p_4518-pos_so.
    DATA position_up TYPE TABLE FOR UPDATE zi_sales_or_h_4518\\Positions.

    READ ENTITIES OF zi_sales_or_h_4518 IN LOCAL MODE
    ENTITY Positions BY \_header
    FIELDS ( SoUUID  ) WITH CORRESPONDING #( keys )
    RESULT DATA(headers).

    LOOP AT headers INTO DATA(head).
      READ ENTITIES OF  zi_sales_or_h_4518 IN LOCAL MODE
      ENTITY header BY \_Item
      FIELDS ( PosSo ) WITH VALUE #( ( %tky = head-%tky ) )
      RESULT DATA(positions).

      max_pos = '0000000000'.

      LOOP AT positions INTO DATA(pos).
        IF pos-PosSo > max_pos.
          max_pos = pos-PosSo.
        ENDIF.
      ENDLOOP.

        LOOP AT positions INTO data(pos_unassigned) WHERE PosSo IS INITIAL.
          max_pos += 1.
          APPEND VALUE #(
              %tky = pos_unassigned-%tky
              PosSo = max_pos
          ) TO position_up.
        ENDLOOP.


        MODIFY ENTITIES OF zi_sales_or_h_4518 IN LOCAL MODE
            ENTITY Positions
            UPDATE FIELDS ( PosSo )
            WITH position_up.

      ENDLOOP.


  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

