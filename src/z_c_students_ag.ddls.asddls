@EndUserText.label: 'Projection View - Students'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity Z_C_STUDENTS_AG 
    provider contract transactional_query
        as projection on Z_I_STUDENTS_AG
{
    key StudentId,
    DepartmentId,
    FirstName,
    LastName,
    StudentNo,
    DepartmentName,
    /* Associations */
    _Department
}
