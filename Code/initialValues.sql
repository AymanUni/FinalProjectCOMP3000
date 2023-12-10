-- Populate Member Table
INSERT INTO Member (Name, Email, Password, LoyaltyPoints)
VALUES
('Emma Johnson', 'emma.johnson@fitness.com', 'abc1', 0),
('Liam Smith', 'liam.smith@fitness.com', 'def2', 0),
('Olivia Brown', 'olivia.brown@fitness.com', 'ghi3', 0),
('Noah Davis', 'noah.davis@fitness.com', 'jkl4', 0),
('Ava Miller', 'ava.miller@fitness.com', 'mno5', 0),
('Lucas Wilson', 'lucas.wilson@fitness.com', 'pqr6', 0),
('Sophia Moore', 'sophia.moore@fitness.com', 'stu7', 0),
('Ethan Taylor', 'ethan.taylor@fitness.com', 'vwx8', 0),
('Mia Anderson', 'mia.anderson@fitness.com', 'yz01', 0);

-- Populate Trainer Table
INSERT INTO Trainer (Name, Email, Password)
VALUES
('Oliver Thomas', 'oliver.thomas@fitness.com', 'zyx1'),
('Isabella Jackson', 'isabella.jackson@fitness.com', 'wvu2'),
('Aiden Thompson', 'aiden.thompson@fitness.com', 'tsr3');

-- Populate Admin Table
INSERT INTO Admin (Name, Email, Password)
VALUES
('Emily White', 'admin1@fitness.com', 'qpo1'),
('James Harris', 'admin2@fitness.com', 'nml2');

-- Populate Session Table
INSERT INTO Session (Date, Time, MemberID, TrainerID)
VALUES
('2023-12-01', '12:30:00', 1, 1),
('2023-12-01', '12:30:00', 2, 1),
('2023-12-01', '12:30:00', 3, 1),
('2023-12-04', '14:00:00', 4, 2),
('2023-12-04', '14:00:00', 5, 2),
('2023-12-04', '14:00:00', 6, 2),
('2023-12-09', '15:15:00', 7, 3),
('2023-12-09', '15:15:00', 8, 3),
('2023-12-09', '15:15:00', 9, 3);

-- Populate Transaction Table
INSERT INTO Transaction (Date, Time, Amount, Service, MemberID, AdminID)
VALUES
('2023-03-11', '01:00:00', 50.00, 'Membership', 1, 1),
('2023-04-19', '02:00:00', 50.00, 'Membership', 2, 1),
('2023-05-28', '03:00:00', 50.00, 'Membership', 3, 1),
('2023-06-05', '04:00:00', 50.00, 'Membership', 4, 1),
('2023-07-13', '05:00:00', 50.00, 'Membership', 5, 1),
('2023-08-22', '06:00:00', 50.00, 'Membership', 6, 2),
('2023-09-07', '07:00:00', 50.00, 'Membership', 7, 2),
('2023-10-15', '08:00:00', 50.00, 'Membership', 8, 2),
('2023-11-30', '09:00:00', 50.00, 'Membership', 9, 2);

-- Populate FitnessGoal Table
INSERT INTO FitnessGoal (Description, MemberID)
VALUES
('Lose 5kg in 3 months', 1),
('Plank for 3 minutes', 2),
('Run a 5k in under 30 minutes', 3),
('Do 50 push-ups in a row', 4),
('Swim 20 laps non-stop', 5),
('Do 10 unassisted pullups', 6),
('Bike 15km in under 45 minutes', 7),
('Perform 20 burpees in a row', 8),
('Gain 10kgs in 3 months', 9);

-- Populate HealthMetric Table
INSERT INTO HealthMetric (Type, Value, Date, MemberID)
VALUES
('Weight', 85.00, '2023-12-01', 1),
('BMI', 23.00, '2023-12-01', 2),
('Body Fat %', 20.00, '2023-12-01', 3),
('Weight', 101.00, '2023-12-04', 4),
('Body Fat %', 22.00, '2023-12-04', 5),
('Weight', 62.00, '2023-12-04', 6),
('BMI', 20.00, '2023-12-09', 7),
('Weight', 67.00, '2023-12-09', 8),
('Weight', 70.00, '2023-12-09', 9);

-- Populate ProgressNote Table
INSERT INTO ProgressNote (Content, Date, MemberID, TrainerID)
VALUES
('Great progress this week, keep up the good work!', '2023-12-01', 1, 1),
('Consistency in workout routine is leading to steady progress.', '2023-12-01', 2, 1),
('Achieved personal best time in 5k run.', '2023-12-01', 3, 1),
('Strength training is showing results, increased weight for all exercises.', '2023-12-04', 4, 2),
('Flexibility has improved significantly with regular stretching.', '2023-12-04', 5, 2),
('Nutrition plan is being followed well, positive impact on energy levels.', '2023-12-04', 6, 2),
('Improvement in stamina noted during cardio sessions.', '2023-12-09', 7, 3),
('Form and technique have improved in all exercises.', '2023-12-09', 8, 3),
('Maintained a positive attitude throughout a tough workout week.', '2023-12-20', 9, 3);

-- Populate Equipment Table
INSERT INTO Equipment (Name, Status, AdminID)
VALUES
('Treadmill', 'Working', 1),
('Stationary Bike', 'Working', 1),
('Elliptical Machine', 'Broken', 1),
('Rowing Machine', 'Working', 1),
('Stair Climber', 'Working', 1),
('Cable Pulley Machine', 'Broken', 2),
('Smith Machine', 'Working', 2),
('Leg Press Machine', 'Working', 2),
('Chest Press Machine', 'Broken', 2),
('Lat Pulldown Machine', 'Working', 2),
('Abdominal Crunch Machine', 'Working', 2);

-- Populate CheckedDates Table
INSERT INTO CheckedDates (EquipmentID, CheckedDates)
VALUES
(1, '2023-12-04'),
(2, '2023-12-04'),
(3, '2023-12-04'),
(4, '2023-12-04'),
(5, '2023-12-04'),
(6, '2023-12-04'),
(7, '2023-12-04'),
(8, '2023-12-04'),
(9, '2023-12-04'),
(10, '2023-12-04'),
(11, '2023-12-04');