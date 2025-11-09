CLASS zdemo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  class-METHODS: init,
  main IMPORTING variant type int4 uname type syst_uname.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zdemo IMPLEMENTATION.
  METHOD init.

  ENDMETHOD.

  METHOD main.

  select single * from zdemo_i_param into @data(params) where uname = @sy-uname and variant = @variant.
  select single max( counter ) into @data(max_count) from zclass_output where class_name = @params-class_name and uname = @sy-uname.

  max_count = max_count + 1.

   modify zclass_output from @( value #(    class_name = params-class_name uname = sy-uname text = 'Hello' counter = max_count  ) ).
   max_count = max_count + 1.
     modify zclass_output from @( value #(    class_name = params-class_name uname = sy-uname text = 'World' counter = max_count  ) ).
  max_count = max_count + 1.
     modify zclass_output from @( value #(    class_name = params-class_name uname = sy-uname text = |{ params-Int1 }| counter = max_count  ) ).

  ENDMETHOD.

ENDCLASS.
