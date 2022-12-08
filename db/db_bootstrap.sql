CREATE DATABASE sc_app;
CREATE USER 'word'@'%' IDENTIFIED BY 'abc123';
GRANT ALL PRIVILEGES ON sc_app.* TO 'word'@'%';
FLUSH PRIVILEGES;

USE sc_app;

create table MEETING (
    meeting_ID INT,
	start_time VARCHAR(50),
	expected_length INT,
	date DATE,
	agenda VARCHAR(50),
    PRIMARY KEY (meeting_ID)
);

CREATE TABLE LEADER (
	lead_ID INT PRIMARY KEY,
	name VARCHAR(50),
	email VARCHAR(50),
	role VARCHAR(50)
);

create table EXECUTIVE (
	exec_ID INT PRIMARY KEY,
	name VARCHAR(50),
	email VARCHAR(50),
	role VARCHAR(50)
);

create table PROJECT (
	title VARCHAR(50),
	description TEXT,
	semester VARCHAR(50),
	exec_ID INT,
	frontLang VARCHAR(50),
	backLang VARCHAR(50),
    PRIMARY KEY (title),
	FOREIGN KEY (exec_ID) REFERENCES EXECUTIVE(exec_ID)
);

create table TEAM (
	team_ID INT,
	proj_title VARCHAR(50),
	lead_ID INT,
	exec_ID INT,
    PRIMARY KEY (team_ID),
    FOREIGN KEY (proj_title) REFERENCES PROJECT(title),
    FOREIGN KEY (lead_ID) REFERENCES LEADER(lead_ID),
    FOREIGN KEY (exec_ID) REFERENCES EXECUTIVE(exec_ID)
);

create table MEMBER (
	member_ID INT,
	name VARCHAR(50),
	email VARCHAR(50),
	role VARCHAR(50),
	total_hours INT,
	tasks_in_progress INT,
	lead_ID INT,
	team_ID INT,
    PRIMARY KEY (member_ID),
    FOREIGN KEY (lead_ID) REFERENCES LEADER(lead_ID),
    FOREIGN KEY (team_ID) REFERENCES TEAM(team_ID)
);

create table CLIENTS (
	proj_title VARCHAR(50),
	name VARCHAR(50),
	email VARCHAR(50),
	client_ID INT,
	date_applied DATE,
	exec_ID INT,
    PRIMARY KEY (client_ID, proj_title),
    FOREIGN KEY (exec_ID) REFERENCES EXECUTIVE(exec_ID),
    FOREIGN KEY (proj_title) REFERENCES PROJECT(title)
);

create table TASK (
	name VARCHAR(50),
	proj_title VARCHAR(50),
	client_ID INT,
	type VARCHAR(50),
	member_ID INT,
	lead_ID INT,
	task_number INT,
	date_assigned DATE,
	date_due DATE,
	date_finished DATE,
	completion_status VARCHAR(50),
	hours INT,
	description TEXT,
    PRIMARY KEY (proj_title, task_number),
    FOREIGN KEY (lead_ID) REFERENCES LEADER(lead_ID),
    FOREIGN KEY (client_ID) REFERENCES CLIENTS(client_ID),
    FOREIGN KEY (proj_title) REFERENCES PROJECT(title),
    FOREIGN KEY (member_ID) REFERENCES MEMBER(member_ID)
);

create table LEADER_MEETING (
	meeting_ID INT,
	lead_ID INT,
    PRIMARY KEY (meeting_ID, lead_ID),
    FOREIGN KEY (lead_ID) REFERENCES LEADER(lead_ID),
    FOREIGN KEY (meeting_ID) REFERENCES MEETING(meeting_ID)
);

create table MEMBER_MEETING (
	meeting_ID INT,
	member_ID INT,
    PRIMARY KEY (meeting_ID, member_ID),
    FOREIGN KEY (member_ID) REFERENCES MEMBER(member_ID),
    FOREIGN KEY (meeting_ID) REFERENCES MEETING(meeting_ID)
);

create table CLIENTS_MEETING (
	meeting_ID INT,
	proj_title VARCHAR(50),
	client_ID INT,
    PRIMARY KEY (meeting_ID, proj_title, client_ID),
    FOREIGN KEY (proj_title) REFERENCES PROJECT(title),
    FOREIGN KEY (client_ID) REFERENCES CLIENTS(client_ID),
    FOREIGN KEY (meeting_ID) REFERENCES MEETING(meeting_ID)
);

insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (1, '10:10 AM', 110, '2022-11-19', 'Up-sized dynamic system engine');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (2, '2:09 PM', 72, '2022-11-24', 'Reverse-engineered fault-tolerant project');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (3, '1:14 PM', 77, '2022-11-16', 'Managed analyzing firmware');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (4, '10:26 AM', 41, '2022-11-9', 'Face to face zero tolerance model');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (5, '8:38 AM', 111, '2022-12-14', 'Upgradable high-level complexity');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (6, '10:03 AM', 26, '2022-11-7', 'Enhanced empowering benchmark');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (7, '3:09 PM', 24, '2022-12-13', 'Visionary attitude-oriented data-warehouse');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (8, '5:14 PM', 91, '2022-12-7', 'Realigned disintermediate support');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (9, '6:19 PM', 61, '2022-12-15', 'Switchable background challenge');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (10, '3:50 PM', 64, '2022-10-29', 'Operative 24/7 monitoring');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (11, '1:34 PM', 104, '2022-11-25', 'Mandatory demand-driven software');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (12, '7:42 PM', 61, '2022-10-15', 'Streamlined optimizing circuit');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (13, '7:20 PM', 68, '2022-11-28', 'Business-focused multimedia groupware');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (14, '9:40 AM', 20, '2022-11-8', 'Diverse intangible function');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (15, '10:18 AM', 104, '2022-11-15', 'Persevering scalable service-desk');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (16, '1:56 PM', 27, '2022-10-14', 'Re-engineered grid-enabled attitude');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (17, '5:55 PM', 25, '2022-12-6', 'Profound impactful system engine');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (18, '10:45 AM', 30, '2022-10-17', 'Mandatory zero administration project');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (19, '10:59 AM', 41, '2022-12-5', 'Organic needs-based project');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (20, '11:12 AM', 19, '2022-9-20', 'Multi-channelled national throughput');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (21, '9:42 AM', 28, '2022-11-6', 'Proactive impactful time-frame');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (22, '11:06 AM', 17, '2022-11-15', 'Re-contextualized heuristic support');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (23, '5:04 PM', 108, '2022-10-31', 'Cross-platform exuding core');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (24, '7:46 PM', 103, '2022-11-7', 'Virtual real-time internet solution');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (25, '11:30 AM', 113, '2022-10-20', 'Cross-group zero administration paradigm');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (26, '5:24 PM', 98, '2022-12-15', 'Advanced demand-driven frame');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (27, '1:25 PM', 42, '2022-11-5', 'Reverse-engineered zero defect solution');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (28, '6:14 PM', 115, '2022-10-4', 'Mandatory attitude-oriented application');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (29, '10:40 AM', 26, '2022-10-27', 'Reduced local implementation');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (30, '3:29 PM', 22, '2022-12-11', 'Fundamental client-server task-force');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (31, '7:23 PM', 50, '2022-11-20', 'Quality-focused 24/7 frame');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (32, '5:53 PM', 71, '2022-10-6', 'Progressive fresh-thinking array');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (33, '4:00 PM', 83, '2022-9-20', 'Synchronised exuding solution');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (34, '10:31 AM', 54, '2022-11-12', 'Adaptive executive product');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (35, '5:57 PM', 70, '2022-10-11', 'Right-sized directional solution');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (36, '8:57 AM', 33, '2022-11-10', 'Exclusive next generation interface');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (37, '5:16 PM', 34, '2022-11-3', 'Universal neutral synergy');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (38, '4:33 PM', 70, '2022-10-6', 'Face to face web-enabled interface');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (39, '1:09 PM', 95, '2022-10-17', 'User-friendly asynchronous superstructure');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (40, '1:36 PM', 79, '2022-11-2', 'Self-enabling responsive productivity');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (41, '7:52 PM', 92, '2022-10-20', 'Balanced fault-tolerant solution');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (42, '6:49 PM', 69, '2022-10-14', 'Re-engineered asymmetric firmware');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (43, '4:13 PM', 119, '2022-11-23', 'Up-sized didactic ability');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (44, '4:40 PM', 93, '2022-12-12', 'Optional heuristic neural-net');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (45, '4:40 PM', 106, '2022-9-23', 'Cross-platform disintermediate middleware');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (46, '3:00 PM', 31, '2022-12-8', 'Reactive dynamic function');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (47, '10:11 AM', 111, '2022-10-18', 'Cross-platform disintermediate conglomeration');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (48, '1:22 PM', 73, '2022-9-21', 'Synergized explicit forecast');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (49, '1:33 PM', 85, '2022-12-10', 'Reduced 4th generation algorithm');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (50, '12:54 PM', 82, '2022-10-11', 'Adaptive stable conglomeration');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (51, '9:41 AM', 65, '2022-10-17', 'Re-engineered even-keeled local area network');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (52, '5:26 PM', 72, '2022-10-21', 'Enhanced heuristic strategy');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (53, '5:54 PM', 82, '2022-9-29', 'Multi-tiered zero administration model');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (54, '4:14 PM', 65, '2022-11-22', 'Profound bi-directional local area network');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (55, '4:59 PM', 79, '2022-11-24', 'Universal homogeneous software');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (56, '9:03 AM', 50, '2022-12-15', 'Ameliorated next generation superstructure');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (57, '1:37 PM', 90, '2022-10-29', 'Cross-platform asynchronous alliance');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (58, '4:06 PM', 57, '2022-10-14', 'Optional coherent system engine');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (59, '5:04 PM', 99, '2022-9-20', 'De-engineered dynamic capacity');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (60, '7:30 PM', 99, '2022-11-27', 'Automated scalable capacity');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (61, '9:01 AM', 87, '2022-9-22', 'Self-enabling tertiary knowledge base');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (62, '9:48 AM', 19, '2022-10-4', 'Digitized background capability');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (63, '10:44 AM', 19, '2022-10-27', 'Virtual foreground parallelism');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (64, '6:40 PM', 88, '2022-10-23', 'Switchable actuating methodology');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (65, '7:11 PM', 63, '2022-10-14', 'Down-sized value-added access');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (66, '2:02 PM', 47, '2022-11-21', 'Persevering homogeneous productivity');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (67, '7:39 PM', 22, '2022-11-18', 'Stand-alone 3rd generation help-desk');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (68, '6:20 PM', 82, '2022-11-23', 'Implemented cohesive concept');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (69, '12:15 PM', 56, '2022-12-2', 'Universal client-driven middleware');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (70, '6:43 PM', 106, '2022-10-27', 'User-centric neutral encoding');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (71, '5:56 PM', 32, '2022-10-9', 'Down-sized empowering initiative');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (72, '7:33 PM', 22, '2022-11-11', 'Devolved exuding artificial intelligence');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (73, '11:00 AM', 58, '2022-11-25', 'Right-sized modular superstructure');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (74, '11:42 AM', 115, '2022-9-29', 'Multi-layered bottom-line adapter');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (75, '8:37 AM', 63, '2022-10-22', 'Organized intermediate concept');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (76, '12:53 PM', 68, '2022-10-9', 'Configurable national leverage');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (77, '11:26 AM', 60, '2022-10-4', 'Quality-focused bottom-line extranet');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (78, '2:34 PM', 114, '2022-10-1', 'Proactive zero defect algorithm');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (79, '3:21 PM', 84, '2022-11-28', 'Re-contextualized multi-tasking paradigm');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (80, '9:55 AM', 85, '2022-10-30', 'Quality-focused fault-tolerant matrices');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (81, '11:31 AM', 60, '2022-10-10', 'Proactive 4th generation standardization');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (82, '8:15 AM', 74, '2022-11-17', 'Reactive impactful protocol');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (83, '5:53 PM', 86, '2022-10-12', 'Progressive motivating neural-net');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (84, '1:36 PM', 79, '2022-12-5', 'Ameliorated fresh-thinking help-desk');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (85, '12:41 PM', 59, '2022-12-10', 'Up-sized contextually-based customer loyalty');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (86, '7:01 PM', 71, '2022-12-15', 'Proactive background utilisation');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (87, '12:15 PM', 48, '2022-12-15', 'Customer-focused context-sensitive challenge');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (88, '12:07 PM', 63, '2022-12-14', 'Self-enabling transitional time-frame');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (89, '10:20 AM', 24, '2022-9-24', 'Robust discrete complexity');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (90, '2:39 PM', 103, '2022-10-30', 'Optimized coherent neural-net');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (91, '2:50 PM', 56, '2022-11-8', 'Configurable didactic core');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (92, '11:00 AM', 20, '2022-10-18', 'Multi-channelled bifurcated conglomeration');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (93, '3:12 PM', 95, '2022-12-15', 'Synergized holistic utilisation');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (94, '6:40 PM', 22, '2022-11-13', 'Automated clear-thinking toolset');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (95, '2:41 PM', 86, '2022-12-9', 'Adaptive fault-tolerant extranet');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (96, '5:21 PM', 28, '2022-11-12', 'User-friendly multimedia knowledge base');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (97, '2:13 PM', 99, '2022-12-3', 'Right-sized responsive forecast');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (98, '3:40 PM', 103, '2022-10-12', 'Organized fault-tolerant paradigm');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (99, '11:00 AM', 110, '2022-11-7', 'Organic uniform support');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (100, '5:55 PM', 113, '2022-12-1', 'Operative methodical functionalities');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (101, '11:38 AM', 65, '2022-11-3', 'Stand-alone content-based array');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (102, '5:35 PM', 105, '2022-11-2', 'Quality-focused cohesive matrix');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (103, '3:06 PM', 64, '2022-11-22', 'Triple-buffered fresh-thinking strategy');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (104, '10:20 AM', 43, '2022-9-20', 'Upgradable responsive methodology');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (105, '4:40 PM', 55, '2022-10-17', 'Triple-buffered optimizing definition');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (106, '12:29 PM', 15, '2022-12-1', 'Reactive dedicated intranet');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (107, '5:11 PM', 57, '2022-10-9', 'Multi-layered executive capacity');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (108, '7:49 PM', 100, '2022-10-16', 'Optimized tertiary support');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (109, '1:11 PM', 91, '2022-11-12', 'Digitized contextually-based middleware');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (110, '7:32 PM', 43, '2022-10-16', 'Cross-group executive project');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (111, '11:51 AM', 58, '2022-11-25', 'Triple-buffered eco-centric task-force');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (112, '11:12 AM', 117, '2022-10-3', 'Re-engineered coherent hub');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (113, '1:07 PM', 62, '2022-10-11', 'Team-oriented coherent framework');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (114, '8:47 AM', 97, '2022-10-26', 'Polarised empowering flexibility');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (115, '9:33 AM', 98, '2022-10-6', 'Inverse modular circuit');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (116, '11:57 AM', 39, '2022-11-17', 'Right-sized discrete portal');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (117, '11:03 AM', 66, '2022-10-27', 'Synergistic foreground groupware');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (118, '7:01 PM', 70, '2022-11-27', 'Automated 3rd generation architecture');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (119, '2:06 PM', 51, '2022-9-27', 'Quality-focused dedicated customer loyalty');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (120, '9:21 AM', 102, '2022-11-30', 'Multi-channelled radical application');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (121, '4:58 PM', 103, '2022-9-30', 'Seamless impactful process improvement');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (122, '1:30 PM', 43, '2022-11-14', 'Object-based 24 hour contingency');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (123, '3:40 PM', 30, '2022-12-3', 'Mandatory client-server intranet');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (124, '2:14 PM', 37, '2022-10-20', 'Switchable executive superstructure');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (125, '2:08 PM', 105, '2022-11-6', 'Object-based zero defect utilisation');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (126, '3:31 PM', 67, '2022-10-31', 'Managed responsive functionalities');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (127, '1:12 PM', 76, '2022-9-20', 'Seamless full-range data-warehouse');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (128, '1:50 PM', 102, '2022-10-14', 'Reverse-engineered bottom-line time-frame');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (129, '6:31 PM', 86, '2022-9-28', 'Mandatory disintermediate service-desk');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (130, '1:28 PM', 40, '2022-10-12', 'Cloned human-resource workforce');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (131, '1:52 PM', 17, '2022-10-19', 'Managed grid-enabled strategy');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (132, '2:15 PM', 55, '2022-9-20', 'Future-proofed 24/7 collaboration');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (133, '9:36 AM', 34, '2022-10-18', 'Expanded fault-tolerant open system');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (134, '3:02 PM', 85, '2022-12-2', 'Monitored demand-driven functionalities');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (135, '7:19 PM', 85, '2022-10-12', 'Optional well-modulated customer loyalty');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (136, '3:32 PM', 117, '2022-11-27', 'Self-enabling bifurcated application');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (137, '4:08 PM', 89, '2022-10-28', 'Up-sized foreground adapter');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (138, '5:43 PM', 100, '2022-10-4', 'Innovative grid-enabled instruction set');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (139, '3:01 PM', 40, '2022-9-27', 'Horizontal dynamic initiative');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (140, '2:48 PM', 41, '2022-10-21', 'Virtual secondary knowledge user');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (141, '2:20 PM', 103, '2022-10-22', 'Distributed dynamic service-desk');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (142, '10:36 AM', 90, '2022-10-12', 'Advanced human-resource pricing structure');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (143, '1:28 PM', 39, '2022-12-11', 'Grass-roots optimizing flexibility');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (144, '4:29 PM', 72, '2022-11-24', 'Multi-lateral disintermediate core');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (145, '3:16 PM', 78, '2022-9-20', 'Universal well-modulated benchmark');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (146, '12:39 PM', 23, '2022-9-21', 'Streamlined grid-enabled secured line');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (147, '9:14 AM', 57, '2022-10-27', 'Distributed analyzing conglomeration');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (148, '7:14 PM', 54, '2022-11-3', 'Assimilated responsive website');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (149, '10:23 AM', 92, '2022-12-4', 'Front-line system-worthy function');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (150, '3:59 PM', 112, '2022-10-31', 'Polarised bi-directional flexibility');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (151, '3:21 PM', 67, '2022-12-4', 'Advanced bi-directional time-frame');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (152, '10:55 AM', 22, '2022-11-13', 'Devolved bifurcated structure');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (153, '12:21 PM', 16, '2022-11-19', 'Operative human-resource attitude');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (154, '7:45 PM', 28, '2022-11-1', 'Reactive bifurcated open architecture');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (155, '9:01 AM', 44, '2022-12-4', 'Adaptive multi-tasking access');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (156, '3:47 PM', 26, '2022-10-12', 'Devolved 24/7 challenge');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (157, '4:34 PM', 56, '2022-11-16', 'Optional dedicated system engine');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (158, '4:42 PM', 27, '2022-11-6', 'Enterprise-wide bi-directional algorithm');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (159, '8:14 AM', 64, '2022-10-27', 'Optional bandwidth-monitored architecture');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (160, '2:59 PM', 73, '2022-10-6', 'Digitized fault-tolerant intranet');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (161, '2:31 PM', 106, '2022-9-19', 'Function-based bottom-line implementation');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (162, '3:57 PM', 93, '2022-10-15', 'Re-engineered 24/7 secured line');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (163, '6:07 PM', 96, '2022-11-17', 'Reduced stable info-mediaries');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (164, '8:05 AM', 24, '2022-12-15', 'Diverse didactic archive');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (165, '1:12 PM', 40, '2022-12-7', 'Distributed user-facing moderator');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (166, '10:55 AM', 17, '2022-10-24', 'Profound scalable complexity');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (167, '12:59 PM', 56, '2022-9-25', 'Multi-lateral human-resource website');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (168, '1:42 PM', 77, '2022-11-30', 'Secured even-keeled complexity');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (169, '3:15 PM', 23, '2022-12-12', 'Mandatory content-based help-desk');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (170, '11:04 AM', 26, '2022-11-13', 'Open-source foreground interface');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (171, '2:21 PM', 100, '2022-10-20', 'Fundamental disintermediate concept');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (172, '1:08 PM', 108, '2022-12-1', 'Optional well-modulated methodology');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (173, '10:35 AM', 30, '2022-9-21', 'Grass-roots radical local area network');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (174, '3:28 PM', 39, '2022-11-18', 'Customer-focused zero defect task-force');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (175, '1:44 PM', 50, '2022-10-29', 'Switchable responsive matrices');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (176, '2:37 PM', 58, '2022-11-14', 'Fully-configurable leading edge database');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (177, '5:48 PM', 118, '2022-10-4', 'Distributed intangible internet solution');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (178, '4:19 PM', 39, '2022-10-14', 'Virtual discrete hierarchy');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (179, '3:11 PM', 72, '2022-12-14', 'Re-engineered homogeneous circuit');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (180, '2:59 PM', 68, '2022-10-28', 'Right-sized context-sensitive customer loyalty');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (181, '3:44 PM', 59, '2022-9-29', 'Multi-tiered maximized firmware');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (182, '5:48 PM', 23, '2022-11-9', 'Sharable exuding firmware');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (183, '3:44 PM', 40, '2022-11-2', 'Customizable analyzing local area network');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (184, '12:29 PM', 117, '2022-10-8', 'Fully-configurable neutral open system');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (185, '4:54 PM', 46, '2022-11-22', 'Optimized radical model');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (186, '4:53 PM', 21, '2022-10-27', 'Universal full-range standardization');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (187, '1:38 PM', 26, '2022-10-9', 'Front-line directional definition');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (188, '9:28 AM', 86, '2022-9-23', 'Sharable 24/7 installation');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (189, '12:21 PM', 95, '2022-10-19', 'Adaptive executive complexity');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (190, '2:01 PM', 76, '2022-11-20', 'Cross-platform bandwidth-monitored flexibility');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (191, '4:46 PM', 58, '2022-9-20', 'Proactive demand-driven task-force');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (192, '3:23 PM', 116, '2022-11-10', 'Configurable user-facing methodology');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (193, '1:57 PM', 108, '2022-9-23', 'User-centric 24/7 matrix');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (194, '1:45 PM', 23, '2022-12-6', 'Implemented stable structure');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (195, '12:57 PM', 52, '2022-12-5', 'Front-line zero defect encryption');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (196, '11:28 AM', 64, '2022-9-24', 'Team-oriented multi-tasking protocol');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (197, '12:23 PM', 36, '2022-9-25', 'Reverse-engineered optimal encoding');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (198, '9:43 AM', 64, '2022-11-22', 'Horizontal multimedia data-warehouse');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (199, '3:29 PM', 75, '2022-10-22', 'Realigned intangible system engine');
insert into MEETING (meeting_ID, start_time, expected_length, date, agenda) values (200, '2:15 PM', 18, '2022-9-19', 'Multi-tiered composite support');


