@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Entity View for Exam Record'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZIEXAMRESULT_12 as select from zexamrec12
association to parent ZISTUDENT12 as _Student on $projection.SystemId = _Student.SystemId 
association to ZI_CLASS_12 as _class on $projection.Class = _class.value
association to ZI_SUBJECT_12 as _subject on $projection.Subject = _subject.value                   
{
    key system_id as SystemId,
    key class as Class,
    key subject as Subject,
    passing_year as PassingYear,
    student_id as StudentId,
    mark_obtained as MarkObtained,
    lastchangedat as Lastchangedat,
    locallastchangedat as Locallastchangedat,
    _Student
 //   _subject.Description as subject_desc,
 //   _class.Description as class_desc
    
}
