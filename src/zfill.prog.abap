*&---------------------------------------------------------------------*
*& Report zfill
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfill.

data sometext type table of zwrite_output.

sometext = value #(
( uname = sy-uname counter = 10 variant = 'var2' text = 'Hello' )
( uname = sy-uname counter = 20 variant = 'var2' text = 'World' )
( uname = 'FRED' counter = 10 variant = 'var2' text = 'Hello' )

 ).

MODIFY  zwrite_output from table @sometext.
