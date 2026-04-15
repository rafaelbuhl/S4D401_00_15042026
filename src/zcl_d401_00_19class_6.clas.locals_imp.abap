CLASS lcl_plane DEFINITION ABSTRACT.

  PUBLIC SECTION.
    METHODS display_attributes IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS lcl_plane IMPLEMENTATION.

  METHOD display_attributes.
    out->write( 'Implementierung aus der Klasse: lcl_plane' ).
  ENDMETHOD.
ENDCLASS.


CLASS lcl_cargo_plane DEFINITION INHERITING FROM lcl_plane.
  PUBLIC SECTION.
    METHODS display_attributes REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS lcl_cargo_plane IMPLEMENTATION.
  METHOD display_attributes.
  super->display_attributes( out = out ).
   out->write( 'Implementierung aus der Klasse: lcl_cargo_plane' ).
  ENDMETHOD.
ENDCLASS.


CLASS lcl_passenger_plane DEFINITION INHERITING FROM lcl_plane.

  PUBLIC SECTION.
    METHODS display_attributes REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_passenger_plane IMPLEMENTATION.
  METHOD display_attributes.
   super->display_attributes( out = out ).
   out->write( 'Implementierung aus der Klasse: lcl_passenger_plane' ).
  ENDMETHOD.

ENDCLASS.
