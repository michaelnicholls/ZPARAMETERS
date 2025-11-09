@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'composition'
@Metadata.ignorePropagatedAnnotations: true
define view entity z_c_class_output as projection on z_i_class_output

{
    key Parguid,
   @UI.identification: [{position: 10, label: 'Line number'}]
    @UI.lineItem: [{position: 10, label: 'Line number'}]
    key Counter,
    @UI.identification: [{position: 20, label: 'Text'}]
    @UI.lineItem: [{position: 20, label: 'Text'}]
    Text,
    /* Associations */
    _params : redirected to parent zdemo_c_param
}
