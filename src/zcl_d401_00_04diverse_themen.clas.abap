CLASS zcl_d401_00_04diverse_themen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d401_00_04diverse_themen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*Abb.127

    DATA: BEGIN OF st_demo_01,
            col1 TYPE i,
            col2 TYPE i,
            col3 TYPE i,
            col4 TYPE i.
    DATA: END OF st_demo_01.

    DATA lt_demo_01 LIKE TABLE OF st_demo_01.



    DATA: BEGIN OF st_demo_02,
            col1_s1 TYPE i,
            col2_s1 TYPE i,
            col3_s1 TYPE i,
            col4_s1 TYPE i.
    DATA: END OF st_demo_02.

    DATA lt_demo_02 LIKE TABLE OF st_demo_02.

    st_demo_02-col1_s1 = 100.
    st_demo_02-col2_s1 = 200.
    st_demo_02-col3_s1 = 300.
    st_demo_02-col4_s1 = 400.
    APPEND st_demo_02 TO lt_demo_02.

    st_demo_02-col1_s1 = 1000.
    st_demo_02-col2_s1 = 2000.
    st_demo_02-col3_s1 = 3000.
    st_demo_02-col4_s1 = 4000.
    APPEND st_demo_02 TO lt_demo_02.

    st_demo_02-col1_s1 = 10000.
    st_demo_02-col2_s1 = 20000.
    st_demo_02-col3_s1 = 30000.
    st_demo_02-col4_s1 = 40000.
    APPEND st_demo_02 TO lt_demo_02.


    DATA lv_value1 TYPE i VALUE 333.


    FIELD-SYMBOLS <fs> TYPE i.
    ASSIGN lv_value1 TO <fs>.



    lt_demo_01 = VALUE #( FOR <banane> IN lt_demo_02                  "Variante 1
                                        WHERE ( col1_s1 = 100  )
                         ( col1 = <banane>-col1_s1 + 22
                           col2 = <fs> + 78
                           col3 = <banane>-col3_s1 + 22
                           col4 = <banane>-col4_s1 + 22 )
*                         ( col1 = <banane>-col1_s1 + 11
*                           col2 = <fs> + 78
*                           col3 = <banane>-col3_s1 + 11
*                           col4 = <banane>-col4_s1 + 11 )

                         ).

    out->write( lt_demo_01 ).

    CLEAR lt_demo_01.
    LOOP AT lt_demo_02 INTO DATA(ls_demo_02) where col1_s1 = 100.                          "VAriante 2

      st_demo_01-col1 = ls_demo_02-col1_s1 + 22.
      st_demo_01-col2 = <fs> + 78.
      st_demo_01-col3 = ls_demo_02-col3_s1 + 22.
      st_demo_01-col4 = ls_demo_02-col4_s1 + 22.
      APPEND st_demo_01 TO lt_demo_01.

*      st_demo_01-col1 = ls_demo_02-col1_s1 + 11.
*      st_demo_01-col2 = <fs> + 78.
*      st_demo_01-col3 = ls_demo_02-col3_s1 + 11.
*      st_demo_01-col4 = ls_demo_02-col4_s1 + 11.
*      APPEND st_demo_01 TO lt_demo_01.


    ENDLOOP.


    out->write( lt_demo_01 ).









**Frage 5 Seite 238
*    SELECT SINGLE FROM /lrn/carrier FIELDS substring( 'ABCDE', 1,1 ) AS demo_1, left( 'ABCDE',1  ) AS demo2
*           INTO @DATA(ls_result).
*
*    out->write( ls_result ).
*
*




* "Abb.113,115
*    SELECT FROM /dmo/flight FIELDS carrier_id, COUNT( * ) AS counter,
*      COUNT( DISTINCT ( connection_id ) ) AS connection, sum( price   ) as sum
*        GROUP BY carrier_id  INTO TABLE @DATA(lt_result).
*
*    out->write(  lt_result ).

    ...






*    SELECT FROM /dmo/flight FIELDS carrier_id, connection_id, COUNT( * ) AS counter, sum( price   ) as sum
*
*         GROUP BY carrier_id, connection_id  INTO TABLE @DATA(lt_result).
*
*    out->write(  lt_result ).






