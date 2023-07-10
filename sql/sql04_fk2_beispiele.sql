/* ========================================================================= */
/* Datenbanken und SQL - Kapitel 4.3 Beispiele Daten verknüpfen              */
/* ========================================================================= */

use beispiele;


/* Kap. 4.3.4 Aufgabe 1 */
SELECT s.name, s.email
FROM student s JOIN klasse k ON s.klasse = k.klasse_id
WHERE k.bezeichnung = 'HFSNT.SG.H20';

/* Kap. 4.3.4 Aufgabe 2 */
SELECT r.bezeichnung, r.kapazitaet
FROM raum r JOIN standort s ON r.standort = s.standort_id
WHERE s.name = 'Zürich 1';

/* Kap. 4.3.4 Aufgabe 3 */
SELECT s.name, a.strasse, a.nr, a.plz, a.ort
FROM student s JOIN adresse a ON s.adresse = a.adresse_id
WHERE a.ort = 'St. Gallen';

/* Kap. 4.3.4 Aufgabe 4 */
SELECT s.name Standort, r.bezeichnung Raum , lv.titel Veranstaltung, lv.beginn Von, lv.ende Bis   
FROM lehrveranstaltung lv 
  JOIN  raum r ON lv.raum = r.raum_id                          
  JOIN  standort s ON r.standort = s.standort_id 
WHERE s.name = 'Bern 1' AND lv.beginn BETWEEN '2022-01-24 13:00:00' AND '2022-01-24 17:30:00';

/* Kap. 4.3.4 Aufgabe 5 */
SELECT s.name Standort, r.bezeichnung Raum , f.titel Fach, lv.beginn Von, lv.ende Bis   
FROM lehrveranstaltung lv 
  JOIN  raum r ON lv.raum = r.raum_id                          
  JOIN  fach f ON f.fach_id = lv.fach
  JOIN  standort s ON r.standort = s.standort_id 
WHERE s.name = 'Bern 1' AND lv.beginn BETWEEN '2022-01-24 13:00:00' AND '2022-01-24 17:30:00';

/* Kap. 4.3.4 Aufgabe 6 */
SELECT d.name Name, lv.titel Veranstaltung , s.name Standort, r.bezeichnung Raum , lv.beginn, lv.ende 
FROM raum r JOIN lehrveranstaltung lv ON r.raum_id = lv.raum 
            JOIN standort s ON s.standort_id = r.standort
            JOIN dozent d ON d.dozent_id = lv.dozent
ORDER BY d.name, lv.beginn;

/* Kap. 4.3.4 Aufgabe 7 */
SELECT lv.beginn Beginn, lv.ende Ende , s.name Standort, r.bezeichnung Raum, lv.titel Veranstaltung, f.titel Fach
FROM lehrveranstaltung lv JOIN klasse k ON lv.klasse = k.klasse_id
                          JOIN raum r ON r.raum_id = lv.raum
                          JOIN standort s ON s.standort_id = r.standort
                          JOIN fach f ON f.fach_id = lv.fach
WHERE k.bezeichnung = 'HFSNT.ZH.H20'
ORDER BY lv.beginn;

/* Kap 4.4 INNER und OUTER JOIN */
SELECT k.bezeichnung, lv.titel, d.name
FROM klasse k JOIN lehrveranstaltung lv ON lv.klasse = k.klasse_id
              JOIN dozent d ON lv.dozent = d.dozent_id
WHERE lv.titel = 'ITAR1';


/* Kap 4.4 LEFT JOIN findet auch Veranstaltungen ohne Dozent */
SELECT k.bezeichnung, lv.titel, d.name
FROM klasse k JOIN lehrveranstaltung lv ON lv.klasse = k.klasse_id
              RIGHT JOIN dozent d ON lv.dozent = d.dozent_id
WHERE lv.titel = 'ITAR1';

/* Kap 4.4 RIGHT JOIN findet auch Veranstaltungen ohne Dozent 
   wenn die Reihenfolge der Tabellen umgestellt wird */
SELECT k.bezeichnung, lv.titel, d.name
FROM dozent d LEFT JOIN lehrveranstaltung lv ON d.dozent_id = lv.dozent
              JOIN  klasse k ON lv.klasse = k.klasse_id
WHERE lv.titel = 'ITAR1';



/* Kap. 4.7 Aufgabe 1 - Stundenplan mit Lehrveranstaltungen und Prüfungsterminen für 
die Studentin Hanna Wirz*/
SELECT l.titel, l.beginn, l.ende , sta.name 'Standort', r.bezeichnung 'Raum'
FROM lehrveranstaltung l JOIN klasse k ON l.klasse = k.klasse_id 
                                          JOIN student s ON s.klasse = k.klasse_id
                                          JOIN raum r ON r.raum_id = l.raum
                                          JOIN standort sta ON sta.standort_id = r.standort
WHERE s.name = 'Hanna Wirz'
UNION 
SELECT p.titel, p.beginn, p.ende, sta.name 'Standort', r.bezeichnung 'Raum'
FROM pruefung p JOIN student s ON p.student = s.student_id 
                              JOIN raum r ON r.raum_id = p.raum
							  JOIN standort sta ON sta.standort_id = r.standort
WHERE s.name = 'Hanna Wirz'
ORDER BY beginn;

/* Kap. 4.7 Aufgabe 2 - Self JOIN, um mehrfach vergebene Räume zu finden */
SELECT lv1.titel, lv1.klasse, lv1.raum, lv1.dozent, lv1.beginn, lv2.titel,  lv2.klasse, lv2.raum, lv2.dozent, lv2.beginn
FROM lehrveranstaltung lv1 join lehrveranstaltung lv2 ON lv1.beginn = lv2.beginn AND lv1.raum = lv2.raum AND lv1.klasse != lv2.klasse;

/* Kap. 4.7 Aufgabe 3 - Self JOIN, um doppelt gebuchte Dozenten zu finden */
SELECT lv1.titel, lv1.klasse, lv1.raum, lv1.dozent, lv1.beginn, lv2.titel,  lv2.klasse, lv2.raum, lv2.dozent, lv2.beginn
FROM lehrveranstaltung lv1 join lehrveranstaltung lv2 ON lv1.beginn = lv2.beginn AND lv1.dozent = lv2.dozent AND lv1.klasse != lv2.klasse;

/* ========================================================================= */
/* The end. */
