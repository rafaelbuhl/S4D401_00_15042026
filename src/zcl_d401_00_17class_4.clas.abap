CLASS zcl_d401_00_17class_4 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d401_00_17class_4 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lv_class TYPE string.

    lv_class = 'LCL_COMPUTE2'.


    DATA lo_summe TYPE REF TO lif_summe.

    CREATE OBJECT lo_summe TYPE (lv_class).

      out->write( lo_summe->sum(
                    iv_value1 = 100
                    iv_value2 = 200
                  )  ).




*"Variante 2
*    DATA lo_compute TYPE REF TO lcl_compute.
*    lo_compute = NEW #(  ).
*
*    DATA(lv_result) = lo_compute->lif_summe~sum(
*                        iv_value1 = 100
*                        iv_value2 = 200
*                      ).
*
*
*    out->write( lv_result ).



  ENDMETHOD.
ENDCLASS.
