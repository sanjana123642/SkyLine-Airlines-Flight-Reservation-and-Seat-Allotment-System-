# SkyLine-Airlines-Flight-Reservation-and-Seat-Allotment-System-

SkyLine Airlines is a database system designed to manage flights, airports, passengers, seats, and bookings.

The main goal of the project is to prevent two passengers from being assigned the same seat on the same flight and to allow staff to check available seats easily.

## Main Entities

- Flight
- Airport
- Passenger
- Seat
- Booking

## Key Features

- Flight and passenger management
- Seat and booking management
- Prevention of duplicate seat allocation
- Available seat checking
- Flight occupancy reports
- Stored procedure for seat booking

## Database Concepts Used

- Primary Keys & Foreign Keys
- NOT NULL, UNIQUE & CHECK constraints
- Normalization (2NF/3NF)
- DDL & DML
- JOINs
- Subqueries
- Aggregate Functions
- Stored Procedure

## Stored Procedure

`BookSeat(flightID, seatNo, passengerID)`

The procedure checks seat availability before creating a booking, helping prevent duplicate seat allocation.

## Project Files

```text
SkyLine-Airlines/
│
├── README.md
├── SkyLine_Airlines.sql
├── SkyLine_Airlines_Report.pdf
├── ER_Diagram.png
├── Relational_Schema.png
└── Screenshots/
