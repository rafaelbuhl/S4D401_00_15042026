CLASS zcl_d401_00_19class_6 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d401_00_19class_6 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lt_collection TYPE TABLE OF REF TO lcl_plane.
    DATA lo_cargo_plane TYPE REF TO lcl_cargo_plane.
    DATA lo_passenger_plane TYPE REF TO lcl_passenger_plane.

    lo_cargo_plane = NEW #(  ).
    lo_passenger_plane = NEW #(  ).

    APPEND lo_cargo_plane TO lt_collection.       "Up Cast
    APPEND lo_passenger_plane TO lt_collection.   "Up Cast


    LOOP AT lt_collection INTO DATA(lo_plane).

      lo_plane->display_attributes( out = out ).

    ENDLOOP.







  ENDMETHOD.
ENDCLASS.
