@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Entity View for Student'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZISTUDENT12 as select from zdbstudenttable
association[0..1] to ZI_GENDER_12345 as  _gender on  $projection.Gender = _gender.Value
composition[0..*] of ZIEXAMRESULT_12 as _examresult_12
{
    key system_id as SystemId,
    student_id as StudentId,
    student_name as StudentName,
    date_of_birth as DateOfBirth,
    gender as Gender,
    mail_id as MailId,
    contact_number as ContactNumber,
    age as Age,
    address as Address,
    father_name as FatherName,
    mother_name as MotherName,
    joining_year as JoiningYear,
    student_type as StudentType,
    departure_year as DepartureYear,
    lastchangedat as Lastchangedat,
    locallastchangedat as Locallastchangedat, 
    _gender,
 //   _gender.Description as Genderdesc,
    _examresult_12
}