*    SELECT FROM /dmo/connection FIELDS carrier_id, connection_id, COUNT( * ) AS counter,
**                 MAX( distance   ) as distance, avg( distance as DEC( 5,2 ) ) AS avg1
*                 MAX( distance   ) as distance, avg( distance ) AS avg1
*         GROUP BY carrier_id, connection_id  INTO TABLE @DATA(lt_result).
*
*    out->write(  lt_result ).





*    SELECT FROM /dmo/connection FIELDS carrier_id, COUNT( * ) AS counter, MAX( distance   ) AS distance
*         GROUP BY carrier_id  INTO TABLE @DATA(lt_result).
*
*    out->write(  lt_result ).




*    SELECT FROM /dmo/connection FIELDS COUNT( * ) as counter, max( distance   ) as distance
*        WHERE carrier_id = 'aaa'   INTO @DATA(ls_result).
*
*    out->write(  sy-subrc ).
*    out->write(  ls_result ).



*   data lv_demo_01 type dec LENGTH 3 DECIMALS 2.


** Abb.83 Right outer Join
*    SELECT FROM /dmo/carrier  right OUTER JOIN /dmo/connection       "Tabellen
*          ON /dmo/carrier~carrier_id = /dmo/connection~carrier_id   "Join
*      FIELDS /dmo/carrier~carrier_id,                               "Felder aus beiden Tabellen
*             name,
*             currency_code,
*             airport_from_id,
*             airport_to_id
*        WHERE  /dmo/connection~airport_from_id is null              "Flugverbindungen ohne Fluggesellschaft
*     INTO TABLE @DATA(lt_result).
*
*    out->write(   data = lt_result
*                  name = CONV string( sy-dbcnt ) ).
*



** Abb.82 Left outer Join
*    SELECT FROM /dmo/carrier  LEFT OUTER JOIN /dmo/connection       "Tabellen
*          ON /dmo/carrier~carrier_id = /dmo/connection~carrier_id   "Join
*      FIELDS /dmo/carrier~carrier_id,                               "Felder aus beiden Tabellen
*             name,
*             currency_code,
*             airport_from_id,
*             airport_to_id
*        WHERE  /dmo/connection~airport_from_id is null              "Fluggesellschaften ohne Flugverbindung
*     INTO TABLE @DATA(lt_result).
*
*    out->write(   data = lt_result
*                  name = CONV string( sy-dbcnt ) ).


** Abb.81 Inner Join
*    SELECT FROM /dmo/carrier  INNER JOIN /dmo/connection            "Tabellen
*          ON /dmo/carrier~carrier_id = /dmo/connection~carrier_id   "Join
*      FIELDS /dmo/carrier~carrier_id,                               "Felder aus beiden Tabellen
*             name,
*             currency_code,
*             airport_from_id,
*             airport_to_id
*        WHERE  /dmo/carrier~carrier_id = 'LH'
*     INTO TABLE @DATA(lt_result).
*
*    out->write( lt_result ).





*    DATA lv_demo_10 TYPE d.
*    DATA lv_demo_11 TYPE t.
*    DATA lv_demo_12 TYPE string.
*
*     lv_demo_12 = 'Demo_Text'(004).
*     lv_demo_12 = text-004.
*
*
*
*    lv_demo_10 = sy-datum.
*    lv_demo_10 = cl_abap_context_info=>get_system_date( ).
*    lv_demo_11 = sy-uzeit.
*    lv_demo_11 = cl_abap_context_info=>get_system_time( ).
*
*    DATA lv_demo_06 TYPE c LENGTH 10.  "Variante 1
*    DATA lv_demo_07(10) TYPE c.        "Variante 2
*    DATA lv_demo_08(10).               "Variante 3
*    DATA lv_demo_09.                   "CHAR(1)
*
*    DATA lv_demo_01 TYPE string.
*    DATA lv_demo_02 TYPE string.
*    DATA lv_demo_03 TYPE string.
*
*    lv_demo_01 = 'Demo_1_DE'(001).
*    lv_demo_02 = 'Demo_2_DE'(002).
*    lv_demo_03 = 'Demo_3_DE'(003).
*
*
*    lv_demo_01 = TEXT-001.
*    lv_demo_02 = TEXT-002.
*
*
*
*    out->write( lv_demo_01 ).
*    out->write( lv_demo_02 ).
*
*
*
*

