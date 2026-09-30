Last login: Sat Sep 26 01:08:49 on console
sanjanabashya@Sanjanas-MacBook-Air ~ % CREATE DATABASE skyline_airlines;
zsh: command not found: CREATE
sanjanabashya@Sanjanas-MacBook-Air ~ % clear


































sanjanabashya@Sanjanas-MacBook-Air ~ % psql postgres
psql (18.4 (Homebrew))
Type "help" for help.

postgres=# CREATE DATABASE skyline_airlines;
CREATE DATABASE
postgres=# \c skyline_airlines
You are now connected to database "skyline_airlines" as user "sanjanabashya".
skyline_airlines=# CREATE TABLE Airport(AirportID INT PRIMARY KEY,AirportName VARCHAR(100) NOT NULL,City VARCHAR(50) NOT NULL,Country VARCHAR(50) NOT NULL);
CREATE TABLE
skyline_airlines=# CREATE TABLE Passenger(PassengerID INT PRIMARY KEY,PassengerName VARCHAR(100) NOT NULL,Email VARCHAR(100) NOT NULL,Phone VARCHAR(15) NOT NULL);
CREATE TABLE
skyline_airlines=# CREATE TABLE Flight(FlightID INT PRIMARY KEY,FlightNumber VARCHAR(20) NOT NULL,SourceAirport INT NOT NULL,DestinationAirport INT NOT NULL,FlightDate DATE NOT NULL,DepartureTime TIME NOT NULL,FOREIGN KEY(SourceAirport) REFERENCES Airport(AirportID),FOREIGN KEY(DestinationAirport) REFERENCES Airport(AirportID));
CREATE TABLE
skyline_airlines=# CREATE TABLE Seat(SeatNumber VARCHAR(5) PRIMARY KEY);
CREATE TABLE
skyline_airlines=# CREATE TABLE Booking(BookingID INT PRIMARY KEY,FlightID INT NOT NULL,SeatNumber VARCHAR(5) NOT NULL,PassengerID INT NOT NULL,BookingStatus VARCHAR(20) NOT NULL,FOREIGN KEY(FlightID) REFERENCES Flight(FlightID),FOREIGN KEY(SeatNumber) REFERENCES Seat(SeatNumber),FOREIGN KEY(PassengerID) REFERENCES Passenger(PassengerID),UNIQUE(FlightID,SeatNumber));
CREATE TABLE
skyline_airlines=# INSERT INTO Airport VALUES(1,'Chhatrapati Shivaji Maharaj International Airport','Mumbai','India');
INSERT 0 1
skyline_airlines=# INSERT INTO Airport VALUES(2,'Indira Gandhi International Airport','Delhi','India');
INSERT 0 1
skyline_airlines=# INSERT INTO Airport VALUES(3,'Kempegowda International Airport','Bangalore','India');
INSERT 0 1
skyline_airlines=# INSERT INTO Airport VALUES(4,'Rajiv Gandhi International Airport','Hyderabad','India');
INSERT 0 1
skyline_airlines=# INSERT INTO Airport VALUES(5,'Chennai International Airport','Chennai','India');
INSERT 0 1
skyline_airlines=# INSERT INTO Passenger VALUES(101,'Aanya','Aanya@gmail.com','9876543210');
INSERT 0 1
skyline_airlines=# INSERT INTO Passenger VALUES(102,'Aman','aman@gmail.com','9876543211');
INSERT 0 1
skyline_airlines=# INSERT INTO Passenger VALUES(103,'Mukesh','mukesh@gmail.com','9876543212');
INSERT 0 1
skyline_airlines=# INSERT INTO Passenger VALUES(105,'Ananya','ananya@gmail.com','9876543214');
INSERT 0 1
skyline_airlines=# INSERT INTO Flight VALUES(201,'SK101',1,2,'2026-10-05','09:00');
INSERT 0 1
skyline_airlines=# INSERT INTO Flight VALUES(202,'SK102',2,3,'2026-10-05','11:30');
INSERT 0 1
skyline_airlines=# INSERT INTO Flight VALUES(203,'SK103',1,4,'2026-10-06','14:00');
INSERT 0 1
skyline_airlines=# INSERT INTO Flight VALUES(204,'SK104',3,5,'2026-10-06','16:30');
INSERT 0 1
skyline_airlines=# INSERT INTO Flight VALUES(205,'SK105',4,1,'2026-10-07','19:00');
INSERT 0 1
skyline_airlines=# INSERT INTO Seat VALUES('1A');
INSERT 0 1
skyline_airlines=# INSERT INTO Seat VALUES('1B');
INSERT 0 1
skyline_airlines=# INSERT INTO Seat VALUES('1C');
INSERT 0 1
skyline_airlines=# INSERT INTO Seat VALUES('1D');
INSERT 0 1
skyline_airlines=# INSERT INTO Seat VALUES('2A');
INSERT 0 1
skyline_airlines=# INSERT INTO Seat VALUES('2B');
INSERT 0 1
skyline_airlines=# INSERT INTO Seat VALUES('2C');
INSERT 0 1
skyline_airlines=# INSERT INTO Seat VALUES('2D');
INSERT 0 1
skyline_airlines=# INSERT INTO Seat VALUES('3A');
INSERT 0 1
skyline_airlines=# INSERT INTO Seat VALUES('3B');
INSERT 0 1
skyline_airlines=# INSERT INTO Booking VALUES(301,201,'1A',101,'Confirmed');
INSERT 0 1
skyline_airlines=# INSERT INTO Booking VALUES(302,201,'1B',102,'Confirmed');
INSERT 0 1
skyline_airlines=# INSERT INTO Booking VALUES(303,202,'1A',103,'Confirmed');
INSERT 0 1
skyline_airlines=# INSERT INTO Booking VALUES(304,203,'2A',104,'Confirmed');
ERROR:  insert or update on table "booking" violates foreign key constraint "booking_passengerid_fkey"
DETAIL:  Key (passengerid)=(104) is not present in table "passenger".
skyline_airlines=# INSERT INTO Booking VALUES(304,203,'2A',105,'Confirmed');
INSERT 0 1
skyline_airlines=# INSERT INTO Booking VALUES(304,203,'2A',105,'Confirmed');
ERROR:  duplicate key value violates unique constraint "booking_pkey"
DETAIL:  Key (bookingid)=(304) already exists.
skyline_airlines=# SELECT * FROM Flight;
 flightid | flightnumber | sourceairport | destinationairport | flightdate | departuretime 
