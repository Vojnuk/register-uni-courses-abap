@EndUserText.label: 'Projection View  - Departments'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity Z_C_DEPARTMENTS_AG
    provider contract transactional_query 
        as projection on Z_I_DEPARTMENTS_AG
{
      @UI.facet: [ {
        purpose:  #STANDARD,
        type:     #IDENTIFICATION_REFERENCE,
        label:    'Department' } ]
        
    @UI: { lineItem: [ { position: 10, label: 'Department Id'} ],
    identification:[ { position: 10, label: 'Department Id'}] }    
    key DepartmentId,
    @UI: { lineItem: [ { position: 20, label: 'Department Name'} ],
    identification:[ { position: 20, label: 'Department Name'}] }
    DepartmentName,
    @UI: { lineItem: [ { position: 30, label: 'Department Head'} ],
    identification:[ { position: 30, label: 'Department Head'}] }
    DepartmentHead
}
