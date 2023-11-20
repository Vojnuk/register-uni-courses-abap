@EndUserText.label: 'Projection View - Students'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI.headerInfo.typeNamePlural: 'Students'

@Search.searchable: true  

define root view entity Z_C_STUDENTS_AG 
    provider contract transactional_query
        as projection on Z_I_STUDENTS_AG
{

      @UI.facet: [ {
        purpose:  #STANDARD,
        type:     #IDENTIFICATION_REFERENCE,
        label:    'Student' } ]
        
    @UI: { lineItem: [ { position: 10, label: 'Student Id'} ],
           identification:[ { position: 10, label: 'Student Id'}] } 
    @UI.hidden: true       
    key StudentId,
    @UI: { lineItem: [ { position: 20, label: 'DepartmentId'} ],
           identification:[ { position: 20, label: 'DepartmentId'} ] }
    @UI.hidden: true
    DepartmentId,
    @UI: { lineItem: [ {position: 30, label: 'First Name'} ],
           identification:[ { position: 30, label: 'First Name'} ] }
    FirstName,
    @UI: { lineItem: [ {position: 40, label: 'Last Name'} ],
           identification:[ { position: 40, label: 'Last Name'} ] }
    LastName,
    @UI: { lineItem: [ {position: 50, label: 'Student No'} ],
           identification:[ { position: 50, label: 'Student No'} ] }
    StudentNo,
    @UI.hidden: true
    last_changed_at,
    @UI: { lineItem: [ {position: 60 ,label: 'Department'} ],
           identification:[ { position: 60, label: 'Department'} ] }
    @Consumption.valueHelpDefinition: [{ 
                                        entity : {name: 'Z_I_DEPARTMENTS_AG', element: 'DepartmentName' },
                                        additionalBinding: [{ localElement: 'DepartmentId', element: 'DepartmentId' }]
                                      }]
    @Search.defaultSearchElement: true
    DepartmentName,
    /* Associations */
    _Department
}
