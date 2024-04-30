create database forensic_database;
use forensic_database;
-- Cases table
CREATE TABLE Cases (
    CaseID INT AUTO_INCREMENT PRIMARY KEY,
    CaseName VARCHAR(255),
    Description TEXT,
    Location VARCHAR(255),
    DateOpened DATE,
    DateClosed DATE,
    Status VARCHAR(50)
);

-- Investigators table
CREATE TABLE Investigators (
    InvestigatorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    BadgeNumber VARCHAR(50),
    Rank VARCHAR(50)
);

-- Suspects table
CREATE TABLE Suspects (
    SuspectID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Age INT,
    Gender ENUM('Male', 'Female', 'Other'),
    Description TEXT,
    CaseID INT,
    FOREIGN KEY (CaseID) REFERENCES Cases(CaseID)
);

-- Evidence table
CREATE TABLE Evidence (
    EvidenceID INT AUTO_INCREMENT PRIMARY KEY,
    Description TEXT,
    Type VARCHAR(100),
    LocationFound VARCHAR(255),
    DateFound DATE,
    CaseID INT,
    FOREIGN KEY (CaseID) REFERENCES Cases(CaseID)
);

-- Witnesses table
CREATE TABLE Witnesses (
    WitnessID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    ContactInfo VARCHAR(255),
    Statement TEXT,
    CaseID INT,
    FOREIGN KEY (CaseID) REFERENCES Cases(CaseID)
);

-- ForensicReports table
CREATE TABLE ForensicReports (
    ReportID INT AUTO_INCREMENT PRIMARY KEY,
    ReportDate DATE,
    Details TEXT,
    InvestigatorID INT,
    CaseID INT,
    FOREIGN KEY (InvestigatorID) REFERENCES Investigators(InvestigatorID),
    FOREIGN KEY (CaseID) REFERENCES Cases(CaseID)
);

-- CrimeScenes table
CREATE TABLE CrimeScenes (
    SceneID INT AUTO_INCREMENT PRIMARY KEY,
    Description TEXT,
    Location VARCHAR(255),
    CaseID INT,
    FOREIGN KEY (CaseID) REFERENCES Cases(CaseID)
);


-- data into Cases table
INSERT INTO Cases (CaseName, Description, Location, DateOpened, DateClosed, Status)
VALUES
    ('Theft at Main Street', 'Reported theft of jewelry from a residence.', 'Sarajevo, Bosnia and Herzegovina', '2024-04-01', '2024-04-10', 'Closed'),
    ('Murder in Travnik', 'Murder case reported in the city of Travnik.', 'Travnik, Bosnia and Herzegovina', '2024-03-15', NULL, 'Open'),
    ('Robbery at Bank', 'Bank robbery reported at First Bank.', 'Mostar, Bosnia and Herzegovina', '2024-04-05', NULL, 'Open');

--  data into Investigators table
INSERT INTO Investigators (FirstName, LastName, BadgeNumber, Rank)
VALUES
    ('John', 'Doe', 'INV123', 'Senior Detective'),
    ('Jane', 'Smith', 'INV456', 'Sergeant Investigator'),
    ('Michael', 'Brown', 'INV789', 'Detective');

--  data into Suspects table
INSERT INTO Suspects (FirstName, LastName, Age, Gender, Description, CaseID)
VALUES
    ('Michael', 'Johnson', 30, 'Male', 'Suspect caught on security camera near the crime scene.', 1),
    ('Emily', 'Williams', 25, 'Female', 'Reported to have been involved in the incident.', 2),
    ('David', 'Jones', 35, 'Male', 'Suspect seen leaving the bank shortly after the robbery.', 3);

-- data into Evidence table
INSERT INTO Evidence (Description, Type, LocationFound, DateFound, CaseID)
VALUES
    ('Fingerprint found on the jewelry box.', 'Biological', '123 Main Street, Sarajevo', '2024-04-02', 1),
    ('Bloodstains found on the victim''s clothing.', 'Biological', 'Travnik, Bosnia and Herzegovina', '2024-03-15', 2),
    ('Security camera footage of the robbery.', 'Digital', 'First Bank, Mostar', '2024-04-05', 3);

