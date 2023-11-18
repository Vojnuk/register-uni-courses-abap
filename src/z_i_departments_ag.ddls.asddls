@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View - Departments'
define root view entity Z_I_DEPARTMENTS_AG as select from zdepartments_ag
association [0..*] to Z_I_COURSES_AG as _Courses on $projection.DepartmentId = _Courses.DepartmentId
association [0..*] to Z_I_STUDENTS_AG as _Students on $projection.DepartmentId = _Students.DepartmentId
{
    key department_id as DepartmentId,
    department_name as DepartmentName,
    department_head as DepartmentHead,
    last_changed_at,
    _Courses,
    _Students
    
}
