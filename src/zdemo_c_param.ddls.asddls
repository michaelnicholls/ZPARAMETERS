@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consumption'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zdemo_c_param as projection on zdemo_i_param
{
    key parguid,
    Uname,
    class_description,
    Int1,
    Int2,
    Op
}
