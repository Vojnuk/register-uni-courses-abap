CLASS lhc_z_i_reg_courses_ag DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS checkUniquenessRegisterCourse FOR VALIDATE ON SAVE
      IMPORTING keys FOR RegisteredCourse~checkUniquenessRegisterCourse.
    METHODS checkStudentQuotaForCourse FOR VALIDATE ON SAVE
      IMPORTING keys FOR RegisteredCourse~checkStudentQuotaForCourse.




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





  METHOD checkStudentQuotaForCourse.
      READ ENTITIES OF z_i_reg_courses_ag IN LOCAL MODE
        ENTITY RegisteredCourse
            FIELDS ( CourseName )
            WITH CORRESPONDING #( keys )
        RESULT DATA(regCourses).
        LOOP AT regCourses INTO DATA(course).
        ENDLOOP.

    data : coursesCount type i.
    coursesCount = lines( regCourses ).

      SELECT SINGLE FROM Z_I_COURSES_AG FIELDS ( Quota ) WHERE CourseName = @course-CourseName INTO @DATA(maxStudentQuotaForCourse).

      IF maxStudentQuotaForCourse <= coursesCount.
        INSERT VALUE #(
           %msg = new_message_with_text( text = |Course is full. Student quota ( { maxStudentQuotaForCourse } ).| )
            %element-CourseName = if_abap_behv=>mk-on
        ) INTO TABLE reported-registeredCourse.
      ENDIF.


  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
