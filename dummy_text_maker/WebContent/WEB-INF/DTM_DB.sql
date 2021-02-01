--------------------------------------------------------
--  DDL for Table TEXT_DB
--------------------------------------------------------

  CREATE TABLE "DTM_DB"."TEXT_DB" 
   (	"PURPOSE" VARCHAR2(20 BYTE), 
	"CONTENT" VARCHAR2(1000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "DTM_DB"."TEXT_DB"."PURPOSE" IS '용도';
   COMMENT ON COLUMN "DTM_DB"."TEXT_DB"."CONTENT" IS '내용';

   
insert into TEXT_DB VALUES ('전자제품', ' 본체와 AC 어댑터를 물에 적시거나 물을 뿌리지 말아 주십시오. 목욕탕, 탈의실 등의 습기가 많은 장소에서의 사용 및 보관을 말아주십시오. 쇼트, 감전,화재 및 고장의 원인이 됩니다.');
insert into TEXT_DB VALUES ('전자제품', ' 젖은 손으로는 AC 어댑터의 플러그를 꽂거나 뽑지 말아 주십시오. 감전, 부상의 원인이 됩니다.');
insert into TEXT_DB VALUES ('전자제품', '  AC 어댑터의 전원코드나 플러그에 손상이 있거나, 콘센트의 삽입상태가 느슨할 때는 사용하지 말아 주십시오. 감전/쇼트/발화의 원인이 됩니다. ');