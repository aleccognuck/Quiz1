
CREATE DATABASE quiz;
GO

USE quiz;
GO

CREATE TABLE SCHOOL (
    SchoolId INT IDENTITY PRIMARY KEY,
    SchoolName VARCHAR(50) NOT NULL,
    Description VARCHAR(1000), 
    Address VARCHAR(50),       
    Phone VARCHAR(50),
    PostCode VARCHAR(50),
    PostAddress VARCHAR(50)
);


CREATE TABLE CLASS (
    ClassId INT IDENTITY PRIMARY KEY,
    SchoolId INT NOT NULL,
    ClassName VARCHAR(50) NOT NULL,
    Description VARCHAR(1000),
    FOREIGN KEY (SchoolId) REFERENCES SCHOOL(SchoolId)
);


CREATE PROCEDURE Consulta
    @id INT
AS
BEGIN
    SELECT * FROM SCHOOL WHERE SchoolId = @id;
END;
GO


CREATE PROCEDURE Insertar
    @SchoolName VARCHAR(50),
    @Description VARCHAR(1000),
    @Address VARCHAR(50),
    @Phone VARCHAR(50),
    @PostCode VARCHAR(50),
    @PostAddress VARCHAR(50)
AS
BEGIN
    INSERT INTO SCHOOL (SchoolName, Description, Address, Phone, PostCode, PostAddress)
    VALUES (@SchoolName, @Description, @Address, @Phone, @PostCode, @PostAddress);
END;
GO


CREATE PROCEDURE Borrar
    @SchoolId INT
AS
BEGIN
    DELETE FROM SCHOOL WHERE SchoolId = @SchoolId;
END;
GO


CREATE PROCEDURE Modificar
    @SchoolId INT,
    @SchoolName VARCHAR(50),
    @Description VARCHAR(1000),
    @Address VARCHAR(50),
    @Phone VARCHAR(50),
    @PostCode VARCHAR(50),
    @PostAddress VARCHAR(50)
AS
BEGIN
    UPDATE SCHOOL
    SET SchoolName = @SchoolName,
        Description = @Description,
        Address = @Address,
        Phone = @Phone,
        PostCode = @PostCode,
        PostAddress = @PostAddress
    WHERE SchoolId = @SchoolId;
END;
GO


CREATE PROCEDURE AddClass
    @SchoolId INT,
    @name VARCHAR(50),
    @descripcion VARCHAR(1000)
AS
BEGIN
    INSERT INTO CLASS (SchoolId, ClassName, Description)
    VALUES (@SchoolId, @name, @descripcion);
END;
GO


CREATE PROCEDURE DeleteClass
    @id INT
AS
BEGIN
    DELETE FROM CLASS WHERE ClassId = @id;
END;
GO


CREATE PROCEDURE EditClass
    @id INT,
    @SchoolId INT,
    @name VARCHAR(50),
    @descripcion VARCHAR(1000)
AS
BEGIN
    UPDATE CLASS
    SET SchoolId = @SchoolId,
        ClassName = @name,
        Description = @descripcion
    WHERE ClassId = @id;
END;
GO


EXEC Consulta @id = 1;
EXEC Insertar @SchoolName = 'Hispanoamericana', @Description = 'no se', @Address = 'Puntarenas', @Phone = '8293 9239', @PostCode = '9011', @PostAddress = '0011';
EXEC Borrar @SchoolId = 1;
EXEC Modificar @SchoolId = 2, @SchoolName = 'Hispanoamericana', @Description = 'no se', @Address = 'Puntarenas', @Phone = '8293 9239', @PostCode = '9011', @PostAddress = '0011';
EXEC AddClass @SchoolId = 2, @name = 'Math', @descripcion = 'Mathematics class';
EXEC DeleteClass @id = 1;
EXEC EditClass @id = 2, @SchoolId = 2, @name = 'Physics', @descripcion = 'Physics class';
