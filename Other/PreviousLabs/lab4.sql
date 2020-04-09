CREATE TABLE UserType
( 
	userID               INTEGER  IDENTITY  NOT NULL ,
	prefix               char(10)  NULL ,
	firstName            char(20)  NULL ,
	middleName           char(40)  NULL ,
	lastName             char(40)  NULL ,
	sufix                char(10)  NULL ,
	email                char(80)  NULL ,
	password             char(30)  NULL ,
	altEmail             char(80)  NULL ,
	altPassword          char(30)  NULL ,
	phone                char(15)  NULL ,
	address              char(80)  NULL ,
	registerDate         datetime  NULL ,
	lastLogin            datetime  NULL 
)
go

ALTER TABLE UserType
	ADD PRIMARY KEY  CLUSTERED (userID ASC)
go

CREATE TABLE Visitor
( 
	userID               INTEGER  NOT NULL ,
	 FOREIGN KEY (userID) REFERENCES UserType(userID)
)
go

ALTER TABLE Visitor
	ADD PRIMARY KEY  CLUSTERED (userID ASC)
go

CREATE TABLE DirRole
( 
	roleID               INTEGER  IDENTITY  NOT NULL ,
	roleName             char(30)  NULL ,
	other                char(60)  NULL 
)
go

ALTER TABLE DirRole
	ADD PRIMARY KEY  CLUSTERED (roleID ASC)
go

CREATE TABLE ProgramDir
( 
	userID               INTEGER  NOT NULL ,
	roleID               INTEGER  NULL ,
	 FOREIGN KEY (roleID) REFERENCES DirRole(roleID),
	 FOREIGN KEY (userID) REFERENCES UserType(userID)
)
go

ALTER TABLE ProgramDir
	ADD PRIMARY KEY  CLUSTERED (userID ASC)
go

CREATE TABLE ProgramDir
( 
	userID               INTEGER  NOT NULL ,
	roleID               INTEGER  NULL ,
	 FOREIGN KEY (roleID) REFERENCES DirRole(roleID),
	 FOREIGN KEY (userID) REFERENCES UserType(userID)
)
go

ALTER TABLE ProgramDir
	ADD PRIMARY KEY  CLUSTERED (userID ASC)
go

CREATE TABLE ContactPerson
( 
	contactID            INTEGER  IDENTITY  NOT NULL ,
	firstName            char(20)  NULL ,
	middleName           char(40)  NULL ,
	lastName             char(40)  NULL ,
	email                char(60)  NULL ,
	phone                varchar(15)  NULL 
)
go

ALTER TABLE ContactPerson
	ADD PRIMARY KEY  CLUSTERED (contactID ASC)
go

CREATE TABLE FieldOfStudy
( 
	fieldID              integer  IDENTITY  NOT NULL ,
	value                char(60)  NULL ,
	status               char(9)  NULL 
)
go

ALTER TABLE FieldOfStudy
	ADD PRIMARY KEY  CLUSTERED (fieldID ASC)
go

CREATE TABLE ProgLoc
( 
	progLocID            INTEGER  IDENTITY  NOT NULL ,
	state                char(30)  NULL ,
	zipcode              char(10)  NULL ,
	county               char(30)  NULL ,
	city                 char(18)  NULL ,
	latitude             float  NULL ,
	longitude            float  NULL 
)
go

ALTER TABLE ProgLoc
	ADD PRIMARY KEY  CLUSTERED (progLocID ASC)
go

CREATE TABLE Grades
( 
	gradesID             integer  IDENTITY  NOT NULL ,
	value                char(40)  NULL ,
	status               char(9)  NULL 
)
go

ALTER TABLE Grades
	ADD PRIMARY KEY  CLUSTERED (gradesID ASC)
go

CREATE TABLE Residental
( 
	resiID               INTEGER  IDENTITY  NOT NULL ,
	value                char(60)  NULL ,
	status               char(9)  NULL 
)
go