*    "Abb.56
*    DATA(lv_demo_01) = utclong_current(  ).
*    out->write( lv_demo_01 ).
*
*
*    data lv_zone type c LENGTH 6.
*
*     lv_zone = 'CET'.
*     lv_zone = 'UTC+1'.
*     lv_zone = 'EST'.
*
*    TRY.
**        CONVERT UTCLONG lv_demo_01 TIME ZONE cl_abap_context_info=>get_user_time_zone( )
*        CONVERT UTCLONG lv_demo_01 TIME ZONE lv_zone
*              INTO DATE DATA(lv_date) TIME DATA(lv_time).
*      CATCH cx_root.
*    ENDTRY.
*
*    out->write( cl_abap_context_info=>get_user_time_zone( )  ).
*
*
*    out->write( lv_date ).
*    out->write( lv_time ).
*



    "Abb.54

*    DATA(lv_demo_01) = utclong_current(  ).
**      lv_demo_01 = lv_demo_01 + 1.   "Fehler
*    out->write( lv_demo_01 ).
*    lv_demo_01 = utclong_add(
*                   val     = lv_demo_01
*                   days    = 7
*                   hours   = 1 ).
*
*    out->write( lv_demo_01 ).
*






*    "Abb. 50
*    DATA lv_demo_01 TYPE d.
*    DATA lv_demo_02 TYPE d.
*
*    lv_demo_01 = cl_abap_context_info=>get_system_date( ).
*    lv_demo_02 = cl_abap_context_info=>get_system_date( )  + 300.
*    " date
*    " 20270101
*    " 20270102
*    " 20270103
*    " 20270204
*    DATA(lv_demo_03) = lv_demo_02+0(6) && '%'.  "für ... where date Like  '202701%' "ANSI SQL
*
*    DATA lv_demo_04 TYPE string VALUE '123456789ABCDEF'.
*    lv_demo_04 = lv_demo_04+5(6).
*
*    out->write( lv_demo_04 ).
*
*
*
*    out->write( lv_demo_03 ).
*
*    out->write( lv_demo_01  ).

*    out->write( lv_demo_02 - lv_demo_01   ).





*    DATA lv_demo_01 TYPE d.
*
*    TRY.
*        lv_demo_01 =  EXACT #(  '20260340' ).
*      CATCH cx_root INTO DATA(lx_root).
*        out->write( lx_root->get_text(  ) ).
*    ENDTRY.
*
*
*
*
*    out->write(  lv_demo_01 ).





*    DATA lv_connection TYPE n LENGTH 4 VALUE 'A400'.
**    DATA lv_connection TYPE string VALUE 'A400'.
*
*    SELECT SINGLE FROM /dmo/connection FIELDS * WHERE carrier_id = 'LH' AND connection_id = @lv_connection
*       INTO @DATA(ls_result).
*    IF sy-subrc = 0.
*      out->write( ls_result ).
*    ELSE.
*      out->write( 'no result' ).
*    ENDIF.





*    DATA lv_demo_01 TYPE d.
*
*    lv_demo_01 = '20260318'.
*
*
*    out->write( lv_demo_01  ).
*
*    lv_demo_01 = 3652060.
*
*    out->write( lv_demo_01  ).





*    lv_demo_01 = sy-datum .
*
*    lv_demo_01 = lv_demo_01 + 7.
*    out->write( lv_demo_01  ).




*    DATA lv_demo_01 TYPE string.
*    DATA lv_demo_02 TYPE i.
*    DATA lv_demo_03 TYPE p LENGTH 3 DECIMALS 2.   "-999.99 bis 999.99  3*2-1 = 5
*
*
*    lv_demo_03 = '123.45-'.
*    lv_demo_03 = `123.45-`.
*
*
*    lv_demo_01 = 'A12345'.
**    lv_demo_02 = lv_demo_01.
*
*
*    out->write( lv_demo_02  ).
*    out->write( lv_demo_03  ).





  ENDMETHOD.
ENDCLASS.
