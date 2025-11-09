CLASS lhc_zdemo_i_param DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zdemo_i_param RESULT result.
    METHODS setuser FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zdemo_i_param~setuser.
    METHODS execute FOR MODIFY
      IMPORTING keys FOR ACTION zdemo_i_param~execute.


ENDCLASS.

CLASS lhc_zdemo_i_param IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD setUser.
  DATA lt_items_upd TYPE TABLE FOR UPDATE zdemo_i_param.
  lt_items_upd = CORRESPONDING #( keys ).
  select single max( variant ) INTO @data(maxvar) from zdemo_param WHERE uname = @sy-uname." GROUP BY variant .
  loop at lt_items_upd ASSIGNING FIELD-SYMBOL(<ls_items_upd>).
  <ls_items_upd>-Uname = sy-uname.
  <ls_items_upd>-Variant = maxvar + 1.
  ENDLOOP.
  modify entity IN LOCAL MODE zdemo_i_param UPDATE FIELDS ( Uname Variant ) with lt_items_upd REPORTED data(ls_reported).
  reported = CORRESPONDING #( DEEP ls_reported ).
  ENDMETHOD.


  METHOD execute.
  READ ENTITY IN LOCAL MODE zdemo_i_param ALL FIELDS WITH CORRESPONDING #( keys ) RESULT DATA(lt_params).
  loop at lt_params ASSIGNING FIELD-SYMBOL(<ls_params>).
  select single * into @data(class_details)
    from zdemo_i_param  where parguid = @<ls_params>-parguid.
    call method (class_details-class_name)=>main EXPORTING uname = class_details-uname variant = class_details-variant .
  endloop.


  ENDMETHOD.

ENDCLASS.
