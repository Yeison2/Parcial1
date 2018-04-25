--------------------------------------------------------
-- Archivo creado  - miércoles-abril-25-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."CUSTOMERS" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255), 
	"COUNTRY" VARCHAR2(255), 
	"GRADE" NUMBER(*,0), 
	"SALESMAN_ID" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."ORDERS" 
   (	"ID" NUMBER(*,0), 
	"AMOUNT" NUMBER(8,2), 
	"ORDER_DATE" DATE, 
	"CUSTOMER_ID" NUMBER(*,0), 
	"SALESMAN_ID" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table SALESMAN
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."SALESMAN" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255), 
	"COUNTRY" VARCHAR2(255), 
	"COMMISSION" NUMBER(5,2)
   )
--------------------------------------------------------
--  DDL for View VIEW_1
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIOS"."VIEW_1" ("ORDERS_ID", "PURCHASE_AMOUNT", "CUSTOMERS_NAME", "COUNTRIES") AS 
  SELECT 
    ORDERS.ID AS ORDERS_ID,
    ORDERS.AMOUNT AS PURCHASE_AMOUNT,
    CUSTOMERS.NAME AS CUSTOMERS_NAME,
    CUSTOMERS.COUNTRY AS COUNTRIES
  FROM ORDERS
   INNER JOIN CUSTOMERS ON ORDERS.CUSTOMER_ID = CUSTOMERS.ID
   WHERE AMOUNT BETWEEN 500 AND 2000
   ORDER BY AMOUNT
--------------------------------------------------------
--  DDL for View VIEW_3
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIOS"."VIEW_3" ("CUSTOMERS_ID", "CUSTOMERS_NAME", "SALESMAN_ID", "SALESMAN_NAME") AS 
  SELECT 
    CUSTOMERS.ID AS CUSTOMERS_ID,
    CUSTOMERS.NAME AS CUSTOMERS_NAME,
    SALESMAN.ID AS SALESMAN_ID,
    SALESMAN.NAME AS SALESMAN_NAME
  FROM CUSTOMERS
   INNER JOIN SALESMAN ON CUSTOMERS.SALESMAN_ID = SALESMAN.ID
   WHERE  CUSTOMERS.NAME <> '' OR CUSTOMERS.NAME = ' '
   ORDER BY CUSTOMERS.NAME ASC
--------------------------------------------------------
--  DDL for Index SYS_C007003
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."SYS_C007003" ON "EJERCICIOS"."SALESMAN" ("ID")
--------------------------------------------------------
--  DDL for Index SYS_C007004
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."SYS_C007004" ON "EJERCICIOS"."CUSTOMERS" ("ID")
--------------------------------------------------------
--  DDL for Index SYS_C007006
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."SYS_C007006" ON "EJERCICIOS"."ORDERS" ("ID")
--------------------------------------------------------
--  Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."CUSTOMERS" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."ORDERS" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Constraints for Table SALESMAN
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."SALESMAN" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."CUSTOMERS" ADD CONSTRAINT "SALESMAN_FK" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "EJERCICIOS"."SALESMAN" ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."ORDERS" ADD CONSTRAINT "CUSTOMER_ORDER_FK" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "EJERCICIOS"."CUSTOMERS" ("ID") ENABLE
  ALTER TABLE "EJERCICIOS"."ORDERS" ADD CONSTRAINT "SALESMAN_ORDER_FK" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "EJERCICIOS"."SALESMAN" ("ID") ENABLE
