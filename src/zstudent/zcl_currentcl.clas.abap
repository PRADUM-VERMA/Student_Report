CLASS zcl_currentcl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES IF_SADL_EXIT_CALC_ELEMENT_READ.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_currentcl IMPLEMENTATION.
METHOD if_sadl_exit_calc_element_read~calculate.
*     this is the Consumption view name when use ddic then here the ddic name
   DATA: lt_studentdata TYPE STANDARD TABLE OF ZCSTUDENT12 with DEFAULT KEY.

         lt_studentdata = CORRESPONDING #( it_original_data ).
         LOOP AT lt_studentdata ASSIGNING FIELD-SYMBOL(<lfs_progessors>).
            if ( <lfs_progessors>-StudentType EQ 'REGULAR' ).
              <lfs_progessors>-current_class = 5.
            ELSE.
             <lfs_progessors>-current_class = 10.
            ENDIF.
         ENDLOOP.

ENDMETHOD.

METHOD if_sadl_exit_calc_element_read~get_calculation_info.

ENDMETHOD.

ENDCLASS.
