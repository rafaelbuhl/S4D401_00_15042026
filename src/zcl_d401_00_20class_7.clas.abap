CLASS zcl_d401_00_20class_7 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d401_00_20class_7 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_singleton_1) = lcl_singleton=>get_instance( ).
    ...
    DATA(lo_singleton_2) = lcl_singleton=>get_instance( ).
    DATA(lo_singleton_3) = lcl_singleton=>get_instance( ).
    DATA(lo_singleton_4) = lcl_singleton=>get_instance( ).
    DATA(lo_singleton_5) = lcl_singleton=>get_instance( ).
    DATA(lo_singleton_6) = lcl_singleton=>get_instance( ).


DATA(lo_singleton1) = lcl_singleton1=>get_instance( ).
    ...
    lo_singleton1 = lcl_singleton1=>get_instance( ).
    lo_singleton1 = lcl_singleton1=>get_instance( ).
    lo_singleton1 = lcl_singleton1=>get_instance( ).
    lo_singleton1 = lcl_singleton1=>get_instance( ).
    lo_singleton1 = lcl_singleton1=>get_instance( ).



  ENDMETHOD.
ENDCLASS.
