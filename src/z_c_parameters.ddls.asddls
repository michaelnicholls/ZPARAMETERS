@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consulmption'
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity z_c_parameters as projection on z_i_parameters
{
    key Variant,
    key Uname,
    Int1,
    Int2,
    Op,
    Exec_Class,
    Exec_Method,
    /* Associations */
    _writes: redirected to composition child z_c_writes
}
