CLASS zdemo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  class-METHODS: init,
  main IMPORTING parguid type sysuuid_x16.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zdemo IMPLEMENTATION.
  METHOD init.

  ENDMETHOD.

  METHOD main.
 " get the parameters
  select single * from zdemo_i_param into @data(params) where parguid = @parguid.
"delete old outputs
  delete from zclass_output WHERE parguid = params-parguid.
  " get the next line to write
  select single  max( counter )  into @data(max_count) from zclass_output where parguid = @parguid.
  data(next_line) = max_count + 1.

  data result type p length 9 decimals 2.
  data status type string.
  data(prefix) = |The result of { params-int1 } { params-op } { params-int2 } is |.

  case params-Op.
  when '+'. result = params-Int1 + params-Int2.
  when '-'. result = params-Int1 - params-Int2.
  when '*'. result = params-Int1 * params-Int2.
  when '/'. if params-int2 = 0. status = 'No division by zero'. else. result = params-Int1 / params-Int2. ENDIF.
  when OTHERS. status = |Bad or missing operator|.
  ENDCASE.


  if status is INITIAL.
   modify zclass_output from @( value #(    parguid = params-parguid text = |{ prefix } { result }| counter = next_line  ) ).
   else.
   modify zclass_output from @( value #(    parguid = params-parguid text = |{ status }| counter = next_line  ) ).
   endif.
   next_line = next_line + 1.

  ENDMETHOD.

ENDCLASS.
