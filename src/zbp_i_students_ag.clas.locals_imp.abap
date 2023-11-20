*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lhc_student DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    TYPES tt_studentNumber_update TYPE TABLE FOR UPDATE z_i_students_ag.

    METHODS updateStudentNumber         FOR DETERMINE ON MODIFY IMPORTING keys FOR Student~updateStudentNumber.


ENDCLASS.


CLASS lhc_student IMPLEMENTATION.

  METHOD updateStudentNumber.
    READ ENTITIES OF Z_I_STUDENTS_AG IN LOCAL MODE
        ENTITY Student
          FIELDS ( StudentNo )
          WITH CORRESPONDING #( keys )
        RESULT DATA(lt_student).

    DELETE lt_student WHERE StudentNo IS NOT INITIAL.
    CHECK lt_student IS NOT INITIAL.

    "Get max StudentNo
    SELECT SINGLE FROM Z_I_STUDENTS_AG FIELDS MAX( StudentNo ) INTO @DATA(lv_max_studentNo).

    "update involved instances
    MODIFY ENTITIES OF Z_I_STUDENTS_AG IN LOCAL MODE
      ENTITY Student
        UPDATE FIELDS ( StudentNo )
        WITH VALUE #( FOR ls_student IN lt_student INDEX INTO i (
                          %key      = ls_student-%key
                          StudentNo  = lv_max_studentno + i ) )
    REPORTED DATA(lt_reported).


  ENDMETHOD.

ENDCLASS.
