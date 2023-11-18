@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View  - Registered Courses'
define root view entity Z_I_REG_COURSES_AG as select from zreg_courses_ag
association to Z_I_COURSES_AG as _Course on $projection.CourseId = _Course.CourseId
association to Z_I_STUDENTS_AG as _Student on $projection.CourseId = _Student.StudentId
{
    key registered_course_id as RegisteredCourseId,
    course_id as CourseId,
    student_id as StudentId,
    student as Student,
    course_name as CourseName,
    department_name as DepartmentName,
    last_changed_at,
    _Course,
    _Student
}
