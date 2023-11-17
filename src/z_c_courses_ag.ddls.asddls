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

    @UI: { lineItem: [ {label: 'Course Id'} ],
           identification:[ { position: 10} ] 
         }
    key CourseId,
    @UI: { lineItem: [ {label: 'DepartmentId'} ],
           identification:[ { position: 20} ] 
         }
    DepartmentId,
    @UI: { lineItem: [ {label: 'Course Name'} ],
           identification:[ { position: 30} ] 
         }
    CourseName,
    @UI: { lineItem: [ {label: 'Quota'} ],
           identification:[ { position: 40} ] 
         }
    Quota,
    @UI: { lineItem: [ {label: 'Duration'} ],
           identification:[ { position: 50} ] 
         }
    Duration,
    @UI: { lineItem: [ {label: 'DepartmentName'} ],
           identification:[ { position: 60} ] 
         }
    DepartmentName,
    /* Associations */
    _Department
}
