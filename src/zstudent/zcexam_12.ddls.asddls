@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumpution View for Exam'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZCEXAM_12 as projection on ZIEXAMRESULT_12 as EXAM
{
    key SystemId,
    key Class,
    key Subject,
    PassingYear,
    StudentId,
    MarkObtained,
    Lastchangedat,
    Locallastchangedat,
   // subject_desc,
   // class_desc,
    /* Associations */
    _Student: redirected to parent ZCSTUDENT12
}
