@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumpution View for Student'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
  }
@Metadata.allowExtensions: true
define root  view entity ZCSTUDENT12 as projection on ZISTUDENT12 as Student
{
    @EndUserText.label: 'System_Id'
    key SystemId,
    @EndUserText.label: 'Student_Id'
    StudentId,
    @EndUserText.label: 'Student_Name'
    StudentName,
    @EndUserText.label: 'Date_of_Birth'
    DateOfBirth,
    @EndUserText.label: 'Gender'
    Gender,
  //  Genderdesc,
    @EndUserText.label: 'Mail_Id'
    MailId,
    @EndUserText.label: 'Contact_Number'
    ContactNumber,
    @EndUserText.label: 'Age'
    Age,
    @EndUserText.label: 'Address'
    Address,
    @EndUserText.label: 'Father_Name'
    FatherName,
    @EndUserText.label: 'Mother_Name'
    MotherName,
    @EndUserText.label: 'Joining_year'
    JoiningYear,
    @EndUserText.label: 'Student_type'
    StudentType,
    @EndUserText.label: 'Departure_year'
    DepartureYear,
    Locallastchangedat,
    Lastchangedat,
    _examresult_12: redirected to composition child ZCEXAM_12,
    // THIS IS FOR VIRTUAL ELEMENT
  //  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_CURRENTCL'
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRTUAL_ELEMENT_CALC'
    @EndUserText.label: 'Current_Class'
   // @ObjectModel.readOnly: true
  //  @ObjectModel.virtualElement: true
  //  cast('' as abap.int4 ) as current_class
    virtual current_class : abap.int4   // This is the coloumn Name
    
    
   
}
