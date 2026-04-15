CLASS zcl_d401_00_02compute_testunit DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d401_00_02compute_testunit IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lo_compute TYPE REF TO lcl_compute.

    CREATE OBJECT lo_compute.

    lo_compute->sum(
      EXPORTING
        iv_value1 = 11
        iv_value2 = 3
      RECEIVING
        rv_result =  DATA(lv_result) ).

    out->write( lv_result ).



  ENDMETHOD.
ENDCLASS.
