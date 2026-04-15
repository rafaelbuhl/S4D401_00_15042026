CLASS zcl_d401_00_03time DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d401_00_03time IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA(lv_utclong) = utclong_current(  ).

    out->write( lv_utclong ).






  ENDMETHOD.
ENDCLASS.