ALTER TABLE Residental
	ADD PRIMARY KEY  CLUSTERED (resiID ASC)
go

CREATE TABLE ProgramCost
( 
	programCostID        INTEGER  IDENTITY  NOT NULL ,
	value                char(60)  NULL ,
	status               char(9)  NULL 
)
go

ALTER TABLE ProgramCost
	ADD PRIMARY KEY  CLUSTERED (programCostID ASC)
go

CREATE TABLE Duration
( 
	durationID           INTEGER  IDENTITY  NOT NULL ,
	value                char(60)  NULL ,
	status               char(9)  NULL 
)
go

ALTER TABLE Duration
	ADD PRIMARY KEY  CLUSTERED (durationID ASC)
go

CREATE TABLE Season
( 
	seasonID             INTEGER  IDENTITY  NOT NULL ,
	value                char(25)  NULL ,
	status               char(9)  NULL 
)
go

ALTER TABLE Season
	ADD PRIMARY KEY  CLUSTERED (seasonID ASC)
go

CREATE TABLE ServiceArea
( 
	serviceAreaID        INTEGER  IDENTITY  NOT NULL ,
	value                char(40)  NULL ,
	status               char(9)  NULL 
)
go

ALTER TABLE ServiceArea
	ADD PRIMARY KEY  CLUSTERED (serviceAreaID ASC)
go

CREATE TABLE Program
( 
	progID               INTEGER  IDENTITY  NOT NULL ,
	userID               INTEGER  NULL ,
	name                 char(60)  NULL ,
	acronym              char(10)  NULL ,
	contactID            INTEGER  NULL ,
	progLocID            INTEGER  NULL ,
	fieldID              integer  NULL ,
	gradesID             integer  NULL ,
	resiID               INTEGER  NULL ,
	programCostID        INTEGER  NULL ,
	durationID           INTEGER  NULL ,
	seasonID             INTEGER  NULL ,
	serviceAreaID        INTEGER  NULL ,
	addNotes             char(255)  NULL ,
	appDeadline          char(50)  NULL ,
	affCollege           char(15)  NULL ,
	affCompany           char(15)  NULL ,
	eligibilityRes       char(255)  NULL ,
	streetAddress        char(80)  NULL ,
	progWebsite          char(150)  NULL ,
	progDescription      char(255)  NULL ,
	 FOREIGN KEY (contactID) REFERENCES ContactPerson(contactID),
	 FOREIGN KEY (fieldID) REFERENCES FieldOfStudy(fieldID),
	 FOREIGN KEY (progLocID) REFERENCES ProgLoc(progLocID),
	 FOREIGN KEY (gradesID) REFERENCES Grades(gradesID),
	 FOREIGN KEY (resiID) REFERENCES Residental(resiID),
	 FOREIGN KEY (programCostID) REFERENCES ProgramCost(programCostID),
	 FOREIGN KEY (durationID) REFERENCES Duration(durationID),
	 FOREIGN KEY (seasonID) REFERENCES Season(seasonID),
	 FOREIGN KEY (serviceAreaID) REFERENCES ServiceArea(serviceAreaID),
	 FOREIGN KEY (userID) REFERENCES ProgramDir(userID),
	 FOREIGN KEY (userID) REFERENCES ProgramDir(userID)
)
go

ALTER TABLE Program
	ADD PRIMARY KEY  CLUSTERED (progID ASC)
go

CREATE TABLE Location
( 
	latitude             char(18)  NOT NULL ,
	longitude            char(18)  NOT NULL 
)
go

ALTER TABLE Location
	ADD PRIMARY KEY  CLUSTERED (latitude ASC,longitude ASC)
go

CREATE TABLE Admin
( 
	userID               INTEGER  NOT NULL ,
	 FOREIGN KEY (userID) REFERENCES UserType(userID)
)
go

ALTER TABLE Admin
	ADD PRIMARY KEY  CLUSTERED (userID ASC)
go
