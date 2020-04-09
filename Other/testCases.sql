select * from Guest;
select * from ProgramManager;
select * from Admin;

select * from Program;
select * from ContactPerson;

select * from FieldOfStudy;
select * from Duration;
select * from Grades;
select * from Season;
select * from Stipend;
select * from ManagerRole;
select * from Residental;
select * from ProgramCost;
select * from ServiceArea;



--UPDATE UserType SET lastLogin =  '', currLoggedIn = 'yes' WHERE email =  'dprosevski@gmail.com';
SELECT roleID FROM ManagerRole WHERE roleName = 'Outreach Program Director';

insert into ProgramManager(roleID, prefix, firstName, middleName, lastName, sufix, email, 
password, altEmail, altPassword, phone,address, registerDate, lastLogin, approved, 
currLoggedIn, rndCode)
values(2, NULL , 'Dimitrije', NULL,'Prosevski', NULL ,
'dprosevski@gmail.com','dp112233!!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
'QCXUJLTBLNJGSXAPACRLEPVSSYWQTOOJSDIKCRKMABKGPRVTQL');

/*SELECT DISTINCT * FROM ProgLoc, State
WHERE State.name = 'Indiana'
and ProgLoc.City = 'Avon'
and State.stateID = ProgLoc.stateID;*/


INSERT INTO  Guest  (prefix, firstName, middleName, lastName, sufix, email, password, altEmail, altPassword, phone,address, registerDate, lastLogin, approved, currLoggedIn, rndCode)values('' , 'guestFirst', '','guestLast', '' ,'guest@gmail.com','test123!!!', '', '', '', '', '3/10/2020 9:41:28 PM', NULL, 'no', 'no', 'EYUQPWTHICQMGMSHVAKMFDGJQHUGKADTNWIHEAPLIULOTIHYDE');

INSERT INTO  ProgramManager(prefix, firstName, middleName, lastName, sufix, email, password, altEmail, altPassword, phone,address, registerDate, lastLogin, approved, currLoggedIn, rndCode)values('' , 'pmFirst', '','pmLast', '' ,'pm@gmail.com','test123!!!', '', '', '', '', '3/10/2020 9:41:28 PM', NULL, 'no', 'no', 'EYUQPWTHICQMGMSHVAKMFDGJQHUGKADTNWIHEAPLIULOTIHYDE');

INSERT INTO  Admin  (accessLevel, prefix, firstName, middleName, lastName, sufix, email, password, altEmail, altPassword, phone,address, registerDate, lastLogin, currLoggedIn)values('a','' , 'adminFirst', '','adminLast', '' ,'admin@gmail.com','test123!!!', '', '', '', '', '3/11/2020 4:20:20 PM', NULL, 'no');

INSERT INTO  Admin  (accessLevel, prefix, firstName, middleName, lastName, sufix, email, password, altEmail, altPassword, phone,address, registerDate, lastLogin, currLoggedIn)values('s','' , 'superAdminFirst', '','superAdminLast', '' ,'super@gmail.com','test123!!!', '', '', '', '', '3/11/2020 4:20:20 PM', NULL, 'no');



