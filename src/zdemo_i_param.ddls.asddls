@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'params'
@Metadata.ignorePropagatedAnnotations: true
@UI: {headerInfo.title.value: 'class_description'}
define root view entity zdemo_i_param as select from zdemo_param
composition[0..*] of z_i_class_output as _outputs
{
     
     @UI.facet: [{ id: 'details', purpose: #STANDARD, position: 10, label: 'Details', type:  #IDENTIFICATION_REFERENCE}]
     @UI.identification: [{ position: 10,type: #FOR_ACTION, dataAction: 'execute', label: 'Execute' }]
     @UI.hidden: true
     key parguid,
     @UI.identification: [{position: 10, label: 'Variant'}]
    @UI.lineItem: [{position: 10, label: 'Variant'}]
    
    variant as Variant,
    @UI.hidden: true
    uname,
     @UI.lineItem: [{position: 5, label: 'Description'}]
    'demo class' as class_description,
    'ZDEMO' as class_name,
     @UI.identification: [{position: 20, label: 'Integer1'}]
    @UI.lineItem: [{position: 20, label: 'Integer1'}]
    
    int1 as Int1,
        @UI.identification: [{position: 30, label: 'Integer2'}]
    @UI.lineItem: [{position: 30, label: 'Integer2'}]
    int2 as Int2,
        @UI.identification: [{position: 40, label: 'Operator'}]
    @UI.lineItem: [{position: 40, label: 'Operator'}]
    op as Op,
    _outputs
} 
where uname = $session.user
