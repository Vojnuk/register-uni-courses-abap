@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View  - Students'
define root view entity Z_I_STUDENTS_AG as select from zstudents_ag
association to Z_I_DEPARTMENTS_AG as _Department on $projection.DepartmentId = _Department.DepartmentId
association [0..*] to Z_I_REG_COURSES_AG as _RegisteredCourses on $projection.StudentId = _RegisteredCourses.StudentId
{
    key student_id as StudentId,
    department_id as DepartmentId,
    first_name as FirstName,
    last_name as LastName,
    student_no as StudentNo,
    department_name as DepartmentName,
    last_changed_at,
    _Department,
    _RegisteredCourses
}