--  data into Witnesses table
INSERT INTO Witnesses (FirstName, LastName, ContactInfo, Statement, CaseID)
VALUES
    ('Sarah', 'Brown', 'sarah@example.com', 'Witnessed the suspect fleeing from the scene.', 1),
    ('Robert', 'Taylor', 'robert@example.com', 'Saw the incident.', 2),
    ('Jennifer', 'Davis', 'jennifer@example.com', 'Witnessed the robbery while inside the bank.', 3);

--  data into ForensicReports table
INSERT INTO ForensicReports (ReportDate, Details, InvestigatorID, CaseID)
VALUES
    ('2024-04-15', 'Forensic analysis of evidence collected.', 1, 1),
    ('2024-03-20', 'Investigation findings and conclusions.', 2, 2),
    ('2024-04-06', 'Forensic examination of the crime scene.', 3, 3);

--  data into CrimeScenes table
INSERT INTO CrimeScenes (Description, Location, CaseID)
VALUES
    ('Crime scene where the theft occurred.', '123 Main Street, Sarajevo', 1),
    ('Scene of the incident in the city of Travnik.', 'Travnik, Bosnia and Herzegovina', 2),
    ('Bank crime scene.', 'First Bank, Mostar', 3);

-- Insert additional data into Cases table
INSERT INTO Cases (CaseName, Description, Location, DateOpened, DateClosed, Status)
VALUES
    ('Theft at Downtown Street', 'Reported theft of electronics from a shop.', 'Zenica, Bosnia and Herzegovina', '2024-04-15', '2024-04-25', 'Closed'),
    ('Burglary at Suburban House', 'Burglary incident reported at a residential property.', 'Brčko, Bosnia and Herzegovina', '2024-04-20', NULL, 'Open'),
    ('Assault at Local Pub', 'Assault incident reported at a pub.', 'Bihać, Bosnia and Herzegovina', '2024-04-22', NULL, 'Open'),
    ('Arson in Industrial Zone', 'Suspected arson reported at an industrial zone.', 'Goražde, Bosnia and Herzegovina', '2024-04-25', NULL, 'Open'),
    ('Fraudulent Activities', 'Reported fraudulent activities involving financial transactions.', 'Široki Brijeg, Bosnia and Herzegovina', '2024-04-28', '2024-05-05', 'Closed');

-- Insert additional data into Investigators table
INSERT INTO Investigators (FirstName, LastName, BadgeNumber, Rank)
VALUES
    ('Jessica', 'Brown', 'INV124', 'Detective'),
    ('William', 'Johnson', 'INV457', 'Senior Detective'),
    ('Emily', 'Wilson', 'INV790', 'Sergeant Investigator'),
    ('Daniel', 'Martinez', 'INV125', 'Detective'),
    ('Olivia', 'Anderson', 'INV458', 'Senior Detective');

-- Insert additional data into Suspects table
INSERT INTO Suspects (FirstName, LastName, Age, Gender, Description, CaseID)
VALUES
    ('Ryan', 'Clark', 28, 'Male', 'Suspect captured on security camera entering the shop.', 4),
    ('Sophia', 'Hernandez', 33, 'Female', 'Suspect known to have connections with local criminal gangs.', 5),
    ('Ethan', 'Young', 40, 'Male', 'Suspect with a history of violent behavior.', 3),
    ('Ava', 'White', 35, 'Female', 'Suspect involved in financial irregularities.', 2),
    ('Mason', 'Lee', 45, 'Male', 'Suspect seen fleeing the scene of the arson.', 4);

-- Insert additional data into Evidence table
INSERT INTO Evidence (Description, Type, LocationFound, DateFound, CaseID)
VALUES
    ('CCTV footage showing the theft incident.', 'Digital', 'Downtown Street, Zenica', '2024-04-16', 1),
    ('Forensic evidence collected from the burglary site.', 'Biological', 'Suburban House, Brčko', '2024-04-21', 2),
    ('Witness statements regarding the assault.', 'Testimonial', 'Local Pub, Bihać', '2024-04-23', 3),
    ('Samples of flammable materials found at the industrial zone.', 'Physical', 'Industrial Zone, Goražde', '2024-04-26', 4),
    ('Financial documents indicating fraudulent transactions.', 'Documentary', 'Financial Institution, Široki Brijeg', '2024-04-29', 5);

