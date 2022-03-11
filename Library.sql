# 1.
SELECT * FROM tmember
WHERE cName = 'Jens S.'
  AND YEAR(tmember.dBirth) < 1970
  AND YEAR(dNewMember) = '2013';

# 2.
SELECT * FROM tbook WHERE
        nPublishingCompanyID NOT IN (15, 32)
                       OR nPublishingCompanyID = 15 AND nPublishingYear < 2000
                       OR nPublishingCompanyID = 32 AND nPublishingYear < 2000;

# 3.
SELECT cName, cSurname FROM tmember
WHERE cPhoneNo IS NOT NULL AND cAddress IS NULL;

# 4.
SELECT * FROM tauthor WHERE cSurname = 'Byatt'
                        AND LEFT(cName, 1) = 'A' AND cName like '%S%';

# 5.
SELECT COUNT(*) FROM tbook WHERE nPublishingYear = '2007' AND nPublishingCompanyID = '32';

# 6.
SELECT COUNT(*), dLoan FROM tloan WHERE cCPR = '0305393207' AND YEAR(dLoan) = '2014' GROUP BY dLoan;

# 7.
SELECT COUNT(*), dLoan FROM tloan WHERE cCPR = '0305393207' AND YEAR(dLoan) = '2014' GROUP BY dloan HAVING COUNT(*) > 1;

# 8.
SELECT * FROM tmember ORDER BY dNewMember, cSurname, cName DESC;

# 9.
SELECT tbook.cTitle, tbooktheme.nThemeID
FROM tbook
         JOIN tbooktheme ON tbooktheme.nBookID = tbook.nBookID
WHERE nPublishingCompanyID = 32;

# 10.
SELECT cName, cSurname, COUNT(*) AS "# of Books Authored"
FROM tauthorship
         JOIN tbook USING (nBookID)
         JOIN tauthor USING (nAuthorID) GROUP BY tauthor.nAuthorID;

# 11.
SELECT tauthor.cName, tauthor.cSurname, MIN(tbook.nPublishingYear) AS LPY
FROM tauthor
         INNER JOIN tauthorship ON tauthor.nAuthorID = tauthorship.nAuthorID
         INNER JOIN tbook ON tauthorship.nBookID = tbook.nBookID
GROUP BY tauthor.cName;

# 12.
SELECT cSignature, dLoan, cTitle, cName, cSurname
FROM tloan
         JOIN tbookcopy USING (cSignature)
         JOIN tbook USING (nBookID)
         JOIN tmember USING (cCPR)
ORDER BY dLoan DESC;

# 13.

# 14.
SELECT ttheme.cName, tbook.cTitle
FROM ttheme
         LEFT OUTER JOIN tbooktheme ON ttheme.nThemeID = tbooktheme.nThemeID
         LEFT OUTER JOIN tbook ON tbooktheme.nBookID = tbook.nBookID
ORDER BY ttheme.cName;

# 15.
SELECT tmember.cName, tmember.cSurname, tbook.cTitle,
       YEAR(tmember.dNewMember)
FROM tmember
         JOIN tloan ON tmember.cCPR = tloan.cCPR
         JOIN tbookcopy ON tbookcopy.cSignature = tloan.cSignature
         JOIN tbook ON tbook.nBookID = tbookcopy.nBookID WHERE YEAR(tmember.dNewMember) = '2013';

# 16.
SELECT tauthor.cName, tauthor.cSurname, tcountry.cName, tbook.cTitle
FROM tauthor
         LEFT OUTER JOIN tnationality ON tauthor.nAuthorID = tnationality.nAuthorID
         LEFT OUTER JOIN tcountry ON tnationality.nCountryID = tcountry.nCountryID
         LEFT OUTER JOIN tauthorship ON tauthor.nAuthorID = tauthorship.nAuthorID
         LEFT OUTER JOIN tbook on tauthorship.nBookID = tbook.nBookID
ORDER BY tauthor.cName, tauthor.cSurname;

# 17.
SELECT tbook.cTitle FROM tbook
WHERE nPublishingYear = '1970' OR nPublishingYear = '1989'
GROUP BY tbook.cTitle
HAVING COUNT(tbook.cTitle) > 1;

# 18.
SELECT tmember.cSurname, tmember.cName, tauthor.cName, tauthor.cSurname
FROM tmember
         JOIN tauthor
WHERE YEAR(tmember.dNewMember) = '2013' AND MONTH(tmember.dNewMember) = '12'
   OR tauthor.cName = 'William';

# 19.
SELECT tmember.cName, tmember.cSurname
FROM tmember
WHERE dNewMember = (SELECT MIN(dNewMember) FROM tmember);

# 20.


# 21.
SELECT tpublishingcompany.cName AS Name, tcountry.cName AS Country
FROM tpublishingcompany
         JOIN tcountry ON tpublishingcompany.nCountryID = tcountry.nCountryID;

# 22.
SELECT tbook.cTitle FROM tbook
WHERE nPublishingCompanyID != 32 AND nPublishingYear > 1925 AND nPublishingYear < 1979;

# 23.
SELECT tmember.cName, tmember.cSurname FROM tmember
WHERE YEAR(tmember.dNewMember) > 2016 AND tmember.cAddress IS NULL;

# 24.
SELECT DISTINCT tcountry.nCountryID FROM tcountry, tpublishingcompany
WHERE tcountry.nCountryID = tpublishingcompany.nCountryID;

# 25.
SELECT tbook.cTitle FROM tbook
                             JOIN tpublishingcompany USING (nPublishingCompanyID)
WHERE cTitle like 'The Tale%' AND tbook.nPublishingCompanyID !=
                                  (SELECT DISTINCT tpublishingcompany.nPublishingCompanyID FROM tpublishingcompany WHERE tpublishingcompany.cName = 'Lynch Inc');

# 26.
SELECT DISTINCT ttheme.cName from ttheme
                                      JOIN tbooktheme USING (nThemeID)
                                      JOIN tbook USING (nBookID)
                                      JOIN tpublishingcompany USING (nPublishingCompanyID)
WHERE tpublishingcompany.cName = 'Lynch Inc';

# 27.
SELECT DISTINCT tbook.cTitle FROM tbook
                                      LEFT JOIN tbookcopy USING (nBookID)
                                      LEFT JOIN tloan ON tbookcopy.cSignature = tloan.cSignature
WHERE tloan.dLoan IS NULL;

# 28.
SELECT tpublishingcompany.cName, COUNT(*) AS 'No. of Books'
FROM tbook
         JOIN tpublishingcompany USING (nPublishingCompanyID)
GROUP BY tpublishingcompany.cName;

# 29.
SELECT COUNT(*) AS 'Number of Members' FROM tmember
                                                JOIN tloan USING (cCPR) WHERE YEAR(tloan.dLoan) = 2013;

# 30.
SELECT tbook.cTitle, COUNT(tauthorship.nAuthorID) AS 'No. of Authors'
FROM tbook
         JOIN tauthorship USING (nBookID)
GROUP BY cTitle
HAVING COUNT(*) > 1;
