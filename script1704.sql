drop table produto cascade constraints; 
drop table produto1 cascade constraints; 
drop table produto2 cascade constraints; 

create table produto (cd_prod NUMBER(9),
                      nm_prod varchar2(55),
                      preco number(6,2));
                      
create table produto1 (cd_prod NUMBER(9),
                      nm_prod varchar2(55),
                      preco number(6,2));
                      
create table produto2 (cd_prod NUMBER(9),
                      nm_prod varchar2(55),
                      preco number(6,2));

begin
    INSERT INTO PRODUTO VALUES (1, 'Água', 1.75);
    INSERT INTO PRODUTO VALUES (2, 'Peixe', 75.00);
    INSERT INTO PRODUTO VALUES (3, 'Feijão', 30.00);
    INSERT INTO PRODUTO VALUES (4, 'Vinho', 79.50);
end;

---

DECLARE
    CURSOR C_MIGRAR IS SELECT * FROM PRODUTO;
    
BEGIN
    For V_MIGRAR in C_MIGRAR loop
       insert into produto1 values (v_migrar.cd_prod, v_migrar.nm_prod, v_migrar.preco);
        
    end loop;
end;

---

begin
    INSERT INTO PRODUTO VALUES (5, 'macarrão', 18.80);
    INSERT INTO PRODUTO VALUES (6, 'óleo', 14.60);
    INSERT INTO PRODUTO1 VALUES (7, 'azeite', 35.80);
    INSERT INTO PRODUTO1 VALUES (8, 'carvão', 40.60);
end;

---

DECLARE
    CURSOR C_MIGRAR_UN IS SELECT * FROM PRODUTO;
BEGIN
    For V_MIGRAR_UN in C_MIGRAR_UN loop
       insert into produto2 values (v_migrar.cd_prod, v_migrar.nm_prod, v_migrar.preco);
        
    end loop;
end;

---

drop table produtos cascade constraints;

create table produtos (nm_prod varchar2(55),
                       categoria varchar2(55),
                       preco NUMBER(6,2));

begin   
    INSERT INTO PRODUTOS VALUES ('CANETA', 'A', 1.50);
    INSERT INTO PRODUTOS VALUES ('CADERNO', 'A', 15.99);
    INSERT INTO PRODUTOS VALUES ('LAPIS', 'A', 0.99);
    INSERT INTO PRODUTOS VALUES ('MOCHILA', 'B', 60.99);
    INSERT INTO PRODUTOS VALUES ('MALETA', 'B', 45.90);
    INSERT INTO PRODUTOS VALUES ('VASSOURA', 'C', 13.40);
    INSERT INTO PRODUTOS VALUES ('RODO', 'C', 15.80);
    INSERT INTO PRODUTOS VALUES ('BALDE', 'C', 9.50); 
end;

DECLARE
    CURSOR C_ATT_PRECO IS SELECT * FROM PRODUTOS;
BEGIN
    For V_ATT_PRECO in C_ATT_PRECO loop
       IF V_ATT_PRECO.CATEGORIA = 'A' THEN
            UPDATE PRODUTOS SET PRECO = PRECO * 0.95 WHERE NM_PROD = V_ATT_PRECO.NM_PROD;
        ELSIF V_ATT_PRECO.CATEGORIA = 'B' THEN
             UPDATE PRODUTOS SET PRECO = PRECO * 0.90 WHERE NM_PROD = V_ATT_PRECO.NM_PROD;
        ELSE
            UPDATE PRODUTOS SET PRECO = PRECO * 0.85 WHERE NM_PROD = V_ATT_PRECO.NM_PROD;
        END IF;
        
    end loop;
end;

---

DROP TABLE BOLETIM CASCADE CONSTRAINTS;

CREATE TABLE BOLETIM (NOME_ALU VARCHAR2(55),
                      NOME_DISC VARCHAR2(55),
                      NOTA1 NUMBER(4,2),
                      NOTA2 NUMBER(4,2),
                      NOTA3 NUMBER(4,2),
                      FALTAS NUMBER(5),
                      C_HORA NUMBER(9),
                      MEDIA NUMBER(4,2),
                      SITUACAO VARCHAR2(55));
                      
BEGIN
    INSERT INTO BOLETIM VALUES ('MARCEL', 'DBA', 10, 10, 10, 0, 80, NULL, NULL);
    INSERT INTO BOLETIM VALUES ('MARCEL', 'IA', 6, 7.5, 8.5, 80, 80, NULL, NULL);
    INSERT INTO BOLETIM VALUES ('MARCEL', 'IOT', 1, 1, 1, 1, 60, NULL, NULL);
    INSERT INTO BOLETIM VALUES ('MARCEL', 'QA', 5, 5, 5, 6, 60, NULL, NULL);
    INSERT INTO BOLETIM VALUES ('MARCEL', 'JAVA', 1, 1, 1, 40, 60, NULL, NULL);
    
    COMMIT;
END;








