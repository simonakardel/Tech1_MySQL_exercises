# 1.

SELECT COUNT(t.TrackId) FROM playlist

                                 JOIN playlisttrack p on playlist.PlaylistId = p.PlaylistId

                                 JOIN track t on p.TrackId = t.TrackId

WHERE playlist.Name = 'Grunge';


# 2.
SELECT * FROM Artist WHERE Name LIKE '%Jack%' OR Name LIKE '%John%' AND Name NOT LIKE '%Martin%';

# 3.
SELECT Invoice.BillingCountry, SUM(Invoice.Total) AS Total
FROM Invoice
GROUP BY Invoice.BillingCountry HAVING SUM(Invoice.Total) > 100
ORDER BY SUM(Invoice.Total) DESC;

# 4.
SELECT DISTINCT Employee.Phone FROM Employee
                                        JOIN Customer ON Employee.EmployeeId = Customer.SupportRepId
                                        JOIN Invoice ON customer.CustomerId = Invoice.CustomerId
                                        JOIN InvoiceLine ON Invoice.InvoiceId = InvoiceLine.InvoiceId
                                        JOIN track ON InvoiceLine.TrackId = Track.TrackId
                                        JOIN MediaType ON track.MediaTypeId = MediaType.MediaTypeId
WHERE MediaType.Name = 'MPEG Audio File' AND Track.Composer = 'Miles Davis';

# 5.
SELECT DISTINCT  * FROM album
                            JOIN Track ON Album.AlbumId = Track.AlbumId
                            JOIN Genre ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = 'Bossa Nova' AND Album.Title LIKE 'Samba%';

# 6.

# 7.
SELECT COUNT(*) AS 'Count' FROM Customer
WHERE Customer.State IS NULL AND Company IS NOT NULL;

# 8.
SELECT CONCAT(Employee.FirstName, ' ', Employee.LastName) AS Employee,
       COUNT(Customer.Country) AS Clients
FROM Employee
         JOIN Customer ON Employee.EmployeeId = Customer.SupportRepId
WHERE Customer.Country = 'Canada' OR Customer.Country = 'Mexico' OR Customer.Country = 'USA'
GROUP BY Employee HAVING Clients > 6 ORDER BY Clients;

# 9.
SELECT CONCAT(Customer.LastName, ' ', Customer.FirstName) AS Name, IFNULL(Fax, 'S/He has no fax') FROM Customer
WHERE Country = 'USA'
ORDER BY LastName, FirstName;

# 10.
SELECT Employee.FirstName, Employee.LastName, FLOOR(DATEDIFF(Employee.HireDate, Employee.BirthDate) / 356) AS 'Age when hired' FROM employee;


