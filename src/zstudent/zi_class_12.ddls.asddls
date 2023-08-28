@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'For The Class Purpose'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLASS_12 as select from  DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name:'ZADEXAM_RECORD_DM_CLASS')
{
    key domain_name,
    key value_position,
    @Semantics.language: true
    key language,
    value_low as value,
    @Semantics.text: true
    text as Description
}