----------+--------------+---------------+--------------------+------------+---------------
      201 | SK101        |             1 |                  2 | 2026-10-05 | 09:00:00
      202 | SK102        |             2 |                  3 | 2026-10-05 | 11:30:00
      203 | SK103        |             1 |                  4 | 2026-10-06 | 14:00:00
      204 | SK104        |             3 |                  5 | 2026-10-06 | 16:30:00
      205 | SK105        |             4 |                  1 | 2026-10-07 | 19:00:00
(5 rows)

skyline_airlines=# SELECT * FROM Passenger;
 passengerid | passengername |      email       |   phone    
-------------+---------------+------------------+------------
         101 | Aanya         | Aanya@gmail.com  | 9876543210
         102 | Aman          | aman@gmail.com   | 9876543211
         103 | Mukesh        | mukesh@gmail.com | 9876543212
         105 | Ananya        | ananya@gmail.com | 9876543214
(4 rows)

skyline_airlines=# SELECT * FROM Booking;
 bookingid | flightid | seatnumber | passengerid | bookingstatus 
-----------+----------+------------+-------------+---------------
       301 |      201 | 1A         |         101 | Confirmed
       302 |      201 | 1B         |         102 | Confirmed
       303 |      202 | 1A         |         103 | Confirmed
       304 |      203 | 2A         |         105 | Confirmed
(4 rows)

skyline_airlines=# SELECT * FROM Seat;
 seatnumber 
------------
 1A
 1B
 1C
 1D
 2A
 2B
 2C
 2D
 3A
 3B
(10 rows)

skyline_airlines=# SELECT b.BookingID,f.FlightNumber,s.SeatNumber,p.PassengerName,b.BookingStatus FROM Booking b JOIN Flight f ON b.FlightID=f.FlightID JOIN Seat s ON b.SeatNumber=s.SeatNumber JOIN Passenger p ON b.PassengerID=p.PassengerID;
 bookingid | flightnumber | seatnumber | passengername | bookingstatus 
-----------+--------------+------------+---------------+---------------
       301 | SK101        | 1A         | Aanya         | Confirmed
       302 | SK101        | 1B         | Aman          | Confirmed
       303 | SK102        | 1A         | Mukesh        | Confirmed
       304 | SK103        | 2A         | Ananya        | Confirmed
(4 rows)

skyline_airlines=# SELECT f.FlightNumber,a1.City AS Source,a2.City AS Destination,f.FlightDate FROM Flight f JOIN Airport a1 ON f.SourceAirport=a1.AirportID JOIN Airport a2 ON f.DestinationAirport=a2.AirportID;
 flightnumber |  source   | destination | flightdate 
--------------+-----------+-------------+------------
 SK101        | Mumbai    | Delhi       | 2026-10-05
 SK102        | Delhi     | Bangalore   | 2026-10-05
 SK103        | Mumbai    | Hyderabad   | 2026-10-06
 SK104        | Bangalore | Chennai     | 2026-10-06
 SK105        | Hyderabad | Mumbai      | 2026-10-07
