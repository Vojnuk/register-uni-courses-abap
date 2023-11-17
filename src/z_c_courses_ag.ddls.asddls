@EndUserText.label: 'Projection View - Courses'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI.headerInfo.typeNamePlural: 'Courses'

define root view entity Z_C_COURSES_AG
    provider contract transactional_query
        as projection on Z_I_COURSES_AG
{
      @UI.facet: [ {
        purpose:  #STANDARD,
        type:     #IDENTIFICATION_REFERENCE,
        label:    'Course' } ]

    @UI: { lineItem: [ { position: 10, label: 'Course Id'} ],
           identification:[ { position: 10, label: 'Course Id'}] 
         }
    key CourseId,
    @UI: { lineItem: [ { position: 20, label: 'DepartmentId'} ],
           identification:[ { position: 20, label: 'DepartmentId'} ] 
         }
    DepartmentId,
    @UI: { lineItem: [ {position: 30, label: 'Course Name'} ],
           identification:[ { position: 30, label: 'Course Name'} ] 
         }
    CourseName,
    @UI: { lineItem: [ {position: 40, label: 'Quota'} ],
           identification:[ { position: 40, label: 'Quota'} ] 
         }
    Quota,
    @UI: { lineItem: [ {position: 50, label: 'Duration'} ],
           identification:[ { position: 50, label: 'Duration'}] 
         }
    Duration,
    @UI: { lineItem: [ {position: 60 ,label: 'Department Name'} ],
           identification:[ { position: 60, label: 'Department Name'}] 
         }
    @Consumption.valueHelpDefinition: [{ entity : {name: 'Z_I_DEPARTMENTS_AG', element: 'DepartmentName' } }]
//    @Search.defaultSearchElement: true
    DepartmentName,
    /* Associations */
    _Department
}
