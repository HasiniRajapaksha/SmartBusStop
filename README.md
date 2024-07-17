# SmartBusStop
 Group Project of GTEC 23032
 Here's an updated README file based on your requirements for the "Smart Stop" web application:

---

# Smart Stop Bus Booking Application

## Overview
Smart Stop is a web application that allows users to book bus tickets for various routes. This document outlines the features and functionality of the application.

## Features

1. **Route Selection**
   - Users can choose a route from a dropdown menu.
   - The dropdown menu displays route names like 'Maharagama - Galle', 'Maharagama - Matara', etc.
   - Includes a 'Change Direction' button to switch the direction of selected routes dynamically.
   - Users can select a date for their journey.

2. **Schedule Page**
   - After selecting a route, users are directed to the schedule page.
   - Displays a table with available buses for the selected route.
   - Table columns include: Bus No., Arrival Time, Departure Time, Seat Availability, No. of Seats Booking, and Booking Button.
   - Shows availability like '10/40' to indicate 10 seats booked out of 40.
   - Here's a merged table for the README file:

| Route Name                       | Bus No. Range      | Travel Time   |
|----------------------------------|--------------------|---------------|
| Maharagama - Galle               | 1001 to 1005       | 1h 30m        |
| Maharagama - Matara              | 1006 to 1010       | 1h 40m        |
| Kaduwela - Galle                 | 1011 to 1015       | 1h 20m        |
| Kaduwela - Matara                | 1016 to 1020       | 1h 40m        |
| Kadawatha - Galle                | 1021 to 1024       | 1h 30m        |
| Kadawatha - Matara               | 1025 to 1028       | 1h 40m        |
| Panadura - Matara                | 1029 to 1032       | 1h 40m        |
| Galle - Pettah (Makubura)        | 1033 to 1035       | 1h 20m        |
| Matara - Pettah (Makubura)       | 1036 to 1039       | 1h 30m        |
| Colombo - Katunayaka             | 1040 to 1045       | 30m           |
| Negombo - Colombo                | 1046 to 1050       | 40m           |

This table combines both the routes and their corresponding bus number ranges with the travel times for each route. It provides a clear overview of the routes available in the "Smart Stop" application. Let me know if there's anything else you'd like to adjust!      

3. **Booking**
   - Each bus listing includes a 'Booking' button that directs users to the booking page.
   - Booking page includes fields for Name (letters only), Email ('@gmail.com' required), NIC (9 digits with 'v' or 12 digits), and calculates the fee based on travel time (18 rupees per 5 minutes).

4. **No Refund Policy**
   - Checkbox for 'No Refund' with an explanation below.
   - Pay button disabled until 'No Refund' is checked.

5. **Payment Details**
   - After filling booking details, users proceed to the payment details page.
   - Payment details include fields for Card Type (Visa/MasterCard), Card Name (letters only), Card Number (16 digits), Expiry Date (calendar selection for month and year), CVV (3 digits).

6. **Proceed to Payment**
   - Clicking 'Proceed to Payment' button shows a popup saying "Booking Successful!" (Simulated message).
   - Increases seat availability upon successful booking.

7. **Payment Details Page**
   - Includes buttons for 'Cancel and Return' (redirects to home page) and 'Update Booking' (redirects to schedule page).
   - Dropdown list to choose Visa or MasterCard for payment.

8. **Booking Confirmation**
   - After payment, displays details of user input (Name, Bus Route, Bus No., Bus Arrival Time, Fee).
   - Includes an 'OK' button to confirm.

## Installation
- Clone the repository from [GitHub Repo URL].
- Install dependencies using `npm install`.
- Start the application with `npm start`.

## Technologies Used
- React.js for front-end development.
- CSS for styling.
- Node.js and Express for back-end (if applicable).
- PostgreSQL for database management (if applicable).

## Contributing
- Fork the repository and create a pull request with your enhancements.
- Issues can be reported on the GitHub repository.

---

This README should give users and developers a clear understanding of the application's functionality and features. Let me know if you need further adjustments or additional details!