(5 rows)

skyline_airlines=# SELECT SeatNumber FROM Seat WHERE SeatNumber NOT IN(SELECT SeatNumber FROM Booking WHERE FlightID=201);
 seatnumber 
------------
 1C
 1D
 2A
 2B
 2C
 2D
 3A
 3B
(8 rows)

skyline_airlines=# SELECT s.SeatNumber FROM Seat s WHERE s.SeatNumber NOT IN(SELECT b.SeatNumber FROM Booking b JOIN Flight f ON b.FlightID=f.FlightID WHERE f.FlightID=201 AND f.FlightDate='2026-10-05');
 seatnumber 
------------
 1C
 1D
 2A
 2B
 2C
 2D
 3A
 3B
(8 rows)

skyline_airlines=# SELECT FlightID,COUNT(*) AS TotalBookings FROM Booking GROUP BY FlightID;
 flightid | totalbookings 
----------+---------------
      202 |             1
      201 |             2
      203 |             1
(3 rows)

skyline_airlines=# SELECT f.FlightNumber,COUNT(b.BookingID) AS OccupiedSeats FROM Flight f LEFT JOIN Booking b ON f.FlightID=b.FlightID GROUP BY f.FlightNumber;
 flightnumber | occupiedseats 
--------------+---------------
 SK102        |             1
 SK103        |             1
 SK105        |             0
 SK101        |             2
 SK104        |             0
(5 rows)

skyline_airlines=# SELECT p.PassengerName,b.FlightID,b.SeatNumber FROM Passenger p JOIN Booking b ON p.PassengerID=b.PassengerID WHERE p.PassengerID=101;
 passengername | flightid | seatnumber 
---------------+----------+------------
 Aanya         |      201 | 1A
(1 row)

skyline_airlines=# SELECT * FROM Booking WHERE BookingStatus='Confirmed';
 bookingid | flightid | seatnumber | passengerid | bookingstatus 
-----------+----------+------------+-------------+---------------
       301 |      201 | 1A         |         101 | Confirmed
       302 |      201 | 1B         |         102 | Confirmed
       303 |      202 | 1A         |         103 | Confirmed
       304 |      203 | 2A         |         105 | Confirmed
(4 rows)

skyline_airlines=# SELECT * FROM Flight WHERE FlightDate='2026-10-05';
 flightid | flightnumber | sourceairport | destinationairport | flightdate | departuretime 
----------+--------------+---------------+--------------------+------------+---------------
      201 | SK101        |             1 |                  2 | 2026-10-05 | 09:00:00
      202 | SK102        |             2 |                  3 | 2026-10-05 | 11:30:00
(2 rows)

skyline_airlines=# SELECT f.FlightNumber,a.City FROM Flight f JOIN Airport a ON f.SourceAirport=a.AirportID WHERE a.City='Mumbai';
 flightnumber |  city  
--------------+--------
 SK101        | Mumbai
 SK103        | Mumbai
(2 rows)

skyline_airlines=# SELECT COUNT(*) AS TotalPassengers FROM Passenger;
 totalpassengers 
-----------------
               4
(1 row)

skyline_airlines=# SELECT COUNT(*) AS TotalFlights FROM Flight;
 totalflights 
--------------
            5
(1 row)

skyline_airlines=# SELECT COUNT(*) AS AvailableSeats FROM Seat WHERE SeatNumber NOT IN(SELECT SeatNumber FROM Booking WHERE FlightID=201);
 availableseats 
----------------
              8
(1 row)

skyline_airlines=# SELECT FlightID,COUNT(*) AS TotalBookings FROM Booking GROUP BY FlightID HAVING COUNT(*)>1;
 flightid | totalbookings 
----------+---------------
      201 |             2
(1 row)

skyline_airlines=# SELECT p.PassengerName,b.SeatNumber FROM Passenger p JOIN Booking b ON p.PassengerID=b.PassengerID;
 passengername | seatnumber 
---------------+------------
 Aanya         | 1A
 Aman          | 1B
 Mukesh        | 1A
 Ananya        | 2A
(4 rows)

skyline_airlines=# UPDATE Booking SET BookingStatus='Cancelled' WHERE BookingID=305;
UPDATE 0
skyline_airlines=# DELETE FROM Booking WHERE BookingID=305;
DELETE 0
skyline_airlines=# CREATE OR REPLACE FUNCTION BookSeat(fid INT,sno VARCHAR,pid INT) RETURNS VOID AS $$ BEGIN IF EXISTS(SELECT 1 FROM Booking WHERE FlightID=fid AND SeatNumber=sno) THEN RAISE EXCEPTION 'Seat already booked'; ELSE INSERT INTO Booking VALUES((SELECT COALESCE(MAX(BookingID),0)+1 FROM Booking),fid,sno,pid,'Confirmed'); END IF; END; $$ LANGUAGE plpgsql;
CREATE FUNCTION
skyline_airlines=# SELECT BookSeat(201,'2A',103);
 bookseat 