-- Insert additional data into Witnesses table
INSERT INTO Witnesses (FirstName, LastName, ContactInfo, Statement, CaseID)
VALUES
    ('Chloe', 'Taylor', 'chloe@example.com', 'Witnessed the suspect breaking into the shop.', 1),
    ('Liam', 'Harris', 'liam@example.com', 'Witnessed suspicious activity near the residential property.', 2),
    ('Ella', 'Martin', 'ella@example.com', 'Provided information about the altercation at the pub.', 3),
    ('Noah', 'Thompson', 'noah@example.com', 'Observed suspicious individuals in the industrial zone.', 4),
    ('Grace', 'Moore', 'grace@example.com', 'Reported suspicious financial transactions.', 5);

-- Insert additional data into ForensicReports table
INSERT INTO ForensicReports (ReportDate, Details, InvestigatorID, CaseID)
VALUES
    ('2024-04-27', 'Forensic analysis of evidence collected from the crime scene.', 1, 1),
    ('2024-04-22', 'Detailed investigation findings regarding the burglary.', 2, 2),
    ('2024-04-24', 'Analysis of witness statements and evidence related to the assault.', 3, 3),
    ('2024-04-29', 'Investigation into the suspected arson incident.', 4, 4),
    ('2024-05-01', 'Analysis of financial documents and transactions.', 5, 5);

-- Insert additional data into CrimeScenes table
INSERT INTO CrimeScenes (Description, Location, CaseID)
VALUES
    ('Crime scene where the theft took place.', 'Downtown Street, Zenica', 1),
    ('Burglary site at the suburban house.', 'Suburban House, Brčko', 2),
    ('Scene of the assault incident at the local pub.', 'Local Pub, Bihać', 3),
    ('Suspected arson site in the industrial zone.', 'Industrial Zone, Goražde', 4),
    ('Location of financial transactions under investigation.', 'Financial Institution, Široki Brijeg', 5);

   
   -- Insert more data into Cases table
INSERT INTO Cases (CaseName, Description, Location, DateOpened, DateClosed, Status)
VALUES
    ('Vandalism at City Park', 'Reported vandalism incident at the city park.', 'Tuzla, Bosnia and Herzegovina', '2024-05-10', NULL, 'Open'),
    ('Kidnapping of Local Businessman', 'Kidnapping incident reported involving a local businessman.', 'Trebinje, Bosnia and Herzegovina', '2024-05-15', NULL, 'Open'),
    ('Counterfeiting Operation', 'Investigation into counterfeiting operation.', 'Livno, Bosnia and Herzegovina', '2024-05-20', '2024-05-30', 'Closed'),
    ('Drug Trafficking Ring', 'Investigation into a drug trafficking ring.', 'Doboj, Bosnia and Herzegovina', '2024-05-25', NULL, 'Open'),
    ('Embezzlement Scheme', 'Investigation into embezzlement scheme within a company.', 'Čapljina, Bosnia and Herzegovina', '2024-06-01', NULL, 'Open');

-- Insert more data into Investigators table
INSERT INTO Investigators (FirstName, LastName, BadgeNumber, Rank)
VALUES
    ('Benjamin', 'Garcia', 'INV126', 'Detective'),
    ('Sophia', 'Martinez', 'INV459', 'Senior Detective'),
    ('William', 'Lopez', 'INV791', 'Sergeant Investigator'),
    ('Grace', 'Young', 'INV127', 'Detective'),
    ('Lucas', 'Hill', 'INV460', 'Senior Detective');

-- Insert more data into Suspects table
INSERT INTO Suspects (FirstName, LastName, Age, Gender, Description, CaseID)
VALUES
    ('Emma', 'Lewis', 32, 'Female', 'Suspect with previous record of vandalism.', 6),
    ('Alexander', 'Allen', 27, 'Male', 'Suspect believed to be involved in the kidnapping.', 7),
    ('Samantha', 'Wright', 38, 'Female', 'Suspect linked to counterfeit currency production.', 8),
    ('Dylan', 'Scott', 43, 'Male', 'Suspect with ties to drug trafficking activities.', 9),
    ('Madison', 'King', 36, 'Female', 'Suspect involved in financial irregularities.', 10);

