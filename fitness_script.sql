create database fitness;

USE fitness;

CREATE TABLE Members (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT
);

CREATE TABLE WorkoutSessions (
    session_id INT PRIMARY KEY,
    member_id INT,
    session_date DATE,
    session_time VARCHAR(50),
    activity VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

INSERT INTO Members (
    id,
    name,
    age
)
VALUES  
    (1, 'John Doe', 30),
    (2, 'Jane Smith', 25),
    (3, 'Bob Johnson', 40),
    (4, 'Alice Brown', 35),
    (5, 'Mike Davis', 28);

INSERT INTO WorkoutSessions (
    session_id,
    member_id,
    session_date,
    session_time,
    activity)
VALUES  
    (1, 1, '2022-02-15', '09:30 AM', 'Cycling'),
    (2, 2, '2022-02-16', '07:00 PM', 'Zumba'),
    (3, 3, '2022-02-17', '10:00 AM', 'Strength Training'),
    (4, 4, '2022-02-18', '06:00 PM', 'Yoga'),
    (5, 5, '2022-02-19', '08:00 AM', 'Swimming'),
    (6, 1, '2022-02-22', '09:30 AM', 'Pilates'),
    (7, 2, '2022-02-23', '07:00 PM', 'Running'),
    (8, 3, '2022-02-24', '10:00 AM', 'Weightlifting'),
    (9, 4, '2022-02-25', '06:00 PM', 'Cardio'),
    (10, 5, '2022-02-26', '08:00 AM', 'High-Intensity Interval Training'),
    (11, 1, '2022-03-01', '09:30 AM', 'Dance Fitness');
   
UPDATE WorkoutSessions
SET session_time = '06:00 PM'
WHERE member_id = (SELECT id FROM Members WHERE name = 'John Doe');

DELETE FROM WorkoutSessions
WHERE member_id = (SELECT id FROM Members WHERE name = 'Jane Smith');
DELETE FROM Members
WHERE name = 'Jane Smith';
