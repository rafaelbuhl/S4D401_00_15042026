*"* use this source file for your ABAP unit test classes
CLASS ltcl_cumpute DEFINITION FINAL FOR TESTING
  DURATION MEDIUM
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      sum_test1 FOR TESTING.  " RAISING cx_static_check.
    METHODS:
      sum_test2 FOR TESTING.  " RAISING cx_static_check.


ENDCLASS.

  "    demo_=@kunde.de

CLASS ltcl_cumpute IMPLEMENTATION.

  METHOD sum_test1.

    DATA lo_compute TYPE REF TO lcl_compute.

    CREATE OBJECT lo_compute.


    cl_abap_unit_assert=>assert_bound(
      EXPORTING
        act              = lo_compute
        msg              = 'Das Objekt konnte nicht erstellt werden!' ).


    DATA(lv_result)  = lo_compute->sum(
                         iv_value1 = 5
                         iv_value2 = 11 ).

    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lv_result
        exp                  = 16 ).



  ENDMETHOD.

  METHOD sum_test2.

    DATA lo_compute TYPE REF TO lcl_compute.

    CREATE OBJECT lo_compute.

    DATA(lv_result)  = lo_compute->sum(
                         iv_value1 = -10
                         iv_value2 = 11 ).


    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lv_result
        exp                  = 1 ).


  ENDMETHOD.

ENDCLASS.