----------
 
(1 row)

skyline_airlines=# SELECT * FROM Booking WHERE FlightID=201;
 bookingid | flightid | seatnumber | passengerid | bookingstatus 
-----------+----------+------------+-------------+---------------
       301 |      201 | 1A         |         101 | Confirmed
       302 |      201 | 1B         |         102 | Confirmed
       305 |      201 | 2A         |         103 | Confirmed
(3 rows)

skyline_airlines=# \d Flight
                            Table "public.flight"
       Column       |          Type          | Collation | Nullable | Default 
--------------------+------------------------+-----------+----------+---------
 flightid           | integer                |           | not null | 
 flightnumber       | character varying(20)  |           | not null | 
 sourceairport      | integer                |           | not null | 
 destinationairport | integer                |           | not null | 
 flightdate         | date                   |           | not null | 
 departuretime      | time without time zone |           | not null | 
Indexes:
    "flight_pkey" PRIMARY KEY, btree (flightid)
Foreign-key constraints:
    "flight_destinationairport_fkey" FOREIGN KEY (destinationairport) REFERENCES airport(airportid)
    "flight_sourceairport_fkey" FOREIGN KEY (sourceairport) REFERENCES airport(airportid)
Referenced by:
    TABLE "booking" CONSTRAINT "booking_flightid_fkey" FOREIGN KEY (flightid) REFERENCES flight(flightid)

skyline_airlines=# \d Booking
                         Table "public.booking"
    Column     |         Type          | Collation | Nullable | Default 
---------------+-----------------------+-----------+----------+---------
 bookingid     | integer               |           | not null | 
 flightid      | integer               |           | not null | 
 seatnumber    | character varying(5)  |           | not null | 
 passengerid   | integer               |           | not null | 
 bookingstatus | character varying(20) |           | not null | 
Indexes:
    "booking_pkey" PRIMARY KEY, btree (bookingid)
    "booking_flightid_seatnumber_key" UNIQUE CONSTRAINT, btree (flightid, seatnumber)
Foreign-key constraints:
    "booking_flightid_fkey" FOREIGN KEY (flightid) REFERENCES flight(flightid)
    "booking_passengerid_fkey" FOREIGN KEY (passengerid) REFERENCES passenger(passengerid)
    "booking_seatnumber_fkey" FOREIGN KEY (seatnumber) REFERENCES seat(seatnumber)

skyline_airlines=# SELECT s.SeatNumber
FROM Seat s
LEFT JOIN Booking b
    ON s.SeatNumber = b.SeatNumber
    AND b.FlightID = 1
WHERE s.SeatNumber NOT IN (
    SELECT SeatNumber
    FROM Booking
    WHERE FlightID = 1
);
 seatnumber 
------------
 1A
 1B
 1C
 1D
 2A
 2B
 2C
 2D
 3A
 3B
(10 rows)

skyline_airlines=# SELECT f.FlightNumber, f.FlightDate, s.SeatNumber FROM Flight f CROSS JOIN Seat s WHERE f.FlightID = 1 AND s.SeatNumber NOT IN (SELECT b.SeatNumber FROM Booking b WHERE b.FlightID = f.FlightID);
 flightnumber | flightdate | seatnumber 
--------------+------------+------------
(0 rows)

skyline_airlines=# SELECT b.BookingID, f.FlightNumber, f.FlightDate, p.PassengerName, b.SeatNumber, b.BookingStatus FROM Booking b JOIN Flight f ON b.FlightID = f.FlightID JOIN Passenger p ON b.PassengerID = p.PassengerID ORDER BY f.FlightDate;
 bookingid | flightnumber | flightdate | passengername | seatnumber | bookingstatus 
-----------+--------------+------------+---------------+------------+---------------
       301 | SK101        | 2026-10-05 | Aanya         | 1A         | Confirmed
       302 | SK101        | 2026-10-05 | Aman          | 1B         | Confirmed
       303 | SK102        | 2026-10-05 | Mukesh        | 1A         | Confirmed
       305 | SK101        | 2026-10-05 | Mukesh        | 2A         | Confirmed
       304 | SK103        | 2026-10-06 | Ananya        | 2A         | Confirmed
(5 rows)

skyline_airlines=# \dt
               List of tables
 Schema |   Name    | Type  |     Owner     
--------+-----------+-------+---------------
 public | airport   | table | sanjanabashya
 public | booking   | table | sanjanabashya
 public | flight    | table | sanjanabashya
 public | passenger | table | sanjanabashya
 public | seat      | table | sanjanabashya
(5 rows)

