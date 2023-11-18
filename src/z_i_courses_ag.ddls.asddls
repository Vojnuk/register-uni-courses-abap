@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View  - Courses'
define root view entity Z_I_COURSES_AG as select from zcourses_ag
association to Z_I_DEPARTMENTS_AG as _Department on $projection.DepartmentId = _Department.DepartmentId
association [0..*] to Z_I_REG_COURSES_AG as _RegisteredCourses on $projection.CourseId = _RegisteredCourses.CourseId
{
    key course_id as CourseId,
    department_id as DepartmentId,
    course_name as CourseName,
    quota as Quota,
    duration as Duration,
    department_name as DepartmentName,
    last_changed_at,
    _Department,
    _RegisteredCourses
}
