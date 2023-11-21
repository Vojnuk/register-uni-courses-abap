CLASS lhc_z_i_reg_courses_ag DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS checkUniquenessRegisterCourse FOR VALIDATE ON SAVE
      IMPORTING keys FOR RegisteredCourse~checkUniquenessRegisterCourse.


ENDCLASS.

CLASS lhc_z_i_reg_courses_ag IMPLEMENTATION.

  METHOD checkUniquenessRegisterCourse.


        READ ENTITIES OF z_i_reg_courses_ag IN LOCAL MODE
      ENTITY RegisteredCourse
      FIELDS ( Student CourseName )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_registered_data)
      FAILED DATA(ls_failed)
      REPORTED DATA(ls_reported).

    LOOP AT lt_registered_data INTO DATA(ls_registered).
      SELECT SINGLE * FROM z_i_reg_courses_ag
*      FIELDS ( Student CourseName )
        WHERE CourseName =  @ls_registered-CourseName
        AND Student =  @ls_registered-Student
        INTO @DATA(ld_found_registered).
      IF sy-subrc = 0.

        APPEND VALUE #(
           %msg = new_message_with_text( text = 'Student is already registered for given course.' )
           %element-CourseName = if_abap_behv=>mk-on
        ) TO reported-RegisteredCourse.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
