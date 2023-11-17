@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View - Departments'
define root view entity Z_I_DEPARTMENTS_AG as select from zdepartments_ag
{
    key department_id as DepartmentId,
    department_name as DepartmentName,
    department_head as DepartmentHead,
    last_changed_at
}