skyline_airlines=# \d flight
                            Table "public.flight"
       Column       |          Type          | Collation | Nullable | Default 
--------------------+------------------------+-----------+----------+---------
 flightid           | integer                |           | not null | 
 flightnumber       | character varying(20)  |           | not null | 
 sourceairport      | integer                |           | not null | 
 destinationairport | integer                |           | not null | 
 flightdate         | date                   |           | not null | 
 departuretime      | time without time zone |           | not null | 
Indexes:
    "flight_pkey" PRIMARY KEY, btree (flightid)
Foreign-key constraints:
    "flight_destinationairport_fkey" FOREIGN KEY (destinationairport) REFERENCES airport(airportid)
    "flight_sourceairport_fkey" FOREIGN KEY (sourceairport) REFERENCES airport(airportid)
Referenced by:
    TABLE "booking" CONSTRAINT "booking_flightid_fkey" FOREIGN KEY (flightid) REFERENCES flight(flightid)

skyline_airlines=# \d Flight
                            Table "public.flight"
       Column       |          Type          | Collation | Nullable | Default 
--------------------+------------------------+-----------+----------+---------
 flightid           | integer                |           | not null | 
 flightnumber       | character varying(20)  |           | not null | 
 sourceairport      | integer                |           | not null | 
 destinationairport | integer                |           | not null | 
 flightdate         | date                   |           | not null | 
 departuretime      | time without time zone |           | not null | 
Indexes:
    "flight_pkey" PRIMARY KEY, btree (flightid)
Foreign-key constraints:
    "flight_destinationairport_fkey" FOREIGN KEY (destinationairport) REFERENCES airport(airportid)
    "flight_sourceairport_fkey" FOREIGN KEY (sourceairport) REFERENCES airport(airportid)
Referenced by:
    TABLE "booking" CONSTRAINT "booking_flightid_fkey" FOREIGN KEY (flightid) REFERENCES flight(flightid)

skyline_airlines=# \d Passenger
                        Table "public.passenger"
    Column     |          Type          | Collation | Nullable | Default 
---------------+------------------------+-----------+----------+---------
 passengerid   | integer                |           | not null | 
 passengername | character varying(100) |           | not null | 
 email         | character varying(100) |           | not null | 
 phone         | character varying(15)  |           | not null | 
Indexes:
    "passenger_pkey" PRIMARY KEY, btree (passengerid)
Referenced by:
    TABLE "booking" CONSTRAINT "booking_passengerid_fkey" FOREIGN KEY (passengerid) REFERENCES passenger(passengerid)

skyline_airlines=# \d Seat
                        Table "public.seat"
   Column   |         Type         | Collation | Nullable | Default 
------------+----------------------+-----------+----------+---------
 seatnumber | character varying(5) |           | not null | 
Indexes:
    "seat_pkey" PRIMARY KEY, btree (seatnumber)
Referenced by:
    TABLE "booking" CONSTRAINT "booking_seatnumber_fkey" FOREIGN KEY (seatnumber) REFERENCES seat(seatnumber)

skyline_airlines=# \d Booking
                         Table "public.booking"
    Column     |         Type          | Collation | Nullable | Default 
---------------+-----------------------+-----------+----------+---------
 bookingid     | integer               |           | not null | 
 flightid      | integer               |           | not null | 
 seatnumber    | character varying(5)  |           | not null | 
 passengerid   | integer               |           | not null | 
 bookingstatus | character varying(20) |           | not null | 
Indexes:
    "booking_pkey" PRIMARY KEY, btree (bookingid)
    "booking_flightid_seatnumber_key" UNIQUE CONSTRAINT, btree (flightid, seatnumber)
Foreign-key constraints:
    "booking_flightid_fkey" FOREIGN KEY (flightid) REFERENCES flight(flightid)
    "booking_passengerid_fkey" FOREIGN KEY (passengerid) REFERENCES passenger(passengerid)
    "booking_seatnumber_fkey" FOREIGN KEY (seatnumber) REFERENCES seat(seatnumber)

skyline_airlines=# \d Airport
                        Table "public.airport"
   Column    |          Type          | Collation | Nullable | Default 
-------------+------------------------+-----------+----------+---------
 airportid   | integer                |           | not null | 
 airportname | character varying(100) |           | not null | 
 city        | character varying(50)  |           | not null | 
 country     | character varying(50)  |           | not null | 
Indexes:
    "airport_pkey" PRIMARY KEY, btree (airportid)
Referenced by:
    TABLE "flight" CONSTRAINT "flight_destinationairport_fkey" FOREIGN KEY (destinationairport) REFERENCES airport(airportid)
    TABLE "flight" CONSTRAINT "flight_sourceairport_fkey" FOREIGN KEY (sourceairport) REFERENCES airport(airportid)

