INSERT INTO FieldOfStudy(value, status)
VALUES	('Biology', 'active'),
				('Chemestry', 'active'),
				('Physics', 'active'),
				('Computer Science', 'active'),
				('Agriculture Science', 'active'),
				('Biotechnology', 'active'),
				('Medicine: Research', 'active'),
				('Engineering', 'active'),
				('Health Sciences', 'active'),
				('Bioinformatics', 'active'),
				('Behavioral sciences', 'active'),
				('Earth Sciences', 'active'),
				('Neurosciences', 'active'),
		    ('Other', 'active');


INSERT INTO Grades(value, status)
VALUES	('Elementary School', 'active'),
				('Middle School', 'active'),
				('Grade 9', 'active'),
				('Grade 10', 'active'),
				('Grade 11', 'active'),
				('Grade 12', 'active'),
				('Undergraduate', 'active'),
				('Graduate', 'active');


INSERT INTO Residental(value, status)
VALUES	('Yes, for all students', 'active'),
				('Yes, for some students', 'active'),
				('No', 'active');


INSERT INTO ProgramCost(value, status)
VALUES	('Free', 'active'),
				('Cost determined by by demonstrated financial need', 'active'),
				('Less than $50', 'active'),
				('$50-$300', 'active'),
				('$300-$1000', 'active'),
				('More than $1000', 'active');


INSERT INTO Duration (value, status)
VALUES	('Partial day event', 'active'),
				('1 day', 'active'),
				('2-3 days', 'active'),
				('3-7 days', 'active'),
				('1-2 weeks', 'active'),
				('3-6 weeks', 'active'),
				('6-8 weeks', 'active'),
				('8-10 weeks', 'active');


INSERT INTO Season (value, status)
VALUES	('Summer', 'active'),
				('Fall', 'active'),
				('Winter', 'active'),
				('Spring', 'active'),
				('Year-round', 'active');


INSERT INTO ServiceArea(value, status)
VALUES	('Same City', 'active'),
				('Same county', 'active'),
				('Our surrounding counties', 'active'),
				('Indiana statewide', 'active'),
				('Nationwide', 'active'),
				('Other', 'active');


INSERT INTO Stipend (value, status)
VALUES	('No participants receive a stipend', 'active'),
				('All participants receive a stipend', 'active'),
				('Some participants receive a stipend', 'active');
