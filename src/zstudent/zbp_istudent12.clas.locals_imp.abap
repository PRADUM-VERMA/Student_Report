CLASS lhc_student DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR student RESULT result.
*    METHODS setadmitted FOR MODIFY
*      IMPORTING keys FOR ACTION student~setadmitted RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR student RESULT result.

    METHODS setadmitted2 FOR MODIFY
      IMPORTING keys FOR ACTION student~setadmitted2 RESULT result.
*    METHODS precheck_update FOR PRECHECK
*      IMPORTING entities FOR UPDATE student.

ENDCLASS.

CLASS lhc_student IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

*  METHOD precheck_update.
*
*  LOOP AT Entities ASSIGNING FIELD-SYMBOL(<lfs_entity>).
** 01 =  value is updated / changed , 00 = value is not changed
*
* check <lfs_entity>-%control-JoiningYear EQ '01' OR <l
*
*
*  ENDLOOP.
*
*  ENDMETHOD.

*  METHOD setAdmitted.
*
*  MODIFY ENTITIES OF ZISTUDENT12 IN LOCAL MODE
*  ENTITY Student
*  UPDATE
*  FIELDS ( DepartureYear )
*  WITH VALUE #(  FOR key in keys ( %tky = key-%tky DepartureYear =  abap_true ) )
*
*  FAILED failed
*  REPORTED reported.
*
*  "get the response updated record
*
*  READ ENTITIES OF ZISTUDENT12 IN LOCAL MODE
*  ENTITY Student
*  ALL FIELDS WITH CORRESPONDING #( keys )
*  RESULT DATA(studentdata).
*  result = VALUE #( For studentrec in  studentdata ( %tky = studentrec-%tky %param =   studentrec ) ).
*
*
*  ENDMETHOD.

  METHOD get_instance_features.


  READ ENTITIES OF ZISTUDENT12 IN LOCAL MODE
  ENTITY Student
  FIELDS ( DepartureYear ) WITH CORRESPONDING #( keys )
  RESULT DATA(setAdmitted2)
  FAILED failed.



  result =
  VALUE #(
  for stud in setAdmitted2
  let statusval = COND #(  When stud-DepartureYear = abap_true
                           THEN if_abap_behv=>fc-o-disabled
                           else if_abap_behv=>fc-o-enabled
                          )
                          In ( %tky = stud-%tky
                              %action-setAdmitted2 = statusval
                           )
   ).
*   DATA current_year TYPE i.
*  current_year = sy-datum+0(4).
** DATA current_year TYPE i.
** DATA(lv_syst) = cl_abap_syst=>get_instance( ).
*
**  current_year = lv_syst->get_date( )->get_year( ).
*
*   MODIFY ENTITIES OF ZISTUDENT12 IN LOCAL MODE
*   ENTITY STUDENT
*   UPDATE
*   FIELDS (  departureyear )
*   WITH VALUE #( FOR  KEY  IN KEYS ( %tky = key-%tky departureyear = |{ current_year }|  ) )
*
*   FAILED failed
*   REPORTED reported.

  ENDMETHOD.

  METHOD setAdmitted2.
  DATA current_year TYPE i.
  current_year = sy-datum+0(4).
* DATA current_year TYPE i.
* DATA(lv_syst) = cl_abap_syst=>get_instance( ).

*  current_year = lv_syst->get_date( )->get_year( ).

   MODIFY ENTITIES OF ZISTUDENT12 IN LOCAL MODE
   ENTITY STUDENT
   UPDATE
   FIELDS (  departureyear )
   WITH VALUE #( FOR  KEY  IN KEYS ( %tky = key-%tky departureyear = |{ current_year }|  ) )

   FAILED failed
   REPORTED reported.
  "get the response updated record

  READ ENTITIES OF ZISTUDENT12 IN LOCAL MODE
  ENTITY Student
  ALL FIELDS WITH CORRESPONDING #( keys )
  RESULT DATA(studentdata).
  result = VALUE #( For studentrec in  studentdata ( %tky = studentrec-%tky %param =   studentrec ) ).
  ENDMETHOD.

ENDCLASS.
