CLASS zcl_virtual_element_calc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_virtual_element_calc IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~calculate.

  CHECK NOT it_original_data IS INITIAL.
   DATA : lt_calculated_data TYPE STANDARD TABLE OF ZCSTUDENT12 WITH DEFAULT KEY.
          lt_calculated_data = CORRESPONDING #( it_original_Data ).

           MOVE-CORRESPONDING it_original_data TO lt_calculated_data.
            LOOP AT lt_calculated_data ASSIGNING FIELD-SYMBOL(<lfs_progessors>).
            if ( <lfs_progessors>-StudentType EQ 'REGULAR' ).
              <lfs_progessors>-current_class = 5.
            ELSE.
             <lfs_progessors>-current_class = 10.
            ENDIF.
         ENDLOOP.
         ct_calculated_data =  CORRESPONDING #( lt_calculated_data ).

  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

  ENDMETHOD.

ENDCLASS.
