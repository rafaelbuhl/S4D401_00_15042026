INTERFACE lif_summe.
  METHODS sum IMPORTING iv_value1        TYPE i
                        iv_value2        TYPE i
              RETURNING VALUE(rv_result) TYPE i.
  DATA mv_demo_01 TYPE i.
  CONSTANTS cv_demo_02 TYPE i VALUE 100.
  EVENTS dem_01.
ENDINTERFACE.

INTERFACE lif_diff.
  METHODS diff IMPORTING iv_value1        TYPE i
                         iv_value2        TYPE i
               RETURNING VALUE(rv_result) TYPE i.
ENDINTERFACE.

INTERFACE lif_demo_01.
  INTERFACES lif_summe.

  METHODS dev IMPORTING iv_value1        TYPE i
                        iv_value2        TYPE i
              RETURNING VALUE(rv_result) TYPE i.
ENDINTERFACE.


CLASS lcl_compute1 DEFINITION..

  PUBLIC SECTION.
    INTERFACES lif_summe.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_compute1 IMPLEMENTATION.

  METHOD lif_summe~sum.
    rv_result = iv_value1 + iv_value2.
  ENDMETHOD.

ENDCLASS.


CLASS lcl_compute2 DEFINITION..

  PUBLIC SECTION.
    INTERFACES lif_summe.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_compute2 IMPLEMENTATION.

  METHOD lif_summe~sum.
    rv_result = iv_value1 + iv_value2 + 1.
  ENDMETHOD.

ENDCLASS.

class lcl_compute3 DEFINITION.
    PUBLIC SECTION.
      INTERFACES lif_demo_01.

endclass.

CLASS lcl_compute3 IMPLEMENTATION.

  METHOD lif_demo_01~dev.

  ENDMETHOD.

  METHOD lif_summe~sum.

  ENDMETHOD.

ENDCLASS.
