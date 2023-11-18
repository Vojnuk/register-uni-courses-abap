@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View  - Courses'
define root view entity Z_I_COURSES_AG as select from zcourses_ag
association [0..*] to Z_I_DEPARTMENTS_AG as _Department on $projection.DepartmentId = _Department.DepartmentId
{
    key course_id as CourseId,
    department_id as DepartmentId,
    course_name as CourseName,
    quota as Quota,
    duration as Duration,
    department_name as DepartmentName,
    last_changed_at,
    _Department // Make association public
}