skyline_airlines=# SELECT * FROM Flight
ORDER BY FlightID;
 flightid | flightnumber | sourceairport | destinationairport | flightdate | departuretime 
----------+--------------+---------------+--------------------+------------+---------------
      201 | SK101        |             1 |                  2 | 2026-10-05 | 09:00:00
      202 | SK102        |             2 |                  3 | 2026-10-05 | 11:30:00
      203 | SK103        |             1 |                  4 | 2026-10-06 | 14:00:00
      204 | SK104        |             3 |                  5 | 2026-10-06 | 16:30:00
      205 | SK105        |             4 |                  1 | 2026-10-07 | 19:00:00
(5 rows)

skyline_airlines=# SELECT * FROM Passenger
ORDER BY PassengerID;
 passengerid | passengername |      email       |   phone    
-------------+---------------+------------------+------------
         101 | Aanya         | Aanya@gmail.com  | 9876543210
         102 | Aman          | aman@gmail.com   | 9876543211
         103 | Mukesh        | mukesh@gmail.com | 9876543212
         105 | Ananya        | ananya@gmail.com | 9876543214
(4 rows)

skyline_airlines=# SELECT * FROM Airport ORDER BY AirportID;
 airportid |                    airportname                    |   city    | country 
-----------+---------------------------------------------------+-----------+---------
         1 | Chhatrapati Shivaji Maharaj International Airport | Mumbai    | India
         2 | Indira Gandhi International Airport               | Delhi     | India
         3 | Kempegowda International Airport                  | Bangalore | India
         4 | Rajiv Gandhi International Airport                | Hyderabad | India
         5 | Chennai International Airport                     | Chennai   | India
(5 rows)

skyline_airlines=# SELECT * FROM Seat ORDER BY SeatNumber;
 seatnumber 
------------
 1A
 1B
 1C
 1D
 2A
 2B
 2C
 2D
 3A
 3B
(10 rows)

skyline_airlines=# SELECT * FROM Booking ORDER BY BookingID;

 bookingid | flightid | seatnumber | passengerid | bookingstatus 
-----------+----------+------------+-------------+---------------
       301 |      201 | 1A         |         101 | Confirmed
       302 |      201 | 1B         |         102 | Confirmed
       303 |      202 | 1A         |         103 | Confirmed
       304 |      203 | 2A         |         105 | Confirmed
       305 |      201 | 2A         |         103 | Confirmed
(5 rows)

skyline_airlines=# SELECT 
    (SELECT COUNT(*) FROM Airport) AS TotalAirports,
    (SELECT COUNT(*) FROM Flight) AS TotalFlights,
    (SELECT COUNT(*) FROM Passenger) AS TotalPassengers,
    (SELECT COUNT(*) FROM Seat) AS TotalSeats,
    (SELECT COUNT(*) FROM Booking) AS TotalBookings;
 totalairports | totalflights | totalpassengers | totalseats | totalbookings 
---------------+--------------+-----------------+------------+---------------
             5 |            5 |               4 |         10 |             5
(1 row)

skyline_airlines=# SELECT 
    f.FlightNumber,
    a1.AirportName AS SourceAirport,
    a2.AirportName AS DestinationAirport,
    f.FlightDate,
    f.DepartureTime
FROM Flight f
JOIN Airport a1
    ON f.SourceAirport = a1.AirportID
JOIN Airport a2
    ON f.DestinationAirport = a2.AirportID
ORDER BY f.FlightDate;
 flightnumber |                   sourceairport                   |                destinationairport                 | flightdate | departuretime 
--------------+---------------------------------------------------+---------------------------------------------------+------------+---------------
 SK101        | Chhatrapati Shivaji Maharaj International Airport | Indira Gandhi International Airport               | 2026-10-05 | 09:00:00
 SK102        | Indira Gandhi International Airport               | Kempegowda International Airport                  | 2026-10-05 | 11:30:00
 SK103        | Chhatrapati Shivaji Maharaj International Airport | Rajiv Gandhi International Airport                | 2026-10-06 | 14:00:00
 SK104        | Kempegowda International Airport                  | Chennai International Airport                     | 2026-10-06 | 16:30:00
 SK105        | Rajiv Gandhi International Airport                | Chhatrapati Shivaji Maharaj International Airport | 2026-10-07 | 19:00:00
(5 rows)

skyline_airlines=# SELECT 
    FlightNumber,
    FlightDate,
    DepartureTime
FROM Flight
WHERE FlightDate = '2026-10-05'
ORDER BY DepartureTime;
 flightnumber | flightdate | departuretime 
--------------+------------+---------------
 SK101        | 2026-10-05 | 09:00:00
 SK102        | 2026-10-05 | 11:30:00
(2 rows)

