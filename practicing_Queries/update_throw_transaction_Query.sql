BEGIN TRANSACTION;

UPDATE master.dbo.Employees 
SET EmployeeEmailAdrress = 'DR@gmail.com' 
WHERE TitleOfCourtesy = 'Dr.';

COMMIT;
