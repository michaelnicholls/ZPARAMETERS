@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'writes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity z_i_writes as select from zwrite_output
association to parent z_i_parameters as _params on $projection.Uname = _params.Uname and $projection.Variant = _params.Variant

{
    key uname as Uname,
    key variant as Variant,
    key counter as Counter,
    text as Text,
    _params
    
} where uname = $session.user
