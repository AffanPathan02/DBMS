CREATE TABLE lib_tab(book_name VARCHAR2(25),status VARCHAR2(15));
CREATE TABLE library_audit(date_modified DATE, book_name VARCHAR2(25),old_status VARCHAR(15),new_status VARCHAR2(15),action VARCHAR2(25));


INSERT INTO lib_tab VALUES('LOTR','AVAILABLE');
INSERT INTO lib_tab VALUES('Silmarillion','UNAVAILABLE');
INSERT INTO lib_tab VALUES('Harry Potter','AVAILABLE');
INSERT INTO lib_tab VALUES('Bat-MAN','UNAVAILABLE');
INSERT INTO lib_tab VALUES('Jumanji','AVAILABLE');
*/

CREATE OR REPLACE TRIGGER trigger_1 
AFTER UPDATE OR DELETE ON lib_tab FOR EACH ROW
ENABLE
	DECLARE
		aud_bookname lib_tab.book_name%TYPE;
	BEGIN
		IF UPDATING THEN
			aud_bookname := :OLD.book_name;
			dbms_output.put_line(:OLD.status);
			INSERT INTO library_audit VALUES (SYSDATE,aud_bookname,:OLD.status,:NEW.status,'UPDATE');
		ELSE
			dbms_output.put_line(:OLD.book_name||'deleting');
			INSERT INTO library_audit VALUES(SYSDATE,:OLD.book_name,:OLD.status,NULL,'DELETE');
		END IF;
	END;
/