-- Insert more data into Evidence table
INSERT INTO Evidence (Description, Type, LocationFound, DateFound, CaseID)
VALUES
    ('Graffiti evidence found at the city park.', 'Physical', 'City Park, Tuzla', '2024-05-11', 6),
    ('Surveillance footage showing the kidnapping incident.', 'Digital', 'Trebinje, Bosnia and Herzegovina', '2024-05-16', 7),
    ('Seized counterfeit currency samples.', 'Documentary', 'Livno, Bosnia and Herzegovina', '2024-05-21', 8),
    ('Confiscated narcotics from a raid.', 'Biological', 'Doboj, Bosnia and Herzegovina', '2024-05-26', 9),
    ('Financial records indicating embezzlement.', 'Documentary', 'Čapljina, Bosnia and Herzegovina', '2024-06-02', 10);

-- Insert more data into Witnesses table
INSERT INTO Witnesses (FirstName, LastName, ContactInfo, Statement, CaseID)
VALUES
    ('Daniel', 'Parker', 'daniel@example.com', 'Witnessed individuals vandalizing the park.', 6),
    ('Isabella', 'Gonzalez', 'isabella@example.com', 'Observed suspicious activity related to the kidnapping.', 7),
    ('Logan', 'Carter', 'logan@example.com', 'Provided information on counterfeit currency transactions.', 8),
    ('Avery', 'Hall', 'avery@example.com', 'Witnessed drug trafficking activities.', 9),
    ('Mia', 'Adams', 'mia@example.com', 'Reported suspicious financial transactions within the company.', 10);

-- Insert more data into ForensicReports table
INSERT INTO ForensicReports (ReportDate, Details, InvestigatorID, CaseID)
VALUES
    ('2024-05-12', 'Forensic analysis of vandalism evidence.', 1, 6),
    ('2024-05-17', 'Detailed investigation findings regarding the kidnapping.', 2, 7),
    ('2024-05-22', 'Analysis of counterfeit currency production methods.', 3, 8),
    ('2024-05-27', 'Investigation into drug trafficking network.', 4, 9),
    ('2024-06-03', 'Analysis of embezzlement scheme within the company.', 5, 10);

-- Insert more data into CrimeScenes table
INSERT INTO CrimeScenes (Description, Location, CaseID)
VALUES
    ('Crime scene where vandalism took place.', 'City Park, Tuzla', 6),
    ('Location where the kidnapping occurred.', 'Trebinje, Bosnia and Herzegovina', 7),
    ('Site of counterfeit currency production operation.', 'Livno, Bosnia and Herzegovina', 8),
    ('Location of drug trafficking activities.', 'Doboj, Bosnia and Herzegovina', 9),
    ('Company premises involved in embezzlement scheme.', 'Čapljina, Bosnia and Herzegovina', 10);

   
   
   -- ADDING MORE DATA INTO DATABASE
   
INSERT INTO Cases (CaseName, Description, Location, DateOpened, DateClosed, Status)
VALUES
    ('Fraudulent Tax Evasion', 'Investigation into fraudulent tax evasion scheme.', 'Banja Luka, Bosnia and Herzegovina', '2024-06-10', '2024-06-25', 'Closed'),
    ('Forgery of Official Documents', 'Investigation into forgery of official documents.', 'Foča, Bosnia and Herzegovina', '2024-06-15', NULL, 'Open'),
    ('Homicide at Mountain Lodge', 'Reported homicide incident at a mountain lodge.', 'Mrkonjić Grad, Bosnia and Herzegovina', '2024-06-20', NULL, 'Open'),
    ('Human Trafficking Ring', 'Investigation into a human trafficking ring.', 'Srebrenica, Bosnia and Herzegovina', '2024-06-25', NULL, 'Open'),
    ('Corporate Espionage Case', 'Investigation into corporate espionage activities.', 'Konjic, Bosnia and Herzegovina', '2024-07-01', NULL, 'Open');

-- Insert more data into Investigators table
INSERT INTO Investigators (FirstName, LastName, BadgeNumber, Rank)
VALUES
    ('Sophie', 'Roberts', 'INV128', 'Detective'),
    ('Ethan', 'Hall', 'INV461', 'Senior Detective'),
    ('Ava', 'Nelson', 'INV792', 'Sergeant Investigator'),
    ('Noah', 'Wright', 'INV129', 'Detective'),
    ('Zoe', 'Mitchell', 'INV462', 'Senior Detective');

