CLASS lhc_Z_I_COURSES_AG DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS checkUniquenessCourseName FOR VALIDATE ON SAVE
      IMPORTING keys FOR Course~checkUniquenessCourseName.
    METHODS checkCourseDurationLength FOR VALIDATE ON SAVE
      IMPORTING keys FOR Course~checkCourseDurationLength.

ENDCLASS.

CLASS lhc_Z_I_COURSES_AG IMPLEMENTATION.

  METHOD checkUniquenessCourseName.
      READ ENTITIES OF z_i_courses_ag IN LOCAL MODE
      ENTITY Course
      FIELDS ( CourseName )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_course_data)
      FAILED DATA(ls_failed)
      REPORTED DATA(ls_reported).

    LOOP AT lt_course_data INTO DATA(ls_course).
      SELECT SINGLE FROM z_i_courses_ag
        FIELDS CourseName
        WHERE CourseName =  @ls_course-CourseName AND DepartmentName = @ls_course-DepartmentName
        INTO @DATA(ld_found_CourseName).
      IF sy-subrc = 0.

        INSERT VALUE #(
           %msg = new_message_with_text( text = 'Choose different Course Name.' )
           %element-CourseName = if_abap_behv=>mk-on
        ) INTO TABLE reported-course.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD checkCourseDurationLength.
      READ ENTITIES OF z_i_courses_ag IN LOCAL MODE
        ENTITY Course
            FIELDS ( Duration )
            WITH CORRESPONDING #( keys )
        RESULT DATA(courses).

    LOOP AT courses INTO DATA(course).
        IF course-Duration > 4.

        INSERT VALUE #(
           %msg = new_message_with_text( text = 'Course cannot be longer than 4 semesters.' )
           %element-Duration = if_abap_behv=>mk-on
        ) INTO TABLE reported-course.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