insert into LEADER (lead_ID, name, email, role) values (1, 'Modesty', 'mstorms0@pcworld.com', 'Environmental Specialist');
insert into LEADER (lead_ID, name, email, role) values (2, 'Cassie', 'cverick1@quantcast.com', 'Editor');
insert into LEADER (lead_ID, name, email, role) values (3, 'Odo', 'opoundford2@seesaa.net', 'Geological Engineer');
insert into LEADER (lead_ID, name, email, role) values (4, 'Ardyth', 'apavlitschek3@si.edu', 'Programmer I');
insert into LEADER (lead_ID, name, email, role) values (5, 'Barth', 'btreby4@huffingtonpost.com', 'Senior Sales Associate');
insert into LEADER (lead_ID, name, email, role) values (6, 'Michel', 'mdurham5@fotki.com', 'Assistant Media Planner');
insert into LEADER (lead_ID, name, email, role) values (7, 'Andie', 'apencot6@elegantthemes.com', 'Software Consultant');
insert into LEADER (lead_ID, name, email, role) values (8, 'Ryun', 'rheisman7@bbc.co.uk', 'Clinical Specialist');
insert into LEADER (lead_ID, name, email, role) values (9, 'Rolfe', 'rbearcroft8@dell.com', 'Nurse Practicioner');
insert into LEADER (lead_ID, name, email, role) values (10, 'Klemens', 'kseebright9@tumblr.com', 'Senior Financial Analyst');
insert into LEADER (lead_ID, name, email, role) values (11, 'Drusy', 'dcaspella@ask.com', 'Media Manager II');
insert into LEADER (lead_ID, name, email, role) values (12, 'Wenda', 'wronchib@gravatar.com', 'Chemical Engineer');
insert into LEADER (lead_ID, name, email, role) values (13, 'Geri', 'griglerc@comcast.net', 'Cost Accountant');
insert into LEADER (lead_ID, name, email, role) values (14, 'Hinda', 'hgontierd@gov.uk', 'Human Resources Assistant III');
insert into LEADER (lead_ID, name, email, role) values (15, 'Elisha', 'esussemse@macromedia.com', 'Junior Executive');

insert into EXECUTIVE (exec_ID, name, email, role) values (1, 'Allistair', 'acollin0@baidu.com', 'Design Engineer');
insert into EXECUTIVE (exec_ID, name, email, role) values (2, 'Sidoney', 'smaggi1@mapquest.com', 'Marketing Executive');
insert into EXECUTIVE (exec_ID, name, email, role) values (3, 'Natty', 'nreuter2@livejournal.com', 'Information Systems Manager');