skyline_airlines=# SELECT 
    b.BookingID,
    f.FlightNumber,
    f.FlightDate,
    p.PassengerName,
    b.SeatNumber,
    b.BookingStatus
FROM Booking b
JOIN Flight f 
    ON b.FlightID = f.FlightID
JOIN Passenger p 
    ON b.PassengerID = p.PassengerID
ORDER BY f.FlightDate, b.BookingID;
 bookingid | flightnumber | flightdate | passengername | seatnumber | bookingstatus 
-----------+--------------+------------+---------------+------------+---------------
       301 | SK101        | 2026-10-05 | Aanya         | 1A         | Confirmed
       302 | SK101        | 2026-10-05 | Aman          | 1B         | Confirmed
       303 | SK102        | 2026-10-05 | Mukesh        | 1A         | Confirmed
       305 | SK101        | 2026-10-05 | Mukesh        | 2A         | Confirmed
       304 | SK103        | 2026-10-06 | Ananya        | 2A         | Confirmed
(5 rows)

skyline_airlines=# SELECT 
    p.PassengerName,
    f.FlightNumber,
    f.FlightDate,
    b.SeatNumber,
    b.BookingStatus
FROM Passenger p
JOIN Booking b
    ON p.PassengerID = b.PassengerID
JOIN Flight f
    ON b.FlightID = f.FlightID
ORDER BY p.PassengerName, f.FlightDate;
 passengername | flightnumber | flightdate | seatnumber | bookingstatus 
---------------+--------------+------------+------------+---------------
 Aanya         | SK101        | 2026-10-05 | 1A         | Confirmed
 Aman          | SK101        | 2026-10-05 | 1B         | Confirmed
 Ananya        | SK103        | 2026-10-06 | 2A         | Confirmed
 Mukesh        | SK102        | 2026-10-05 | 1A         | Confirmed
 Mukesh        | SK101        | 2026-10-05 | 2A         | Confirmed
(5 rows)

skyline_airlines=# SELECT 
    p.PassengerID,
    p.PassengerName
FROM Passenger p
LEFT JOIN Booking b
    ON p.PassengerID = b.PassengerID
WHERE b.BookingID IS NULL;
 passengerid | passengername 
-------------+---------------
(0 rows)

skyline_airlines=# SELECT 
    s.SeatNumber
FROM Seat s
WHERE s.SeatNumber NOT IN (
    SELECT b.SeatNumber
    FROM Booking b
    WHERE b.FlightID = 201
)
ORDER BY s.SeatNumber;
 seatnumber 
------------
 1C
 1D
 2B
 2C
 2D
 3A
 3B
(7 rows)

skyline_airlines=# SELECT 
    f.FlightNumber,
    COUNT(b.BookingID) AS OccupiedSeats
FROM Flight f
LEFT JOIN Booking b
    ON f.FlightID = b.FlightID
GROUP BY f.FlightNumber
ORDER BY f.FlightNumber;
 flightnumber | occupiedseats 
--------------+---------------
 SK101        |             3
 SK102        |             1
 SK103        |             1
 SK104        |             0
 SK105        |             0
(5 rows)

skyline_airlines=# \df BookSeat
                                       List of functions
 Schema |   Name   | Result data type |               Argument data types               | Type 
--------+----------+------------------+-------------------------------------------------+------
 public | bookseat | void             | fid integer, sno character varying, pid integer | func
(1 row)

skyline_airlines=# SELECT 
    b.BookingID,
    f.FlightNumber,
    f.FlightDate,
    p.PassengerName,
    b.SeatNumber,
    b.BookingStatus
FROM Booking b
JOIN Flight f
    ON b.FlightID = f.FlightID
JOIN Passenger p
    ON b.PassengerID = p.PassengerID
ORDER BY b.BookingID DESC
LIMIT 1;
 bookingid | flightnumber | flightdate | passengername | seatnumber | bookingstatus 
-----------+--------------+------------+---------------+------------+---------------
       305 | SK101        | 2026-10-05 | Mukesh        | 2A         | Confirmed
(1 row)

skyline_airlines=# INSERT INTO Booking
    (BookingID, FlightID, SeatNumber, PassengerID, BookingStatus)
VALUES             
    (998, 201, '1A', 105, 'Confirmed');
ERROR:  duplicate key value violates unique constraint "booking_flightid_seatnumber_key"
DETAIL:  Key (flightid, seatnumber)=(201, 1A) already exists.
skyline_airlines=#     (SELECT COUNT(*) FROM Airport) AS Airports,
    (SELECT COUNT(*) FROM Flight) AS Flights,
    (SELECT COUNT(*) FROM Passenger) AS Passengers,
    (SELECT COUNT(*) FROM Seat) AS Seats,
    (SELECT COUNT(*) FROM Booking) AS Bookings;
