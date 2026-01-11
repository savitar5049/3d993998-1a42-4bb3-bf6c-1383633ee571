DELETE FROM `jobs` WHERE `name` IN ('cookies', 'offcookies');

INSERT INTO `jobs` (name, label) VALUES
	('cookies', 'Cookies'),
	('offcookies', 'Cookies');

DELETE FROM `job_grades` WHERE `job_name` IN ('cookies', 'offcookies');

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('cookies', 1, 'employee', 'Employee', 15000, '{}', '{}'),
	('cookies', 2, 'owner', 'Owner', 35000, '{}', '{}'),
	('offcookies', 1, 'employee', 'Employee', 1500, '{}', '{}'),
	('offcookies', 2, 'owner', 'Owner', 1500, '{}', '{}');