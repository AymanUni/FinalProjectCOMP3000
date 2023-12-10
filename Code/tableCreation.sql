DROP TABLE IF EXISTS CheckedDates;
DROP TABLE IF EXISTS Equipment;
DROP TABLE IF EXISTS ProgressNote;
DROP TABLE IF EXISTS HealthMetric;
DROP TABLE IF EXISTS FitnessGoal;
DROP TABLE IF EXISTS Transaction;
DROP TABLE IF EXISTS Session;
DROP TABLE IF EXISTS Admin;
DROP TABLE IF EXISTS Trainer;
DROP TABLE IF EXISTS Member;

CREATE TABLE Member (
    MemberID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255),
    LoyaltyPoints INT
);

CREATE TABLE Trainer (
    TrainerID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255)
);

CREATE TABLE Admin (
    AdminID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255)
);

CREATE TABLE Session (
    SessionID SERIAL PRIMARY KEY,
    Date DATE,
    Time TIME,
    MemberID INT,
    TrainerID INT,
    FOREIGN KEY (MemberID) REFERENCES Member ON DELETE CASCADE,
    FOREIGN KEY (TrainerID) REFERENCES Trainer ON DELETE CASCADE
);

CREATE TABLE Transaction (
    TransactionID SERIAL PRIMARY KEY,
    Date DATE,
    Time TIME,
    Amount DECIMAL(10, 2),
    Service VARCHAR(255),
    MemberID INT,
    AdminID INT,
    FOREIGN KEY (MemberID) REFERENCES Member ON DELETE CASCADE,
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID) ON DELETE CASCADE
);

CREATE TABLE FitnessGoal (
    GoalID SERIAL PRIMARY KEY,
    Description TEXT,
    MemberID INT,
    FOREIGN KEY (MemberID) REFERENCES Member ON DELETE CASCADE
);

CREATE TABLE HealthMetric (
    MetricID SERIAL PRIMARY KEY,
    Type VARCHAR(255),
    Value DECIMAL(10, 2),
    Date DATE,
    MemberID INT,
    FOREIGN KEY (MemberID) REFERENCES Member ON DELETE CASCADE
);

CREATE TABLE ProgressNote (
    NoteID SERIAL PRIMARY KEY,
    Content TEXT,
    Date DATE,
    MemberID INT,
    TrainerID INT,
    FOREIGN KEY (MemberID) REFERENCES Member ON DELETE CASCADE,
    FOREIGN KEY (TrainerID) REFERENCES Trainer ON DELETE CASCADE
);

CREATE TABLE Equipment (
    EquipmentID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Status VARCHAR(255),
    AdminID INT,
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID) ON DELETE CASCADE
);

CREATE TABLE CheckedDates (
    EquipmentID INT,
    CheckedDates DATE,
    PRIMARY KEY (EquipmentID, CheckedDates),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment ON DELETE CASCADE
);