@EndUserText.label: 'Projection View  - Departments'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity Z_C_DEPARTMENTS_AG
    provider contract transactional_query 
        as projection on Z_I_DEPARTMENTS_AG
{
    key DepartmentId,
    DepartmentName,
    DepartmentHead
}
