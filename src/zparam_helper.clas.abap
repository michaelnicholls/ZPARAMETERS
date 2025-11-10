CLASS zparam_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.
   class-METHODS:
   clear_output IMPORTING parguid type sysuuid_x16,
    write_line importing parguid type sysuuid_x16 text type string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zparam_helper IMPLEMENTATION.
  METHOD clear_output.
  delete from zclass_output where parguid = parguid.
  ENDMETHOD.

  METHOD write_line.
select single  max( counter )  into @data(max_count) from zclass_output where parguid = @parguid.

modify zclass_output from @( value #(    parguid = parguid text = text counter = max_count + 1  ) ).
  ENDMETHOD.

ENDCLASS.
