@EndUserText.label: 'Projection View - Registered Courses'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI.headerInfo.typeNamePlural: 'Registered Courses'

@Search.searchable: true    

define root view entity Z_C_REG_COURSES_AG 
    provider contract transactional_query
        as projection on Z_I_REG_COURSES_AG
{
      @UI.facet: [ {
        purpose:  #STANDARD,
        type:     #IDENTIFICATION_REFERENCE,
        label:    'Register Course' } ]
        
        
    @UI: { lineItem: [ { position: 10, label: 'Registered Course Id'} ],
           identification:[ { position: 10, label: 'Registered Course Id'}] }
    @UI.hidden: true
    key RegisteredCourseId,
    @UI: { lineItem: [ { position: 20, label: 'Course Id'} ],
           identification:[ { position: 20, label: 'Course Id'}] }
    @UI.hidden: true
    CourseId,
    @UI: { lineItem: [ { position: 30, label: 'Student Id'} ],
           identification:[ { position: 30, label: 'Student Id'}] }   
    @UI.hidden: true   
    StudentId,
    @UI: { lineItem: [ { position: 40, label: 'Student'} ],
           identification:[ { position: 40, label: 'Student'}] }   
    @Consumption.valueHelpDefinition: [{ 
        entity : {name: 'Z_I_STUDENTS_AG', element: 'LastName' },
        additionalBinding: [{ localElement: 'StudentId', element: 'StudentId' },
                            { localElement: 'DepartmentName', element: 'DepartmentName' }] 
        }]
    @Search.defaultSearchElement: true  
    Student,
    @UI: { lineItem: [ {position: 50, label: 'Department Name'} ],
           identification:[ { position: 50, label: 'Department Name'} ] }
    @Consumption.valueHelpDefinition: [{ entity : {name: 'Z_I_DEPARTMENTS_AG', element: 'DepartmentName' } } ]
    @Search.defaultSearchElement: true
    DepartmentName,
    @UI: { lineItem: [ {position: 50, label: 'Course Name'} ],
           identification:[ { position: 50, label: 'Course Name'} ] }
    @Consumption.valueHelpDefinition: [{ 
        entity: {name: 'Z_I_COURSES_AG' , element: 'CourseName' },
        additionalBinding: [{ localElement: 'DepartmentName', element: 'DepartmentName' },
                            { localElement: 'CourseId', element: 'CourseId' }]
                           }]
    @Search.defaultSearchElement: true
    CourseName,
    @UI.hidden: true
    last_changed_at,
    @UI.hidden: true
    CourseDepartment,
    @UI.hidden: true
    StudentDepartment,
    

    /* Associations */
    _Course,
    _Student
}
