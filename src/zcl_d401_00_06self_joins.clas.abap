CLASS zcl_d401_00_06self_joins DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d401_00_06self_joins IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*Abb.80

    SELECT FROM /dmo/connection AS a
         INNER JOIN /dmo/connection AS b
            ON a~airport_to_id = b~airport_from_id AND
              a~airport_from_id <> b~airport_to_id
            FIELDS a~airport_from_id, a~carrier_id AS carrier_1, a~connection_id AS conn_1, a~airport_to_id AS via_airport_id,
                                      b~carrier_id AS carrier_2, b~connection_id AS conn_2, b~airport_to_id AS dest_airport_id
              WHERE a~airport_from_id = 'FRA' INTO TABLE @DATA(lt_result).

    out->write( lt_result ).

  ENDMETHOD.
ENDCLASS.
