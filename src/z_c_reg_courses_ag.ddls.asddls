@EndUserText.label: 'Projection View - Registered Courses'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@UI.headerInfo.typeNamePlural: 'Registered Courses'

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
    key RegisteredCourseId,
    @UI: { lineItem: [ { position: 20, label: 'Course Id'} ],
           identification:[ { position: 20, label: 'Course Id'}] }
    CourseId,
    @UI: { lineItem: [ { position: 30, label: 'Student Id'} ],
           identification:[ { position: 30, label: 'Student Id'}] }      
    StudentId,
    @UI: { lineItem: [ { position: 40, label: 'Student Name'} ],
           identification:[ { position: 40, label: 'Student Name'}] }   
    @Consumption.valueHelpDefinition: [{ entity : {name: 'Z_I_STUDENTS_AG', element: 'FirstName' } } ]
    @Search.defaultSearchElement: true  
    Student,
    @UI: { lineItem: [ {position: 50, label: 'Course Name'} ],
           identification:[ { position: 50, label: 'Course Name'} ] }
    @Consumption.valueHelpDefinition: [{ entity : {name: 'Z_I_COURSES_AG', element: 'CourseName' } } ]
    @Search.defaultSearchElement: true
    CourseName,
    @UI: { lineItem: [ {position: 50, label: 'Department Name'} ],
           identification:[ { position: 50, label: 'Department Name'} ] }
    @Consumption.valueHelpDefinition: [{ entity : {name: 'Z_I_DEPARTMENTS_AG', element: 'DepartmentName' } } ]
    @Search.defaultSearchElement: true
    DepartmentName,
    /* Associations */
    _Course,
    _Student
}
