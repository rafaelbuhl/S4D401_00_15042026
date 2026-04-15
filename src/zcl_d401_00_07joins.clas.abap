CLASS zcl_d401_00_07joins DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d401_00_07joins IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM /dmo/carrier as a INNER JOIN /dmo/connection
       ON a~carrier_id = /dmo/connection~carrier_id
          FIELDS
                 a~name as banane,
                 a~currency_code as birne,
                 /dmo/connection~carrier_id,
                 /dmo/connection~connection_id,
                 airport_from_id,
                 /dmo/connection~airport_to_id
       INTO TABLE @DATA(lt_result).


    out->write( lt_result ).





  ENDMETHOD.
ENDCLASS.