ERROR:  syntax error at or near "AS"
LINE 1: (SELECT COUNT(*) FROM Airport) AS Airports,
                                       ^
skyline_airlines=#     (SELECT COUNT(*) FROM Airport) AS Airports,
    (SELECT COUNT(*) FROM Flight) AS Flights,
    (SELECT COUNT(*) FROM Passenger) AS Passengers,
    (SELECT COUNT(*) FROM Seat) AS Seats,
    (SELECT COUNT(*) FROM Booking) AS Bookings;
ERROR:  syntax error at or near "AS"
LINE 1: (SELECT COUNT(*) FROM Airport) AS Airports,
                                       ^
skyline_airlines=# SELECT s.SeatNumber
FROM Seat s
LEFT JOIN Booking b
    ON s.SeatNumber = b.SeatNumber AND b.FlightID = 201
WHERE s.SeatNumber NOT IN (
    SELECT b2.SeatNumber
    FROM Booking b2
    JOIN Flight f ON b2.FlightID = f.FlightID
    WHERE f.FlightID = 201 AND f.FlightDate = '2026-10-05'
);
 seatnumber 
------------
 1C
 1D
 2B
 2C
 2D
 3A
 3B
(7 rows)

skyline_airlines=# SELECT * FROM Airport;
 airportid |                    airportname                    |   city    | country 
-----------+---------------------------------------------------+-----------+---------
         1 | Chhatrapati Shivaji Maharaj International Airport | Mumbai    | India
         2 | Indira Gandhi International Airport               | Delhi     | India
         3 | Kempegowda International Airport                  | Bangalore | India
         4 | Rajiv Gandhi International Airport                | Hyderabad | India
         5 | Chennai International Airport                     | Chennai   | India
(5 rows)

skyline_airlines=# SELECT BookSeat(201, '1A', 105);
ERROR:  Seat already booked
CONTEXT:  PL/pgSQL function bookseat(integer,character varying,integer) line 1 at RAISE
skyline_airlines=# SELECT FlightID, COUNT(*) AS OccupiedSeats
FROM Booking
GROUP BY FlightID
ORDER BY FlightID;
 flightid | occupiedseats 
----------+---------------
      201 |             3
      202 |             1
      203 |             1
(3 rows)

skyline_airlines=# INSERT INTO Booking VALUES (990, 999, '1C', 101, 'Confirmed');   -- invalid flight
INSERT INTO Booking VALUES (991, 201, '9Z', 101, 'Confirmed');   -- invalid seat
INSERT INTO Booking VALUES (992, 201, '1C', 999, 'Confirmed');   -- invalid passenger
ERROR:  insert or update on table "booking" violates foreign key constraint "booking_flightid_fkey"
DETAIL:  Key (flightid)=(999) is not present in table "flight".
ERROR:  insert or update on table "booking" violates foreign key constraint "booking_seatnumber_fkey"
DETAIL:  Key (seatnumber)=(9Z) is not present in table "seat".
ERROR:  insert or update on table "booking" violates foreign key constraint "booking_passengerid_fkey"
DETAIL:  Key (passengerid)=(999) is not present in table "passenger".
skyline_airlines=# SELECT f.FlightNumber, f.FlightDate, s.SeatNumber
FROM Flight f
CROSS JOIN Seat s
WHERE f.FlightID = 201
  AND s.SeatNumber NOT IN (
      SELECT b.SeatNumber FROM Booking b WHERE b.FlightID = f.FlightID
  );
 flightnumber | flightdate | seatnumber 
--------------+------------+------------
 SK101        | 2026-10-05 | 1C
 SK101        | 2026-10-05 | 1D
 SK101        | 2026-10-05 | 2B
 SK101        | 2026-10-05 | 2C
 SK101        | 2026-10-05 | 2D
 SK101        | 2026-10-05 | 3A
 SK101        | 2026-10-05 | 3B
(7 rows)

skyline_airlines=# \dt
               List of tables
 Schema |   Name    | Type  |     Owner     
--------+-----------+-------+---------------
 public | airport   | table | sanjanabashya
 public | booking   | table | sanjanabashya
 public | flight    | table | sanjanabashya
 public | passenger | table | sanjanabashya
 public | seat      | table | sanjanabashya
(5 rows)

skyline_airlines=# SELECT
    (SELECT COUNT(*) FROM Airport) AS Airports,
    (SELECT COUNT(*) FROM Flight) AS Flights,
    (SELECT COUNT(*) FROM Passenger) AS Passengers,
    (SELECT COUNT(*) FROM Seat) AS Seats,
    (SELECT COUNT(*) FROM Booking) AS Bookings;
 airports | flights | passengers | seats | bookings 
----------+---------+------------+-------+----------
        5 |       5 |          4 |    10 |        5
(1 row)

skyline_airlines=# 
