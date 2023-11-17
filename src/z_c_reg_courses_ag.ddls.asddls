@EndUserText.label: 'Projection View - Registered Courses'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity Z_C_REG_COURSES_AG 
    provider contract transactional_query
        as projection on Z_I_REG_COURSES_AG
{
    key RegisteredCourseId,
    CourseId,
    StudentId,
    Student,
    CourseName,
    DepartmentName,
    /* Associations */
    _Course,
    _Student
}
