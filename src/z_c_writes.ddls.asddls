@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity z_c_writes as projection on z_i_writes
{
    key Uname,
    key Variant,
    key Counter,
    Text,
    /* Associations */
    _params  : redirected to parent z_c_parameters
}