-- Insert more data into Suspects table
INSERT INTO Suspects (FirstName, LastName, Age, Gender, Description, CaseID)
VALUES
    ('Jackson', 'Baker', 31, 'Male', 'Suspect with connections to fraudulent tax evasion operations.', 11),
    ('Scarlett', 'Perez', 26, 'Female', 'Suspect linked to forgery of official documents.', 12),
    ('Liam', 'Cook', 37, 'Male', 'Suspect believed to be involved in the homicide at the mountain lodge.', 13),
    ('Nora', 'Cooper', 30, 'Female', 'Suspect connected to human trafficking activities.', 14),
    ('Elijah', 'Bell', 42, 'Male', 'Suspect involved in corporate espionage case.', 15);

-- Insert more data into Evidence table
INSERT INTO Evidence (Description, Type, LocationFound, DateFound, CaseID)
VALUES
    ('Financial records indicating tax evasion.', 'Documentary', 'Banja Luka, Bosnia and Herzegovina', '2024-06-11', 11),
    ('Forged documents seized from suspect''s residence.', 'Documentary', 'Foča, Bosnia and Herzegovina', '2024-06-16', 12),
    ('Forensic evidence collected from the crime scene.', 'Biological', 'Mountain Lodge, Mrkonjić Grad', '2024-06-21', 13),
    ('Evidence of human trafficking found in a raid.', 'Physical', 'Srebrenica, Bosnia and Herzegovina', '2024-06-26', 14),
    ('Digital evidence of corporate espionage activities.', 'Digital', 'Konjic, Bosnia and Herzegovina', '2024-07-02', 15);

-- Insert more data into Witnesses table
INSERT INTO Witnesses (FirstName, LastName, ContactInfo, Statement, CaseID)
VALUES
    ('Mason', 'Evans', 'mason@example.com', 'Provided information on fraudulent tax evasion activities.', 11),
    ('Hannah', 'Rivera', 'hannah@example.com', 'Observed suspect forging official documents.', 12),
    ('Oliver', 'Turner', 'oliver@example.com', 'Witnessed the homicide at the mountain lodge.', 13),
    ('Amelia', 'Howard', 'amelia@example.com', 'Provided information on human trafficking network.', 14),
    ('Evelyn', 'Parker', 'evelyn@example.com', 'Observed suspicious corporate activities.', 15);

-- Insert more data into ForensicReports table
INSERT INTO ForensicReports (ReportDate, Details, InvestigatorID, CaseID)
VALUES
    ('2024-06-12', 'Analysis of financial records and transactions.', 1, 11),
    ('2024-06-17', 'Forensic examination of forged documents.', 2, 12),
    ('2024-06-22', 'Detailed forensic analysis of crime scene evidence.', 3, 13),
    ('2024-06-27', 'Investigation findings regarding human trafficking activities.', 4, 14),
    ('2024-07-03', 'Digital forensic analysis of electronic evidence.', 5, 15);

-- Insert more data into CrimeScenes table
INSERT INTO CrimeScenes (Description, Location, CaseID)
VALUES
    ('Scene of fraudulent tax evasion activities.', 'Banja Luka, Bosnia and Herzegovina', 11),
    ('Location where the forged documents were discovered.', 'Foča, Bosnia and Herzegovina', 12),
    ('Crime scene at the mountain lodge.', 'Mountain Lodge, Mrkonjić Grad', 13),
    ('Site of human trafficking operations.', 'Srebrenica, Bosnia and Herzegovina', 14),
    ('Location of corporate espionage activities.', 'Konjic, Bosnia and Herzegovina', 15);

   
   --- more data
   
INSERT INTO Cases (CaseName, Description, Location, DateOpened, DateClosed, Status)
VALUES
    ('Robbery at Jewelry Store', 'Reported robbery incident at a jewelry store.', 'Mostar, Bosnia and Herzegovina', '2024-07-10', NULL, 'Open'),
    ('Cybercrime Investigation', 'Investigation into cybercrime activities.', 'Cazin, Bosnia and Herzegovina', '2024-07-15', '2024-07-30', 'Closed'),
    ('Missing Persons Case', 'Investigation into a series of missing persons reports.', 'Visoko, Bosnia and Herzegovina', '2024-07-20', NULL, 'Open'),
    ('Illegal Wildlife Trafficking', 'Investigation into illegal trafficking of wildlife.', 'Derventa, Bosnia and Herzegovina', '2024-07-25', NULL, 'Open'),
    ('Art Theft from Museum', 'Reported theft of valuable artworks from a museum.', 'Goražde, Bosnia and Herzegovina', '2024-08-01', NULL, 'Open');

