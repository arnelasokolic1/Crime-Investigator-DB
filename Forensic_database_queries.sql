use forensic_database;
-- Retrieve all cases along with their details
SELECT * FROM Cases;

-- Retrieve all investigators and their respective ranks
SELECT FirstName, LastName, Rank FROM Investigators;

-- Retrieve all suspects involved in a specific case ( CaseID = 2)
SELECT * FROM Suspects WHERE CaseID = 2;

-- Retrieve all evidence collected for a particular case ( CaseID = 3)
SELECT * FROM Evidence WHERE CaseID = 3;

-- Count the total number of cases in the database
SELECT COUNT(*) AS TotalCases FROM Cases;

-- Calculate the average age of suspects
SELECT AVG(Age) AS AverageAgeOfSuspects FROM Suspects;

-- Determine the most common type of evidence found in cases
SELECT Type, COUNT(*) AS EvidenceCount 
FROM Evidence 
GROUP BY Type 
ORDER BY EvidenceCount DESC 
LIMIT 1;

-- Identify the investigators with the highest number of cases assigned
SELECT i.FirstName, i.LastName, COUNT(*) AS NumberOfCasesAssigned
FROM Investigators i
JOIN ForensicReports fr ON i.InvestigatorID = fr.InvestigatorID
GROUP BY i.FirstName, i.LastName
ORDER BY NumberOfCasesAssigned DESC
LIMIT 1;

-- checking referential integrity constraints, and ensuring data consistency
SELECT FirstName, LastName, COUNT(*) AS DuplicateCount
FROM Investigators
GROUP BY FirstName, LastName
HAVING COUNT(*) > 1;



-- Retrieve all open cases: Display all cases that are currently open.
SELECT * FROM Cases WHERE Status = 'Open';

-- Retrieve all closed cases: Display all cases that have been closed.
SELECT * FROM Cases WHERE Status = 'Closed';

-- Display cases with the most recent forensic reports.
SELECT c.*
FROM Cases c
JOIN ForensicReports fr ON c.CaseID = fr.CaseID
ORDER BY fr.ReportDate DESC;

-- Average duration (in days) of cases from the date opened to the date closed.
SELECT AVG(DATEDIFF(DateClosed, DateOpened)) AS AverageCaseDuration FROM Cases WHERE DateClosed IS NOT NULL;

--  Display cases with more than one suspect.
SELECT c.*, COUNT(s.SuspectID) AS NumberOfSuspects
FROM Cases c
JOIN Suspects s ON c.CaseID = s.CaseID
GROUP BY c.CaseID
HAVING NumberOfSuspects > 1;

-- Retrieve all cases along with the names of assigned investigators
SELECT c.CaseID, c.CaseName, c.Description, c.Location, c.DateOpened, c.DateClosed, c.Status,
       CONCAT(i.FirstName, ' ', i.LastName) AS InvestigatorName
FROM Cases c
LEFT JOIN ForensicReports fr ON c.CaseID = fr.CaseID
LEFT JOIN Investigators i ON fr.InvestigatorID = i.InvestigatorID;

-- Retrieve all evidence found in each case along with the case details
SELECT c.CaseID, c.CaseName, e.EvidenceID, e.Description AS EvidenceDescription, e.Type AS EvidenceType,
       e.LocationFound AS EvidenceLocation, e.DateFound AS FoundDate
FROM Cases c
JOIN Evidence e ON c.CaseID = e.CaseID;

-- Retrieve all witnesses for each case along with their statements
SELECT c.CaseID, c.CaseName, w.WitnessID, CONCAT(w.FirstName, ' ', w.LastName) AS WitnessName,
       w.ContactInfo AS WitnessContact, w.Statement AS WitnessStatement
FROM Cases c
JOIN Witnesses w ON c.CaseID = w.CaseID;

-- Retrieve all suspects and their respective cases
SELECT s.SuspectID, s.FirstName, s.LastName, s.Age, s.Gender, s.Description AS SuspectDescription,
       c.CaseID, c.CaseName, c.Description AS CaseDescription
FROM Suspects s
JOIN Cases c ON s.CaseID = c.CaseID;

-- Retrieve all forensic reports along with the details of the investigators and their respective case
SELECT fr.ReportID, fr.ReportDate, fr.Details AS ReportDetails,
       CONCAT(i.FirstName, ' ', i.LastName) AS InvestigatorName, i.Rank AS InvestigatorRank,
       c.CaseID, c.CaseName, c.Description AS CaseDescription
FROM ForensicReports fr
JOIN Investigators i ON fr.InvestigatorID = i.InvestigatorID
JOIN Cases c ON fr.CaseID = c.CaseID;

-- Retrieve cases along with the total number of suspects and witnesses for each case
SELECT c.CaseID, c.CaseName, c.Description AS CaseDescription, c.Location, 
       COUNT(DISTINCT s.SuspectID) AS TotalSuspects,
       COUNT(DISTINCT w.WitnessID) AS TotalWitnesses
FROM Cases c
LEFT JOIN Suspects s ON c.CaseID = s.CaseID
LEFT JOIN Witnesses w ON c.CaseID = w.CaseID
GROUP BY c.CaseID, c.CaseName, c.Description, c.Location;

-- Retrieve investigators along with the number of cases they have closed
SELECT i.FirstName, i.LastName, i.Rank, COUNT(fr.CaseID) AS ClosedCases
FROM Investigators i
LEFT JOIN ForensicReports fr ON i.InvestigatorID = fr.InvestigatorID
LEFT JOIN Cases c ON fr.CaseID = c.CaseID
WHERE c.Status = 'Closed'
GROUP BY i.FirstName, i.LastName, i.Rank;

-- Retrieve cases along with the average age of suspects and the number of pieces of evidence found
SELECT c.CaseID, c.CaseName, c.Description, 
       AVG(s.Age) AS AverageSuspectAge,
       COUNT(e.EvidenceID) AS TotalEvidence
FROM Cases c
LEFT JOIN Suspects s ON c.CaseID = s.CaseID
LEFT JOIN Evidence e ON c.CaseID = e.CaseID
GROUP BY c.CaseID, c.CaseName, c.Description;


-- Retrieve cases along with the oldest and youngest suspects for each case
SELECT c.CaseID, c.CaseName, c.Description AS CaseDescription,
       MAX(s.Age) AS OldestSuspectAge,
       MIN(s.Age) AS YoungestSuspectAge
FROM Cases c
LEFT JOIN Suspects s ON c.CaseID = s.CaseID
GROUP BY c.CaseID, c.CaseName, c.Description;

-- Retrieve cases along with the number of different types of evidence found in each case
SELECT c.CaseID, c.CaseName, c.Description AS CaseDescription,
       COUNT(DISTINCT e.Type) AS UniqueEvidenceTypes
FROM Cases c
LEFT JOIN Evidence e ON c.CaseID = e.CaseID
GROUP BY c.CaseID, c.CaseName, c.Description;

-- Retrieve cases along with the total number of forensic reports filed for each case
SELECT c.CaseID, c.CaseName, COUNT(fr.ReportID) AS TotalForensicReports
FROM Cases c
LEFT JOIN ForensicReports fr ON c.CaseID = fr.CaseID
GROUP BY c.CaseID, c.CaseName;

-- Identify the most common location for cases
SELECT Location, COUNT(*) AS CaseCount
FROM Cases
GROUP BY Location
ORDER BY CaseCount DESC
LIMIT 1;

-- Identify the most common gender among suspects
SELECT Gender, COUNT(*) AS SuspectCount
FROM Suspects
GROUP BY Gender
ORDER BY SuspectCount DESC
LIMIT 1;