insert into PROJECT (title, description, semester, exec_ID, frontLang, backLang) values ('Stronghold', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.
Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.
Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.
Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'Fall 2022', 1, 'Typescript', 'Python');
insert into PROJECT (title, description, semester, exec_ID, frontLang, backLang) values ('Tempsoft', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.
Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.
Sed ante. Vivamus tortor. Duis mattis egestas metus.
Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'Fall 2022', 1, 'Javascript', 'Python');
insert into PROJECT (title, description, semester, exec_ID, frontLang, backLang) values ('Bitwolf', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.
In congue. Etiam justo. Etiam pretium iaculis justo.
In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.
Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'Fall 2022', 1, 'Javascript', 'Python');
insert into PROJECT (title, description, semester, exec_ID, frontLang, backLang) values ('Kawa', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.
Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.
Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'Fall 2022', 1, 'Javascript', 'Python');
insert into PROJECT (title, description, semester, exec_ID, frontLang, backLang) values ('Rank', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.
In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.
Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.
Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'Fall 2022', 1, 'Javascript', 'Java');
insert into PROJECT (title, description, semester, exec_ID, frontLang, backLang) values ('Stim', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.
Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.
Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Fall 2022', 1, 'Javascript', 'Python');
insert into PROJECT (title, description, semester, exec_ID, frontLang, backLang) values ('Stereo', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.
Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.
In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.
Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'Fall 2022', 1, 'Javascript', 'Java');
insert into PROJECT (title, description, semester, exec_ID, frontLang, backLang) values ('Treeflex', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.
Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.
Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'Fall 2022', 1, 'HTML/CSS', 'Python');
insert into PROJECT (title, description, semester, exec_ID, frontLang, backLang) values ('Biodex', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.
In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.
Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 'Fall 2022', 1, 'Javascript', 'Python');
insert into PROJECT (title, description, semester, exec_ID, frontLang, backLang) values ('Magicians', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.
Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.
Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 'Fall 2022', 1, 'Javascript', 'Python');
insert into PROJECT (title, description, semester, exec_ID, frontLang, backLang) values ('Cookley', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.
Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.
Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 'Fall 2022', 1, 'Typescript', 'Java');
insert into PROJECT (title, description, semester, exec_ID, frontLang, backLang) values ('Asoka', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.
Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.
Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.
Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'Fall 2022', NULL, 'Typescript', 'Python');
insert into PROJECT (title, description, semester, exec_ID, frontLang, backLang) values ('Tin', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.
Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.
Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'Fall 2022', 1, 'Javascript', 'Java');
insert into PROJECT (title, description, semester, exec_ID, frontLang, backLang) values ('Latlux', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.
Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.
Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'Fall 2022', 1, 'Javascript', 'Python');
insert into PROJECT (title, description, semester, exec_ID, frontLang, backLang) values ('Flowdesk', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.
Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.
Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.
Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Fall 2022', 1, 'Javascript', 'PHP');

insert into TEAM (team_ID, proj_title, lead_ID, exec_ID) values (1, 'Tempsoft', 1, 1);
insert into TEAM (team_ID, proj_title, lead_ID, exec_ID) values (2, 'Bitwolf', 9, 1);
insert into TEAM (team_ID, proj_title, lead_ID, exec_ID) values (3, 'Treeflex', 10, 1);
insert into TEAM (team_ID, proj_title, lead_ID, exec_ID) values (4, 'Stronghold', 6, 1);
insert into TEAM (team_ID, proj_title, lead_ID, exec_ID) values (5, 'Kawa', 5, 1);
insert into TEAM (team_ID, proj_title, lead_ID, exec_ID) values (6, 'Rank', 2, 1);
insert into TEAM (team_ID, proj_title, lead_ID, exec_ID) values (7, 'Stereo', 4, 1);
insert into TEAM (team_ID, proj_title, lead_ID, exec_ID) values (8, 'Biodex', 12, 1);
insert into TEAM (team_ID, proj_title, lead_ID, exec_ID) values (9, 'Cookley', 7, 1);
insert into TEAM (team_ID, proj_title, lead_ID, exec_ID) values (10, 'Magicians', 3, 1);
insert into TEAM (team_ID, proj_title, lead_ID, exec_ID) values (11, 'Stim', 8, 1);
insert into TEAM (team_ID, proj_title, lead_ID, exec_ID) values (12, 'Flowdesk', 11, 1);


insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (1, 'Willa', 'whillum0@buzzfeed.com', 'Designer', 1, 12, 13, 6);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (2, 'Danice', 'dpreto1@goodreads.com', 'Developer', 15, 12, 1, 2);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (3, 'Irvin', 'igodber2@squidoo.com', 'Developer', 10, 5, 4, 12);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (4, 'Velma', 'vsorbey3@t.co', 'Fiorile', 18, 0, 12, 5);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (5, 'Callean', 'cblaskett4@alibaba.com', 'Developer', 11, 8, 3, 10);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (6, 'Pammy', 'pblanchette5@wordpress.org', 'Designer', 1, 12, 15, 8);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (7, 'Terry', 'tcrat6@netlog.com', 'Developer', 5, 10, 12, 2);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (8, 'Kitty', 'kvigar7@exblog.jp', 'Designer', 13, 12, 3, 10);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (9, 'Richie', 'rriseam8@alibaba.com', 'Developer', 17, 10, 3, 10);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (10, 'Erwin', 'eslatten9@ibm.com', 'Designer', 10, 8, 3, 10);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (11, 'Corissa', 'cshawcrossa@aol.com', 'Developer', 5, 14, 14, 6);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (12, 'Jason', 'jboastb@hp.com', 'Designer', 5, 3, 15, 5);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (13, 'Gare', 'gphilippc@theglobeandmail.com', 'Designer', 12, 2, 4, 9);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (14, 'Zane', 'zmehmetd@tiny.cc', 'Developer', 7, 7, 6, 2);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (15, 'Clarance', 'chustere@dion.ne.jp', 'Designer', 6, 0, 4, 8);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (16, 'Delmore', 'deuelsf@japanpost.jp', 'Developer', 3, 11, 7, 6);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (17, 'Eydie', 'ecridlang@nbcnews.com', 'Designer', 7, 0, 5, 1);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (18, 'Bronson', 'btoulminh@reuters.com', 'Designer', 2, 11, 10, 7);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (19, 'Marlo', 'mmounsiei@dion.ne.jp', 'Designer', 12, 1, 14, 12);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (20, 'Leigha', 'lkenwortheyj@timesonline.co.uk', 'Developer', 18, 13, 14, 2);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (21, 'Yvonne', 'ydunkertonk@forbes.com', 'Developer', 7, 7, 3, 10);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (22, 'Tan', 'tdoyleyl@tuttocitta.it', 'Designer', 2, 1, 12, 9);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (23, 'Hildegarde', 'hkeenorm@hostgator.com', 'Designer', 10, 5, 5, 7);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (24, 'Isa', 'ifairhamn@ed.gov', 'Designer', 3, 1, 12, 6);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (25, 'Pennie', 'pseyso@moonfruit.com', 'Developer', 20, 14, 7, 2);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (26, 'Tommie', 'twarrackp@deviantart.com', 'Designer', 20, 11, 10, 9);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (27, 'Franz', 'fromkeq@toplist.cz', 'Developer', 5, 1, 8, 10);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (28, 'Lavena', 'lvyser@hp.com', 'Designer', 9, 9, 15, 6);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (29, 'Jeanette', 'jtennicks@sphinn.com', 'Designer', 15, 6, 12, 11);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (30, 'Phillida', 'pmcmastert@vk.com', 'Developer', 8, 3, 4, 9);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (31, 'Sid', 'sbarsamu@hibu.com', 'Developer', 0, 9, 14, 1);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (32, 'Gaultiero', 'goppyv@soup.io', 'Designer', 11, 11, 3, 10);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (33, 'Susan', 'slarkcumw@gnu.org', 'Developer', 3, 6, 8, 5);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (34, 'Minna', 'mpetlyurax@unicef.org', 'Developer', 2, 7, 1, 4);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (35, 'Rosina', 'rchessony@jalbum.net', 'Designer', 6, 13, 7, 9);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (36, 'Berrie', 'bjanksz@barnesandnoble.com', 'Developer', 1, 0, 6, 4);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (37, 'Rollin', 'rpurver10@google.co.uk', 'Developer', 17, 10, 8, 6);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (38, 'Jordon', 'jmanuel11@globo.com', 'Designer', 1, 2, 4, 4);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (39, 'Ulick', 'usaul12@google.cn', 'Designer', 7, 4, 6, 5);
insert into MEMBER (member_ID, name, email, role, total_hours, tasks_in_progress, lead_ID, team_ID) values (40, 'Arden', 'amchan13@google.com', 'Developer', 5, 7, 7, 7);


insert into CLIENTS (proj_title, name, email, client_ID, date_applied, exec_ID) values ('Stronghold', 'Tarrah Devon', 'tdevona@free.fr', 1, '2022-8-4', 1);
insert into CLIENTS (proj_title, name, email, client_ID, date_applied, exec_ID) values ('Tempsoft', 'Revkah Gligorijevic', 'rgligorijevic1@wikia.com', 2, '2022-9-2', 1);
insert into CLIENTS (proj_title, name, email, client_ID, date_applied, exec_ID) values ('Bitwolf', 'Lauree Spinige', 'lspinige2@telegraph.co.uk', 3, '2022-9-4', 1);
insert into CLIENTS (proj_title, name, email, client_ID, date_applied, exec_ID) values ('Kawa', 'Agretha Garfirth', 'agarfirth3@nytimes.com', 4, '2022-8-21', 1);
insert into CLIENTS (proj_title, name, email, client_ID, date_applied, exec_ID) values ('Rank', 'Kristi Rimes', 'krimes4@walmart.com', 5, '2022-9-4', 1);
insert into CLIENTS (proj_title, name, email, client_ID, date_applied, exec_ID) values ('Stim', 'Eyde Finicj', 'efinicj5@chron.com', 6, '2022-8-11', 1);
insert into CLIENTS (proj_title, name, email, client_ID, date_applied, exec_ID) values ('Stereo', 'Donnamarie Jahndel', 'djahndel6@rediff.com', 7, '2022-8-18', 1);
insert into CLIENTS (proj_title, name, email, client_ID, date_applied, exec_ID) values ('Treeflex', 'Carol-jean Adamolli', 'cadamolli7@purevolume.com', 8, '2022-8-3', 1);
insert into CLIENTS (proj_title, name, email, client_ID, date_applied, exec_ID) values ('Biodex', 'Alyson Horley', 'ahorley8@china.com.cn', 9, '2022-8-18', 1);
insert into CLIENTS (proj_title, name, email, client_ID, date_applied, exec_ID) values ('Magicians', 'Eleonora Feedham', 'efeedham9@typepad.com', 10, '2022-8-9', 1);
insert into CLIENTS (proj_title, name, email, client_ID, date_applied, exec_ID) values ('Cookley', 'Felita Yukhnini', 'fyukhninia@free.fr', 11, '2022-8-25', 1);
insert into CLIENTS (proj_title, name, email, client_ID, date_applied, exec_ID) values ('Asoka', 'Merrili Lougheid', 'mloughheid@free.fr', 12, '2022-8-24', NULL);
insert into CLIENTS (proj_title, name, email, client_ID, date_applied, exec_ID) values ('Tin', 'Murielle Woolnough', 'mwoolnoughc@accuweather.com', 13, '2022-8-18', 1);
insert into CLIENTS (proj_title, name, email, client_ID, date_applied, exec_ID) values ('Latlux', 'Lula Sorro', 'lsorrod@nationalgeographic.com', 14, '2022-8-10', 1);
insert into CLIENTS (proj_title, name, email, client_ID, date_applied, exec_ID) values ('Flowdesk', 'Roda Castilljo', 'rcastilljoe@skype.com', 15, '2022-8-27', 1);



insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Open-architected multi-tasking installation', 'Magicians', 1, 'Design', 34, 4, 1, '2022-10-18', '2022-10-29', null, false, null, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Polarised grid-enabled attitude', 'Magicians', 5, 'Design', 38, 7, 2, '2022-10-10', '2022-10-17', null, false, null, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Monitored multi-tasking productivity', 'Magicians', 8, 'Design', 1, 8, 3, '2022-10-7', '2022-11-30', null, false, null, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Cross-platform asymmetric system engine', 'Magicians', 3, 'Design', 36, 3, 4, '2022-10-10', '2022-11-13', '2022-10-28', true, 10, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Diverse asymmetric capacity', 'Magicians', 5, 'Design', 22, 11, 5, '2022-11-8', '2022-11-12', '2022-11-11', true, 4, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Front-line web-enabled circuit', 'Magicians', 3, 'Design', 14, 1, 6, '2022-9-5', '2022-10-5', '2022-9-28', true, 5, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Enterprise-wide 6th generation extranet', 'Magicians', 2, 'Design', 15, 2, 7, '2022-10-12', '2022-11-25', '2022-11-25', true, 7, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Up-sized radical capacity', 'Magicians', 7, 'Design', 28, 2, 8, '2022-9-21', '2022-10-24', '2022-10-16', true, 12, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Balanced optimal data-warehouse', 'Magicians', 8, 'Design', 10, 3, 9, '2022-10-5', '2022-11-6', '2022-11-11', true, 3, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Seamless user-facing concept', 'Magicians', 6, 'Design', 38, 6, 10, '2022-9-27', '2022-12-7', null, false, null, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Streamlined systemic initiative', 'Magicians', 1, 'Design', 40, 4, 11, '2022-10-2', '2022-11-20', null, false, null, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Future-proofed exuding groupware', 'Magicians', 8, 'Design', 33, 10, 12, '2022-10-12', '2022-11-11', '2022-10-16', true, 2, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Automated disintermediate framework', 'Magicians', 7, 'Design', 16, 12, 13, '2022-10-8', '2022-11-15', '2022-10-29', true, 3, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Grass-roots stable capability', 'Magicians', 10, 'Design', 18, 10, 14, '2022-10-19', '2022-10-25', '2022-11-1', true, 9, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Intuitive background info-mediaries', 'Magicians', 12, 'Design', 3, 3, 15, '2022-9-20', '2022-11-20', '2022-10-29', true, 10, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Extended human-resource concept', 'Magicians', 8, 'Design', 12, 9, 16, '2022-10-10', '2022-11-26', '2022-11-13', true, null, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Decentralized national encoding', 'Biodex', 2, 'Design', 33, 5, 17, '2022-11-14', '2022-11-24', '2022-11-26', true, 2, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Cross-group multi-state product', 'Biodex', 9, 'Design', 37, 2, 18, '2022-10-27', '2022-11-24', '2022-11-2', true, 5, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Persistent national secured line', 'Biodex', 3, 'Design', 14, 4, 19, '2022-10-22', '2022-12-14', '2022-11-8', true, 4, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Sharable analyzing standardization', 'Biodex', 1, 'Design', 23, 8, 20, '2022-11-5', '2022-11-25', '2022-11-25', true, 11, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Synchronised interactive hardware', 'Biodex', 5, 'Design', 6, 12, 21, '2022-9-26', '2022-12-17', null, false, null, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Exclusive foreground collaboration', 'Biodex', 7, 'Design', 4, 12, 22, '2022-10-27', '2022-11-2', null, false, null, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Customer-focused intangible success', 'Biodex', 5, 'Design', 9, 9, 23, '2022-10-4', '2022-10-14', '2022-10-31', true, 5, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Balanced local access', 'Biodex', 3, 'Design', 35, 3, 24, null, '2022-11-25', null, false, null, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Stand-alone static initiative', 'Biodex', 11, 'Design', 38, 1, 25, '2022-10-19', '2022-10-21', null, false, null, 'In congue. Etiam justo. Etiam pretium iaculis justo.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Extended intermediate concept', 'Biodex', 1, 'Design', 8, 12, 26, '2022-10-16', '2022-11-12', '2022-11-2', true, 10, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Customizable client-server core', 'Biodex', 1, 'Design', 25, 1, 27, '2022-10-29', '2022-10-31', null, false, null, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Innovative user-facing hierarchy', 'Biodex', 12, 'Design', 23, 9, 28, '2022-10-7', '2022-11-17', null, false, null, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Quality-focused bi-directional workforce', 'Biodex', 11, 'Design', 22, 5, 29, '2022-11-10', '2022-11-13', '2022-11-20', true, 6, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Universal hybrid database', 'Biodex', 12, 'Design', 28, 2, 30, '2022-10-2', '2022-10-16', '2022-10-29', true, 7, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Cross-group multi-state core', 'Biodex', 8, 'Design', null, 7, 31, null, null, null, false, null, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Organic neutral portal', 'Biodex', 10, 'Design', 10, 5, 32, '2022-10-31', '2022-11-30', null, false, null, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Reverse-engineered local function', 'Biodex', 8, 'Design', 15, 7, 33, '2022-11-2', '2022-11-25', '2022-11-13', true, 5, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Customer-focused cohesive neural-net', 'Magicians', 4, 'Design', 29, 3, 34, '2022-11-4', '2022-12-4', null, false, null, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Multi-tiered background parallelism', 'Treeflex', 12, 'Design', 25, 12, 35, '2022-9-20', '2022-10-16', null, false, null, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Inverse context-sensitive intranet', 'Treeflex', 6, 'Design', 8, 2, 36, '2022-10-21', '2022-10-30', '2022-10-29', true, 5, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Open-architected multi-tasking paradigm', 'Treeflex', 3, 'Design', 39, 11, 37, '2022-10-19', '2022-10-28', '2022-10-28', true, 7, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Innovative demand-driven framework', 'Treeflex', 7, 'Design', 30, 1, 38, '2022-10-8', '2022-10-17', '2022-10-19', true, 11, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Persistent 24/7 data-warehouse', 'Treeflex', 6, 'Design', 38, 9, 39, '2022-11-4', '2022-11-24', '2022-11-19', true, 12, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Cross-platform fault-tolerant attitude', 'Treeflex', 10, 'Design', 8, 5, 40, '2022-10-3', '2022-11-7', '2022-11-2', true, 3, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Customer-focused tangible support', 'Treeflex', 10, 'Design', 36, 7, 41, '2022-9-13', '2022-10-30', '2022-10-21', true, 4, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Visionary asymmetric installation', 'Treeflex', 4, 'Design', 40, 5, 42, '2022-10-7', '2022-10-17', null, false, null, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('User-centric eco-centric methodology', 'Treeflex', 10, 'Design', 20, 5, 43, '2022-10-6', '2022-10-12', '2022-10-19', true, 1, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Programmable logistical encoding', 'Treeflex', 2, 'Design', 28, 7, 44, '2022-11-3', '2022-12-11', '2022-11-30', true, 2, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Proactive systemic standardization', 'Treeflex', 11, 'Design', 37, 3, 45, '2022-10-30', '2022-11-30', '2022-11-20', true, 3, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Quality-focused client-server function', 'Treeflex', 6, 'Design', 13, 12, 46, '2022-10-2', '2022-12-15', '2022-11-12', true, 5, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Secured local website', 'Treeflex', 7, 'Design', 3, 11, 47, '2022-11-14', '2022-11-30', '2022-11-17', true, 15, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Enterprise-wide background initiative', 'Treeflex', 8, 'Design', 32, 4, 48, '2022-10-14', '2022-11-28', '2022-11-12', true, 7, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Programmable high-level groupware', 'Treeflex', 5, 'Design', 34, 6, 49, '2022-10-25', '2022-12-3', null, false, null, 'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Ameliorated bi-directional migration', 'Treeflex', 5, 'Design', 18, 3, 50, '2022-11-3', '2022-11-8', '2022-11-12', true, 3, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Pre-emptive actuating projection', 'Treeflex', 1, 'Design', 8, 6, 51, '2022-11-14', '2022-11-23', null, false, null, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Integrated holistic capability', 'Stereo', 6, 'Design', 38, 6, 52, '2022-9-25', '2022-10-3', null, false, null, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Self-enabling demand-driven core', 'Stereo', 4, 'Design', 23, 4, 53, '2022-10-8', '2022-10-28', '2022-10-23', true, 1, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Total object-oriented solution', 'Stereo', 2, 'Design', null, 7, 54, null, null, null, false, null, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Implemented analyzing database', 'Stereo', 6, 'Design', null, 2, 55, null, null, null, false, null, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Profound motivating functionalities', 'Stereo', 10, 'Design', 22, 1, 56, '2022-11-15', '2022-11-28', '2022-11-23', true, 5, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Managed object-oriented process improvement', 'Stereo', 7, 'Design', 33, 3, 57, '2022-11-12', '2022-11-28', '2022-11-27', true, 8, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Innovative local monitoring', 'Stereo', 3, 'Design', 4, 9, 58, '2022-10-5', '2022-10-15', null, false, null, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Intuitive web-enabled capability', 'Stereo', 6, 'Design', 20, 2, 59, '2022-9-24', '2022-10-6', null, false, null, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('User-friendly coherent internet solution', 'Stereo', 8, 'Backend', 27, 6, 60, '2022-10-4', '2022-10-21', null, false, null, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Reactive system-worthy array', 'Stereo', 2, 'Design', 1, 6, 61, '2022-11-24', '2022-11-29', '2022-11-25', true, 6, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Total real-time projection', 'Stereo', 2, 'Design', 7, 11, 62, '2022-10-19', '2022-11-28', '2022-11-12', true, 8, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Re-engineered value-added complexity', 'Stereo', 8, 'Design', 10, 12, 63, '2022-10-3', '2022-11-4', '2022-10-23', true, 6, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Profound discrete task-force', 'Stereo', 3, 'Design', null, 8, 64, null, null, null, false, null, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('User-friendly non-volatile paradigm', 'Stereo', 8, 'Design', 32, 10, 65, '2022-10-30', '2022-11-11', '2022-11-10', true, 9, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Pre-emptive directional local area network', 'Stereo', 5, 'Design', null, 10, 66, null, null, null, false, null, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Multi-lateral intangible algorithm', 'Stim', 4, 'Design', 31, 8, 67, '2022-10-20', '2022-10-27', '2022-10-21', true, 1, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Enhanced leading edge info-mediaries', 'Stereo', 3, 'Design', 12, 1, 68, '2022-11-3', '2022-11-7', '2022-11-7', true, 3, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Persevering eco-centric productivity', 'Stim', 5, 'Design', 1, 12, 69, '2022-11-14', '2022-12-14', null, false, null, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Business-focused hybrid extranet', 'Stim', 8, 'Design', 39, 6, 70, '2022-11-2', '2022-11-13', '2022-11-10', true, 5, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Organic user-facing synergy', 'Stim', 7, 'Design', 20, 3, 71, '2022-10-2', '2022-11-16', null, false, null, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Multi-layered real-time capability', 'Stim', 5, 'Design', 24, 3, 72, '2022-10-17', '2022-10-29', '2022-10-26', true, 4, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Horizontal impactful customer loyalty', 'Stim', 7, 'Design', 30, 1, 73, '2022-10-5', '2022-10-17', '2022-10-27', true, 4, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Right-sized transitional access', 'Stim', 5, 'Design', 32, 2, 74, '2022-10-28', '2022-11-3', null, false, null, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Inverse holistic initiative', 'Stim', 10, 'Design', 2, 6, 75, '2022-11-5', '2022-11-25', '2022-11-12', true, 10, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Profound intermediate process improvement', 'Stim', 2, 'Design', 38, 2, 76, '2022-10-19', '2022-11-8', '2022-11-12', true, 2, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Sharable holistic benchmark', 'Stim', 3, 'Design', 32, 10, 77, '2022-11-11', '2022-11-28', '2022-11-14', true, 5, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Open-architected zero administration utilisation', 'Stim', 8, 'Design', 24, 7, 78, '2022-11-2', '2022-11-14', null, false, null, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Team-oriented non-volatile infrastructure', 'Stim', 4, 'Design', 7, 8, 79, '2022-10-18', '2022-10-24', '2022-10-21', true, 9, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Business-focused national time-frame', 'Stim', 11, 'Design', 28, 4, 80, '2022-10-10', '2022-10-26', '2022-10-19', true, 6, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Mandatory incremental budgetary management', 'Stim', 6, 'Design', 12, 11, 81, '2022-10-10', '2022-10-16', '2022-10-17', true, 4, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Asynchronous artificial intelligence', 'Stim', 10, 'Design', 25, 2, 82, '2022-11-7', '2022-11-13', '2022-11-14', true, 4, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Operative dedicated utilisation', 'Stim', 12, 'Design', 16, 12, 83, '2022-10-14', '2022-10-26', '2022-10-25', true, 4, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Phased object-oriented protocol', 'Stim', 9, 'Design', 7, 4, 84, '2022-10-28', '2022-11-16', '2022-11-22', true, 6, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Multi-lateral methodical capacity', 'Rank', 2, 'Design', 21, 8, 85, '2022-10-1', '2022-10-8', null, false, null, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Object-based system-worthy adapter', 'Rank', 11, 'Design', 24, 4, 86, '2022-10-22', '2022-11-14', null, false, null, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Open-architected regional functionalities', 'Rank', 5, 'Design', 22, 7, 87, '2022-11-1', '2022-11-30', null, false, null, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Team-oriented demand-driven projection', 'Rank', 9, 'Design', 23, 1, 88, '2022-10-12', '2022-10-23', null, false, null, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Implemented asymmetric process improvement', 'Rank', 4, 'Design', 2, 2, 89, '2022-11-17', '2022-11-27', null, false, null, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Synergized client-server benchmark', 'Rank', 4, 'Design', 4, 7, 90, '2022-11-12', '2022-11-19', '2022-11-21', true, 3, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Inverse background focus group', 'Rank', 11, 'Design', 6, 6, 91, '2022-10-27', '2022-11-4', null, false, null, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Managed systemic leverage', 'Rank', 11, 'Design', 9, 3, 92, '2022-10-10', '2022-10-22', '2022-10-25', true, 8, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Adaptive value-added challenge', 'Rank', 11, 'Design', 29, 12, 93, '2022-11-11', '2022-12-5', null, false, null, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Switchable intangible info-mediaries', 'Rank', 8, 'Design', null, 5, 94, null, null, null, false, null, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Automated asymmetric knowledge base', 'Rank', 5, 'Design', 31, 10, 95, '2022-10-2', '2022-11-9', null, false, null, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Switchable leading edge architecture', 'Rank', 6, 'Design', 22, 12, 96, '2022-11-14', '2022-11-17', '2022-11-21', true, 7, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Pre-emptive analyzing contingency', 'Rank', 11, 'Design', 30, 7, 97, '2022-10-12', '2022-11-15', '2022-11-5', true, 10, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Extended uniform challenge', 'Rank', 8, 'Design', 21, 12, 98, '2022-10-26', '2022-11-11', '2022-11-2', true, 2, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Progressive contextually-based hierarchy', 'Rank', 3, 'Design', 40, 6, 99, '2022-10-27', '2022-11-16', null, false, null, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Ergonomic mission-critical knowledge base', 'Rank', 7, 'Design', 30, 8, 100, '2022-10-18', '2022-11-14', '2022-11-14', true, 3, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Robust didactic policy', 'Kawa', 6, 'Design', 6, 9, 101, '2022-10-21', '2022-11-18', '2022-11-14', true, 4, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Fully-configurable methodical architecture', 'Kawa', 5, 'Design', 2, 5, 102, '2022-10-25', '2022-11-12', null, false, null, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Persistent multi-tasking intranet', 'Kawa', 4, 'Frontend', 36, 6, 103, '2022-10-30', '2022-11-6', null, false, null, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Organic reciprocal implementation', 'Kawa', 4, 'Frontend', 27, 1, 104, '2022-11-17', '2022-12-3', null, false, null, 'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Team-oriented responsive info-mediaries', 'Kawa', 12, 'Frontend', 27, 12, 105, '2022-10-11', '2022-11-11', null, false, null, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Centralized web-enabled Graphical User Interface', 'Kawa', 4, 'Frontend', 20, 9, 106, '2022-10-16', '2022-11-14', '2022-11-2', true, 5, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Managed content-based software', 'Kawa', 5, 'Frontend', 34, 7, 107, '2022-11-17', '2022-11-27', null, false, null, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Automated content-based model', 'Kawa', 4, 'Frontend', 14, 9, 108, '2022-10-15', '2022-11-26', null, false, null, 'Fusce consequat. Nulla nisl. Nunc nisl.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Enhanced composite open architecture', 'Kawa', 3, 'Frontend', 9, 7, 109, '2022-10-29', '2022-11-3', '2022-11-2', true, 2, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Reduced multi-state core', 'Kawa', 8, 'Frontend', 10, 11, 110, '2022-10-30', '2022-11-7', '2022-11-9', true, 6, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Cross-group client-server challenge', 'Kawa', 10, 'Frontend', 15, 9, 111, '2022-9-20', '2022-10-24', null, false, null, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('User-centric eco-centric application', 'Kawa', 6, 'Frontend', 37, 1, 112, '2022-10-9', '2022-11-24', null, false, null, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Cloned disintermediate toolset', 'Kawa', 3, 'Frontend', 27, 9, 113, '2022-10-21', '2022-10-29', '2022-10-24', true, 8, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Virtual transitional forecast', 'Kawa', 6, 'Frontend', 22, 2, 114, '2022-9-29', '2022-10-31', null, false, null, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Monitored radical knowledge base', 'Kawa', 12, 'Frontend', 39, 2, 115, '2022-11-14', '2022-11-30', null, false, null, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Compatible dynamic parallelism', 'Kawa', 8, 'Frontend', 7, 4, 116, '2022-10-19', '2022-11-2', '2022-11-7', true, 9, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Diverse mission-critical open system', 'Kawa', 2, 'Frontend', 10, 2, 117, '2022-10-30', '2022-11-17', '2022-11-3', true, 8, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Future-proofed multi-state knowledge base', 'Bitwolf', 6, 'Frontend', 10, 10, 118, '2022-10-27', '2022-11-17', '2022-11-7', true, 8, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Solution-oriented knowledge base', 'Bitwolf', 8, 'Frontend', 10, 5, 119, '2022-10-2', '2022-10-15', '2022-10-19', true, 4, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Monitored 24 hour software', 'Bitwolf', 11, 'Frontend', 25, 6, 120, '2022-10-24', '2022-11-3', '2022-11-6', true, 14, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Persistent client-driven encoding', 'Bitwolf', 12, 'Frontend', 25, 1, 121, '2022-9-21', '2022-10-26', '2022-10-3', true, 3, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('De-engineered mobile structure', 'Bitwolf', 12, 'Frontend', null, 6, 122, null, null, null, false, null, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Persistent bi-directional moratorium', 'Bitwolf', 3, 'Frontend', 3, 9, 123, '2022-10-23', '2022-11-28', null, false, null, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Vision-oriented grid-enabled throughput', 'Bitwolf', 1, 'Frontend', 8, 5, 124, '2022-10-23', '2022-11-19', '2022-11-6', true, 1, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Versatile transitional forecast', 'Bitwolf', 8, 'Frontend', null, 3, 125, null, null, null, false, null, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Realigned motivating process improvement', 'Bitwolf', 5, 'Frontend', 2, 11, 126, '2022-10-23', '2022-11-23', '2022-11-17', false, null, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Re-contextualized system-worthy paradigm', 'Bitwolf', 4, 'Frontend', 37, 1, 127, '2022-10-2', '2022-10-19', '2022-10-14', true, 2, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Synergized bi-directional hub', 'Bitwolf', 7, 'Frontend', 7, 1, 128, '2022-10-30', '2022-11-27', null, false, null, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Polarised homogeneous analyzer', 'Bitwolf', 2, 'Frontend', 24, 6, 129, '2022-10-19', '2022-10-25', '2022-10-23', true, 2, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Synergized content-based data-warehouse', 'Bitwolf', 8, 'Frontend', 34, 11, 130, '2022-10-26', '2022-11-8', '2022-11-2', true, 3, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Multi-channelled systemic circuit', 'Bitwolf', 12, 'Frontend', 13, 7, 131, '2022-10-22', '2022-11-15', '2022-11-5', true, 5, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Horizontal composite neural-net', 'Bitwolf', 7, 'Frontend', 20, 11, 132, '2022-11-7', '2022-11-24', '2022-11-25', true, 3, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Intuitive even-keeled adapter', 'Bitwolf', 4, 'Frontend', 39, 8, 133, '2022-10-2', '2022-11-4', '2022-11-3', true, 5, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Secured client-driven middleware', 'Bitwolf', 6, 'Frontend', 40, 9, 134, '2022-10-17', '2022-11-15', null, false, null, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Proactive radical firmware', 'Bitwolf', 11, 'Frontend', 6, 6, 135, '2022-10-3', '2022-11-30', null, false, null, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Public-key human-resource standardization', 'Tempsoft', 12, 'Backend', null, 2, 136, null, null, null, false, null, 'Fusce consequat. Nulla nisl. Nunc nisl.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Synergized motivating monitoring', 'Tempsoft', 2, 'Frontend', 2, 6, 137, '2022-10-18', '2022-10-25', '2022-10-27', true, 5, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Customer-focused discrete implementation', 'Tempsoft', 9, 'Frontend', 32, 11, 138, '2022-10-4', '2022-10-17', '2022-10-17', true, 8, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Balanced regional protocol', 'Tempsoft', 2, 'Frontend', 40, 5, 139, '2022-10-5', '2022-10-25', null, false, null, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('De-engineered solution-oriented definition', 'Tempsoft', 8, 'Frontend', null, 7, 140, null, null, null, false, null, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Versatile bottom-line model', 'Stronghold', 9, 'Frontend', 38, 11, 141, '2022-10-20', '2022-11-25', null, false, null, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Re-engineered grid-enabled capacity', 'Tempsoft', 2, 'Frontend', 3, 2, 142, '2022-11-1', '2022-11-16', null, false, null, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('User-friendly exuding strategy', 'Stronghold', 12, 'Frontend', 11, 9, 143, '2022-11-1', '2022-11-10', '2022-11-10', true, 3, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Re-contextualized 6th generation functionalities', 'Tempsoft', 6, 'Frontend', 33, 8, 144, '2022-10-1', '2022-11-10', '2022-11-10', true, 5, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Configurable asymmetric moratorium', 'Stronghold', 6, 'Frontend', 5, 11, 145, '2022-10-12', '2022-10-17', '2022-10-24', true, 4, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Assimilated bifurcated superstructure', 'Tempsoft', 3, 'Frontend', 7, 5, 146, '2022-10-8', '2022-11-10', '2022-10-30', true, 4, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Centralized demand-driven internet solution', 'Stronghold', 9, 'Frontend', 35, 6, 147, '2022-9-27', '2022-10-7', '2022-10-16', true, 4, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Centralized dedicated success', 'Stronghold', 2, 'Frontend', 2, 5, 148, '2022-11-14', '2022-11-25', null, false, null, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Open-architected asymmetric emulation', 'Stronghold', 12, 'Frontend', 25, 9, 149, '2022-10-1', '2022-11-25', '2022-11-25', true, 6, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Reduced encompassing encoding', 'Tempsoft', 12, 'Frontend', 30, 10, 150, '2022-11-3', '2022-11-14', '2022-11-10', true, 9, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Function-based transitional capacity', 'Stronghold', 4, 'Frontend', 23, 10, 151, '2022-11-3', '2022-11-14', '2022-11-25', true, 12, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Operative asymmetric protocol', 'Stronghold', 7, 'Frontend', 20, 1, 152, '2022-10-7', '2022-10-27', '2022-10-23', true, 3, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Progressive national adapter', 'Tempsoft', 12, 'Frontend', 27, 12, 153, '2022-11-10', '2022-11-25', '2022-11-10', true, 3, 'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Inverse needs-based frame', 'Stronghold', 7, 'Frontend', 30, 6, 154, '2022-11-5', '2022-12-5', '2022-11-14', true, 2, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Face to face actuating help-desk', 'Tempsoft', 8, 'Frontend', 34, 3, 155, '2022-9-28', '2022-11-8', null, false, null, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Profit-focused radical system engine', 'Stronghold', 8, 'Frontend', 11, 1, 156, '2022-10-26', '2022-11-16', null, false, null, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Enterprise-wide stable initiative', 'Tempsoft', 6, 'Frontend', 2, 10, 157, '2022-10-25', '2022-11-28', null, false, null, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Right-sized secondary artificial intelligence', 'Stronghold', 10, 'Frontend', 21, 5, 158, '2022-11-5', '2022-11-27', '2022-11-24', true, null, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Grass-roots multi-tasking portal', 'Tempsoft', 4, 'Frontend', null, 10, 159, null, null, null, false, null, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Profound clear-thinking toolset', 'Stronghold', 9, 'Frontend', 9, 10, 160, '2022-11-7', '2022-11-29', null, false, null, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Vision-oriented system-worthy concept', 'Tempsoft', 6, 'Frontend', 25, 7, 161, '2022-9-27', '2022-10-17', null, false, null, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Re-engineered zero defect synergy', 'Stronghold', 7, 'Gissing', 19, 10, 162, '2022-10-21', '2022-11-2', '2022-11-11', true, 4, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Exclusive neutral definition', 'Tempsoft', 10, 'Frontend', 11, 2, 163, '2022-11-6', '2022-10-20', '2022-11-22', true, 8, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Open-architected coherent orchestration', 'Stronghold', 11, 'Frontend', 15, 12, 164, '2022-10-15', '2022-10-20', null, false, null, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Virtual disintermediate archive', 'Tempsoft', 12, 'Frontend', 9, 5, 165, '2022-11-5', '2022-11-24', '2022-11-23', true, 8, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Phased neutral approach', 'Stronghold', 2, 'Frontend', 38, 1, 166, '2022-11-18', '2022-11-28', null, false, null, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Right-sized 24/7 throughput', 'Stronghold', 5, 'Frontend', 6, 5, 167, '2022-9-21', '2022-11-2', null, false, null, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Phased fault-tolerant approach', 'Cookley', 2, 'Frontend', 5, 2, 168, '2022-10-30', '2022-11-11', '2022-11-24', true, 2, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Implemented asymmetric framework', 'Cookley', 6, 'Frontend', 33, 5, 169, '2022-10-30', '2022-11-30', '2022-11-30', true, 1, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Total 3rd generation benchmark', 'Flowdesk', 5, 'Frontend', 8, 6, 170, '2022-11-2', '2022-11-30', '2022-11-24', true, 7, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Ameliorated grid-enabled architecture', 'Cookley', 2, 'Frontend', 15, 10, 171, '2022-10-12', '2022-11-2', null, false, null, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Fundamental homogeneous capacity', 'Flowdesk', 9, 'Frontend', 32, 5, 172, '2022-10-24', '2022-11-14', null, false, null, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Universal 3rd generation budgetary management', 'Cookley', 4, 'Frontend', 24, 12, 173, '2022-10-2', '2022-11-30', '2022-10-30', true, 4, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Streamlined mobile moderator', 'Flowdesk', 12, 'Frontend', 3, 9, 174, '2022-10-21', '2022-10-28', '2022-10-23', true, 1, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Pre-emptive next generation matrices', 'Cookley', 12, 'Frontend', 16, 7, 175, '2022-11-16', '2022-11-22', null, true, 3, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Synergized background project', 'Flowdesk', 6, 'Frontend', 40, 9, 176, '2022-10-28', '2022-11-2', '2022-11-2', true, 2, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Multi-tiered logistical circuit', 'Cookley', 2, 'Frontend', 14, 1, 177, '2022-10-25', '2022-10-31', '2022-11-4', true, 2, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Multi-channelled holistic system engine', 'Flowdesk', 9, 'Frontend', 16, 8, 178, '2022-11-9', '2022-12-12', null, false, null, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Fully-configurable disintermediate encryption', 'Cookley', 9, 'Frontend', 6, 6, 179, '2022-10-4', '2022-11-11', '2022-10-8', true, 2, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Total intermediate website', 'Flowdesk', 4, 'Frontend', 30, 11, 180, '2022-11-15', '2022-12-18', null, false, null, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Visionary interactive model', 'Cookley', 12, 'Frontend', 37, 1, 181, '2022-11-10', '2022-12-5', null, false, null, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Organic regional functionalities', 'Flowdesk', 1, 'Frontend', 35, 2, 182, '2022-11-8', '2022-12-19', null, false, null, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Multi-lateral directional core', 'Cookley', 9, 'Frontend', 40, 2, 183, '2022-10-26', '2022-11-30', '2022-11-27', true, 2, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Digitized eco-centric intranet', 'Flowdesk', 10, 'Frontend', 35, 2, 184, '2022-10-15', '2022-10-31', '2022-10-24', true, 4, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Polarised background pricing structure', 'Cookley', 10, 'Frontend', 20, 10, 185, '2022-9-28', '2022-12-15', '2022-11-15', true, 3, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Phased fresh-thinking migration', 'Flowdesk', 1, 'Frontend', 12, 6, 186, '2022-10-4', '2022-12-4', '2022-10-29', true, 3, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Seamless composite neural-net', 'Cookley', 6, 'Frontend', 13, 7, 187, '2022-11-15', '2022-11-24', null, false, null, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Progressive maximized help-desk', 'Flowdesk', 3, 'Backend', 25, 7, 188, '2022-11-16', '2022-12-7', null, false, null, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Adaptive 5th generation protocol', 'Cookley', 1, 'Backend', null, 8, 189, null, null, null, false, null, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Enterprise-wide human-resource task-force', 'Cookley', 10, 'Backend', 19, 7, 190, '2022-10-16', '2022-11-29', null, false, null, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Synergized 4th generation standardization', 'Flowdesk', 8, 'Backend', 32, 12, 191, '2022-10-20', '2022-11-15', null, false, null, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Implemented modular system engine', 'Cookley', 11, 'Backend', 14, 10, 192, '2022-11-1', '2022-11-15', '2022-11-7', true, 6, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Stand-alone uniform hub', 'Flowdesk', 6, 'Backend', 16, 9, 193, '2022-10-8', '2022-11-8', null, false, null, 'In congue. Etiam justo. Etiam pretium iaculis justo.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Ameliorated context-sensitive knowledge base', 'Cookley', 10, 'Backend', 6, 5, 194, '2022-11-6', '2022-11-27', null, false, null, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Extended asynchronous analyzer', 'Flowdesk', 12, 'Backend', 17, 11, 195, '2022-10-31', '2022-11-6', '2022-11-1', true, 4, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Solution-oriented GUI', 'Cookley', 4, 'Backend', 19, 9, 196, '2022-10-30', '2022-11-10', null, false, null, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Diverse impactful protocol', 'Flowdesk', 3, 'Backend', 10, 8, 197, '2022-11-4', '2022-12-18', null, false, null, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Organized even-keeled contingency', 'Cookley', 8, 'Backend', 34, 5, 198, '2022-10-4', '2022-11-12', '2022-11-11', true, 5, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('Multi-tiered bandwidth-monitored core', 'Flowdesk', 11, 'Backend', 19, 6, 199, '2022-11-10', '2022-12-1', null, false, null, 'Fusce consequat. Nulla nisl. Nunc nisl.');
insert into TASK (name, proj_title, client_ID, type, member_ID, lead_ID, task_number, date_assigned, date_due, date_finished, completion_status, hours, description) values ('User-friendly context-sensitive hub', 'Cookley', 3, 'Backend', 26, 2, 200, '2022-10-21', '2022-11-1', null, false, null, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.');

insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (106, 'Tempsoft', 10);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (186, 'Tempsoft', 3);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (196, 'Bitwolf', 12);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (93, 'Bitwolf', 9);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (90, 'Treeflex', 1);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (60, 'Treeflex', 5);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (128, 'Rank', 8);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (57, 'Rank', 6);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (171, 'Stim', 2);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (117, 'Stim', 10);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (194, 'Stereo', 8);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (149, 'Stereo', 9);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (94, 'Stronghold', 3);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (141, 'Stronghold', 10);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (111, 'Cookley', 1);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (195, 'Cookley', 8);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (138, 'Kawa', 3);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (79, 'Kawa', 1);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (113, 'Biodex', 1);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (71, 'Biodex', 7);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (152, 'Magicians', 7);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (120, 'Magicians', 10);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (104, 'Magicians', 3);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (77, 'Flowdesk', 7);
insert into CLIENTS_MEETING (meeting_ID, proj_title, client_ID) values (69, 'Flowdesk', 5);


insert into MEMBER_MEETING (meeting_ID, member_ID) values (92, 12);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (170, 2);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (102, 14);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (150, 10);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (58, 3);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (87, 6);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (196, 14);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (152, 30);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (122, 12);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (153, 14);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (77, 18);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (96, 29);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (26, 2);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (174, 4);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (189, 9);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (108, 27);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (127, 19);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (104, 15);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (70, 3);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (60, 33);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (140, 7);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (11, 34);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (49, 1);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (181, 20);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (28, 15);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (189, 12);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (33, 40);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (21, 10);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (198, 17);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (19, 22);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (97, 35);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (146, 38);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (46, 38);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (153, 7);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (180, 14);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (74, 17);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (16, 31);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (123, 17);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (1, 39);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (121, 33);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (189, 17);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (32, 10);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (142, 21);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (29, 23);
insert into MEMBER_MEETING (meeting_ID, member_ID) values (151, 1);


insert into LEADER_MEETING (meeting_ID, lead_ID) values (175, 4);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (59, 7);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (162, 10);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (18, 2);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (176, 2);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (161, 11);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (166, 7);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (39, 1);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (112, 6);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (193, 12);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (108, 1);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (157, 1);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (90, 8);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (111, 5);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (148, 8);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (116, 9);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (175, 1);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (46, 12);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (39, 9);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (167, 3);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (164, 9);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (176, 9);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (144, 4);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (57, 9);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (4, 5);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (193, 3);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (73, 5);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (26, 10);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (55, 5);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (42, 3);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (199, 10);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (102, 5);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (94, 2);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (43, 11);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (160, 2);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (128, 8);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (112, 3);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (99, 8);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (137, 4);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (30, 6);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (57, 10);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (124, 12);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (131, 3);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (21, 11);
insert into LEADER_MEETING (meeting_ID, lead_ID) values (132, 3);
