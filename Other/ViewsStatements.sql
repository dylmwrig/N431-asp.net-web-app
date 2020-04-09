--Check to see all the free programs
CREATE VIEW FreePrograms AS
SELECT ProgramCost.value as ProgramCostValue, [progID], [userID], [name], [acronym], 
[contactID], [progLocID], [fieldID], [gradesID], [resiID], Program.[programCostID], 
[durationID], [seasonID], [serviceAreaID], [stipendID], [addNotes], [appDeadline], [affCollege], 
[affCompany], [eligibilityRes], [streetAddress], [progWebsite], [progDescription]
FROM Program, ProgramCost
WHERE Program.programCostID = ProgramCost.programCostID
and ProgramCost.value = 'Free';

--DROP VIEW FreePrograms;
SELECT * FROM FreePrograms;

--Check to see if users logged in from a specific date
CREATE VIEW LastLogin AS
SELECT [userID], [prefix], [firstName], [middleName], [lastName], [sufix], [email], 
[password], [altEmail], [altPassword], [phone], [address], [registerDate], [lastLogin]
FROM UserType
WHERE lastLogin > '02-13-2020'

--DROP VIEW LastLogin;
SELECT * FROM LastLogin;