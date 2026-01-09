CREATE TABLE PLAYERS (
  PlayerID int NOT NULL,
  PlayerName varchar(255) NOT NULL,
  Position varchar(1) NOT NULL,
  DateHired date NOT NULL,
  Salary int NOT NULL,
  GamesPlayed int NOT NULL,
  GamesOnRoster int NOT NULL,
  Fouls int NOT NULL,
  YellowCards int NOT NULL,
  RedCards int NOT NULL,
  Offsides int NOT NULL
);

INSERT INTO PLAYERS (PlayerID, PlayerName, Position, DateHired, Salary, GamesPlayed, GamesOnRoster, Fouls, YellowCards, RedCards, Offsides) VALUES
(1, 'Brad Stuver', 'G', DATE '2020-12-28', 676780, 1, 1, 0, 0, 0, 0),
(2, 'Jon Gallagher', 'D',DATE '2020-12-13', 375000, 1, 1, 0, 0, 0, 0),
(3, 'Julio Cascante', 'D', DATE '2021-04-23', 780000, 1, 1, 1, 0, 0, 0),
(4, 'Zan Kolmanic', 'D', DATE '2021-03-13', 350000, 0, 1, 0, 0, 0, 0),
(5, 'Daniel Pereira', 'M', DATE '2021-04-23', 450000, 1, 1, 2, 0, 0, 0),
(6, 'Owen Wolff', 'M', DATE '2021-09-09', 221600, 1, 1, 1, 0, 0, 0),
(7, 'Diego Rubio', 'F', DATE '2024-01-01', 600000, 0, 1, 0, 0, 0, 0),
(8, 'Brendan Hines-Ike', 'D', DATE '2024-01-01', 500000, 1, 1, 1, 0, 0, 0),
(9, 'Brandon Vázquez', 'F', DATE '2025-01-06', 3200000, 1, 1, 2, 0, 0, 0),
(10, 'Jader Obrian', 'M', DATE '2024-01-01', 350000, 1, 1, 4, 0, 0, 0),
(11, 'I. Sánchez', 'M', DATE '2025-01-01', 320000, 1, 1, 1, 0, 0, 0),
(12, 'S. Cleveland', 'G', DATE '2024-01-01', 150000, 0, 1, 0, 0, 0, 0),
(13, 'C. Fodrey', 'F', DATE '2023-12-21', 108000, 0, 1, 0, 0, 0, 0),
(14, 'G. Biro', 'M', DATE '2024-01-01', 475000, 1, 1, 1, 1, 0, 0),
(15, 'Osman Bukari', 'F', DATE '2024-01-01', 1424800, 1, 1, 1, 0, 0, 0),
(16, 'Mikkel Desler', 'D', DATE '2024-06-03', 550000, 1, 1, 1, 0, 0, 0),
(17, 'Oleksandr Svatok', 'D', DATE '2024-01-01', 500000, 1, 1, 1, 0, 0, 0),
(18, 'Besard Sabovic', 'M', DATE '2025-01-01', 605540, 1, 1, 0, 0, 0, 0),
(19, 'Myrto Uzuni', 'F', DATE '2024-01-01', 1000000, 1, 1, 0, 0, 0, 0),
(20, 'Nikolai Dubersarsky', 'M', DATE '2025-01-01', 300000, 1, 1, 0, 0, 0, 0);

CREATE TABLE STATS_DEFENDER (
  PlayerID int NOT NULL,
  Tackles int NOT NULL,
  CornerKicks int NOT NULL,
  Clearances int NOT NULL,
  Passes int NOT NULL
);

INSERT INTO STATS_DEFENDER (PlayerID, Tackles, CornerKicks, Clearances, Passes) VALUES
(2, 0, 0, 0, 3),
(3, 0, 0, 0, 23),
(4, 0, 0, 0, 0),
(8, 0, 0, 0, 62),
(16, 0, 0, 0, 35),
(17, 0, 0, 0, 21);

CREATE TABLE STATS_FORWARD (
  PlayerID int NOT NULL,
  Goals int NOT NULL,
  ShotsOnGoal int NOT NULL,
  ExpectedGoals int NOT NULL,
  Assists int NOT NULL,
  Passes int NOT NULL
);

INSERT INTO STATS_FORWARD (PlayerID, Goals, ShotsOnGoal, ExpectedGoals, Assists, Passes) VALUES
(7, 0, 0, 0, 0, 0),
(9, 0, 3, 0, 0, 9),
(13, 0, 0, 0, 0, 0),
(15, 0, 2, 0, 0, 18),
(19, 0, 1, 0, 0, 4);

CREATE TABLE STATS_GOAL (
  PlayerID int NOT NULL,
  Saves int NOT NULL,
  AllowedGoals int NOT NULL,
  GoalKicks int NOT NULL
);

INSERT INTO STATS_GOAL (PlayerID, Saves, AllowedGoals, GoalKicks) VALUES
(1, 1, 1, 15),
(12, 0, 0, 0);

CREATE TABLE STATS_MIDFIELDER (
  PlayerID int NOT NULL,
  Goals int NOT NULL,
  ShotsOnGoal int NOT NULL,
  Crosses int NOT NULL,
  Assists int NOT NULL,
  Passes int NOT NULL,
  CornerKicks int NOT NULL,
  Tackles int NOT NULL
);

INSERT INTO STATS_MIDFIELDER (PlayerID, Goals, ShotsOnGoal, Crosses, Assists, Passes, CornerKicks, Tackles) VALUES
(5, 0, 1, 3, 0, 54, 3, 0),
(6, 0, 0, 2, 0, 14, 0, 0),
(10, 0, 1, 0, 0, 10, 0, 0),
(11, 0, 1, 0, 0, 30, 0, 0),
(14, 0, 0, 0, 0, 45, 0, 0),
(18, 0, 2, 0, 0, 17, 0, 0),
(20, 0, 0, 0, 0, 0, 0, 0);

ALTER TABLE PLAYERS
  ADD PRIMARY KEY (PlayerID);
  
ALTER TABLE STATS_DEFENDER
  ADD CONSTRAINT stats_defender_ibfk_1 FOREIGN KEY (PlayerID) REFERENCES PLAYERS (PlayerID);

ALTER TABLE STATS_FORWARD
  ADD CONSTRAINT stats_forward_ibfk_1 FOREIGN KEY (PlayerID) REFERENCES PLAYERS (PlayerID);

ALTER TABLE STATS_GOAL
  ADD CONSTRAINT stats_goal_ibfk_1 FOREIGN KEY (PlayerID) REFERENCES PLAYERS (PlayerID);

ALTER TABLE STATS_MIDFIELDER
  ADD CONSTRAINT stats_midfielder_ibfk_1 FOREIGN KEY (PlayerID) REFERENCES PLAYERS (PlayerID);
COMMIT;