-- Insert more data into Investigators table
INSERT INTO Investigators (FirstName, LastName, BadgeNumber, Rank)
VALUES
    ('Charlotte', 'Young', 'INV130', 'Detective'),
    ('Jack', 'Ward', 'INV463', 'Senior Detective'),
    ('Amelia', 'Cooper', 'INV793', 'Sergeant Investigator'),
    ('Daniel', 'King', 'INV131', 'Detective'),
    ('Lily', 'Hill', 'INV464', 'Senior Detective');

-- Insert more data into Suspects table
INSERT INTO Suspects (FirstName, LastName, Age, Gender, Description, CaseID)
VALUES
    ('Michael', 'Barnes', 35, 'Male', 'Suspect with a history of robbery.', 16),
    ('Ella', 'Wright', 29, 'Female', 'Suspect involved in cybercrime activities.', 17),
    ('James', 'Scott', 33, 'Male', 'Suspect linked to the missing persons cases.', 18),
    ('Olivia', 'Bailey', 40, 'Female', 'Suspect involved in wildlife trafficking.', 19),
    ('Benjamin', 'Mitchell', 28, 'Male', 'Suspect connected to art theft.', 20);

-- Insert more data into Evidence table
INSERT INTO Evidence (Description, Type, LocationFound, DateFound, CaseID)
VALUES
    ('Security footage showing the robbery at the jewelry store.', 'Digital', 'Jewelry Store, Mostar', '2024-07-11', 16),
    ('Digital evidence of cyber intrusions.', 'Digital', 'Online Servers, Cazin', '2024-07-16', 17),
    ('Personal belongings found at the sites of disappearance.', 'Physical', 'Visoko, Bosnia and Herzegovina', '2024-07-21', 18),
    ('Seized wildlife products and documents.', 'Documentary', 'Derventa, Bosnia and Herzegovina', '2024-07-26', 19),
    ('Fingerprints and DNA samples from the museum.', 'Biological', 'Museum, Goražde', '2024-08-02', 20);

-- Insert more data into Witnesses table
INSERT INTO Witnesses (FirstName, LastName, ContactInfo, Statement, CaseID)
VALUES
    ('Emma', 'Turner', 'emma@example.com', 'Witnessed the robbery incident at the jewelry store.', 16),
    ('Carter', 'Parker', 'carter@example.com', 'Provided information on cybercrime activities.', 17),
    ('Madison', 'Collins', 'madison@example.com', 'Reported sightings of missing persons.', 18),
    ('Logan', 'Adams', 'logan@example.com', 'Observed suspicious wildlife trade activities.', 19),
    ('Grace', 'Baker', 'grace@example.com', 'Witnessed the art theft from the museum.', 20);

-- Insert more data into ForensicReports table
INSERT INTO ForensicReports (ReportDate, Details, InvestigatorID, CaseID)
VALUES
    ('2024-07-12', 'Forensic analysis of security footage.', 1, 16),
    ('2024-07-17', 'Investigation findings regarding cyber intrusions.', 2, 17),
    ('2024-07-22', 'Analysis of evidence related to missing persons cases.', 3, 18),
    ('2024-07-27', 'Forensic examination of seized wildlife products.', 4, 19),
    ('2024-08-03', 'Investigation findings regarding the art theft.', 5, 20);

-- Insert more data into CrimeScenes table
INSERT INTO CrimeScenes (Description, Location, CaseID)
VALUES
    ('Crime scene where the jewelry store robbery occurred.', 'Jewelry Store, Mostar', 16),
    ('Location of cybercrime activities.', 'Online Servers, Cazin', 17),
    ('Sites where missing persons were last seen.', 'Visoko, Bosnia and Herzegovina', 18),
    ('Site of illegal wildlife trafficking operations.', 'Derventa, Bosnia and Herzegovina', 19),
    ('Crime scene at the museum.', 'Museum, Goražde', 20);

   