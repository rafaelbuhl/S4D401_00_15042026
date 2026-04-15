*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
"Variante 1
CLASS lcl_singleton DEFINITION CREATE PRIVATE FINAL.

  PUBLIC SECTION.
    CLASS-METHODS class_constructor.
    CLASS-METHODS get_instance RETURNING VALUE(ro_instance) TYPE REF TO lcl_singleton.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA gv_instance TYPE REF TO lcl_singleton.

ENDCLASS.

CLASS lcl_singleton IMPLEMENTATION.

  METHOD class_constructor.
    gv_instance = NEW lcl_singleton(  ).
  ENDMETHOD.

  METHOD get_instance.
*    CHECK gv_instance IS NOT INITIAL.
*    CHECK gv_instance IS BOUND.
    ro_instance = gv_instance.

*      if gv_instance is not INITIAL.
*
*      else.
*
*      endif.



  ENDMETHOD.

ENDCLASS.

"Variante 2
CLASS lcl_singleton1 DEFINITION CREATE PRIVATE FINAL.

  PUBLIC SECTION.
    CLASS-METHODS get_instance RETURNING VALUE(ro_instance) TYPE REF TO lcl_singleton1.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA gv_instance TYPE REF TO lcl_singleton1.

ENDCLASS.

CLASS lcl_singleton1 IMPLEMENTATION.
  METHOD get_instance.
    IF gv_instance IS NOT INITIAL.
      ro_instance = gv_instance.
    ELSE.
      gv_instance = NEW lcl_singleton1(  ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
