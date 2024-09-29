import express from 'express';
import moment from 'moment-timezone';
import { createConnection } from 'mysql';
import cors from 'cors';
import bodyParser from 'body-parser';

const app = express();
app.use(cors());
app.use(bodyParser.json());

const db = createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "bus"
});

// Ensure that the database connection is established
db.connect((err) => {
    if (err) {
        console.error('Error connecting to the database:', err);
        process.exit(1);
    }
    console.log('Connected to the database.');
});

// Route to get buses
app.get('/buses', (req, res) => {
    db.query("SELECT * FROM `buses`", (err, data) => {
        if (err) {
            return res.status(500).json({ error: 'Error fetching buses' });
        }
        return res.json(data);
    });
});

// Route to get locations
app.get('/locations', (req, res) => {
    db.query("SELECT * FROM `locations`", (err, data) => {
        if (err) {
            return res.status(500).json({ error: 'Error fetching locations' });
        }
        return res.json(data);
    });
});

// Route to get routes
app.get('/route', (req, res) => {
    db.query("SELECT * FROM `route`", (err, data) => {
        if (err) {
            return res.status(500).json({ error: 'Error fetching route' });
        }
        return res.json(data);
    });
});

app.post('/bus_seats', (req, res) => {
    const { date } = req.body; // Get date from the body
    console.log("Received date:", date);

    if (!date) {
        return res.status(400).json({ error: 'Date is required' });
    }

    db.query("SELECT * FROM `bus_seats` WHERE book_date = ?;", [date], (err, data) => {
        if (err) {
        console.error("Database query error:", err);
        return res.status(500).json({ error: 'Error fetching available seats' });
        }

        // Convert the dates to Sri Lankan time
        const convertedData = data.map(entry => ({
        ...entry,
        book_date: moment(entry.book_date).tz('Asia/Colombo').format('YYYY-MM-DD')
        }));

        return res.json(convertedData);
    });

    console.log(date);
});

// Route to get available dates with timezone conversion
app.get('/available_dates', (req, res) => {
    db.query("SELECT * FROM `available_dates` WHERE available >= CURDATE();", (err, data) => {
        if (err) {
            return res.status(500).json({ error: 'Error fetching available dates' });
        }

        // Convert the dates to Sri Lankan time
        const convertedData = data.map(entry => ({
            ...entry,
            available: moment(entry.available).tz('Asia/Colombo').format('YYYY-MM-DD')
        }));

        return res.json(convertedData);
    });
});

// Route to handle data insert
app.post("/insert/bus_seats", (req, res) => {
    const data = req.body;
    // if (!Array.isArray(data) || data.length === 0) {
    //     return res.status(400).send('Invalid input');
    // }
    // Prepare the query and values
    const query = 'INSERT INTO bus_seats (book_date, book_bus, book_seat) VALUES ?';
    const values = data.map(item => [item.book_date, item.book_bus, item.book_seat]);

    db.query(query, [values], (err, result) => {
        if (err) throw err;
        res.send(`${result.affectedRows} rows inserted`);
    });
    console.log(data);
}); 

app.post("/insert/tickets", (req, res) => {
    const data = req.body;
    const query = 'INSERT INTO tickets (ticket_id, destination, source, date, bus_id, seat, name, age) VALUES ?';
    const values = data.map(item => [item.book_id, item.book_destination, item.book_source, item.book_date, item.book_bus,
        item.book_seat, item.book_name, item.book_age
    ]);

    db.query(query, [values], (err, result) => {
        if (err) throw err;
        res.send(`${result.affectedRows} rows inserted`);
    });
    console.log(data);
}); 

app.listen(8081, () => {
    console.log("Server is listening on port 8081");
});
