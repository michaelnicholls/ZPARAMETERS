@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity z_i_parameters as select from zparameters
//association to z_i_writes as _writes on _writes.Uname = $projection.Uname and _writes.Variant = $projection.Variant

composition[0..*] of z_i_writes as _writes 
{
    key variant as Variant,
    
    key uname as Uname,
    int1 as Int1,
    int2 as Int2,
    op as Op,
    exec_class as Exec_Class,
    exec_method as Exec_Method,   
     _writes
    
}
