DROP PROCEDURE IF EXISTS loopInsert$$

DELIMITER //
CREATE PROCEDURE loopInsertA()
BEGIN
    DECLARE i INT DEFAULT 6;
    WHILE i <= 10 DO
        INSERT INTO dflix.screenSeat(sseatCol, sseatRow, sseatType, shallno)
        VALUES ("A", i, "장애인석", "1");
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;
call loopInsertA();

DELIMITER //
CREATE PROCEDURE loopInsertB()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 15 DO
        INSERT INTO dflix.screenSeat(sseatCol, sseatRow, sseatType, shallno)
        VALUES ("B", i, "Light석", "1");
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;
call loopInsertB();

DELIMITER //
CREATE PROCEDURE loopInsertC()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 15 DO
        INSERT INTO dflix.screenSeat(sseatCol, sseatRow, sseatType, shallno)
        VALUES ("C", i, "일반석", "1");
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;
call loopInsertC();

DELIMITER //
CREATE PROCEDURE loopInsertD()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 15 DO
        INSERT INTO dflix.screenSeat(sseatCol, sseatRow, sseatType, shallno)
        VALUES ("D", i, "일반석", "1");
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;
call loopInsertD();

DELIMITER //
CREATE PROCEDURE loopInsertE()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 15 DO
        INSERT INTO dflix.screenSeat(sseatCol, sseatRow, sseatType, shallno)
        VALUES ("E", i, "일반석", "1");
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;
call loopInsertE();

DELIMITER //
CREATE PROCEDURE loopInsertF()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 15 DO
        INSERT INTO dflix.screenSeat(sseatCol, sseatRow, sseatType, shallno)
        VALUES ("F", i, "일반석", "1");
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;
call loopInsertF();

DELIMITER //
CREATE PROCEDURE loopInsertG()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 15 DO
        INSERT INTO dflix.screenSeat(sseatCol, sseatRow, sseatType, shallno)
        VALUES ("G", i, "일반석", "1");
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;
call loopInsertG();

DELIMITER //
CREATE PROCEDURE loopInsertH()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 15 DO
        INSERT INTO dflix.screenSeat(sseatCol, sseatRow, sseatType, shallno)
        VALUES ("H", i, "일반석", "1");
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;
call loopInsertH();

DELIMITER //
CREATE PROCEDURE loopInsertI()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 15 DO
        INSERT INTO dflix.screenSeat(sseatCol, sseatRow, sseatType, shallno)
        VALUES ("I", i, "일반석", "1");
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;
call loopInsertI();

DELIMITER //
CREATE PROCEDURE loopInsertJ()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 15 DO
        INSERT INTO dflix.screenSeat(sseatCol, sseatRow, sseatType, shallno)
        VALUES ("J", i, "일반석", "1");
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;
call loopInsertJ();

DELIMITER //
CREATE PROCEDURE loopInsertK()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 5 DO
        INSERT INTO dflix.screenSeat(sseatCol, sseatRow, sseatType, shallno)
        VALUES ("K", i, "일반석", "1");
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;
call loopInsertK();

DELIMITER //
CREATE PROCEDURE loopInsertK1()
BEGIN
    DECLARE i INT DEFAULT 11;
    WHILE i <= 15 DO
        INSERT INTO dflix.screenSeat(sseatCol, sseatRow, sseatType, shallno)
        VALUES ("K", i, "일반석", "1");
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;
call loopInsertK1();

DELIMITER //
CREATE PROCEDURE loopInsertL()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 5 DO
        INSERT INTO dflix.screenSeat(sseatCol, sseatRow, sseatType, shallno)
        VALUES ("L", i, "일반석", "1");
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;
call loopInsertL();

DELIMITER //
CREATE PROCEDURE loopInsertL1()
BEGIN
    DECLARE i INT DEFAULT 12;
    WHILE i <= 15 DO
        INSERT INTO dflix.screenSeat(sseatCol, sseatRow, sseatType, shallno)
        VALUES ("L", i, "일반석", "1");
        SET i = i + 1;
    END WHILE;
END//
DELIMITER ;
call loopInsertL1();

select * from screenSeat;
