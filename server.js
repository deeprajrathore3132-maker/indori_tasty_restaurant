const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");
const multer = require("multer");
const path = require("path");
const fs = require("fs");

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.static("public"));


app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "home.html"));
});

/* ================= DB ================= */

const db = mysql.createConnection({
  host: "localhost",
  user: "restaurant",
  password: "yourpassword",
  database: "foodwebsite"
});

db.connect(err => {
  if (err) console.log("DB Error ❌:", err);
  else console.log("MySQL Connected ✅");
});

/* ================= CREATE UPLOAD FOLDER ================= */

if (!fs.existsSync("uploads")) {
  fs.mkdirSync("uploads");
}

/* ================= MULTER ================= */

const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, "uploads/"),
  filename: (req, file, cb) =>
    cb(null, Date.now() + path.extname(file.originalname))
});

const upload = multer({ storage });

app.use("/uploads", express.static("uploads"));

/* ================= REGISTER ================= */

app.post("/register", (req, res) => {
  const { name, email, phone, password } = req.body;

  db.query("SELECT * FROM users WHERE email=?", [email], (err, result) => {
    if (err) return res.status(500).json({ success: false });

    if (result.length > 0) {
      return res.json({ success: false, message: "User exists" });
    }

    db.query(
      "INSERT INTO users (name,email,phone,password) VALUES (?,?,?,?)",
      [name, email, phone, password],
      err => {
        if (err) return res.status(500).json({ success: false });
        res.json({ success: true });
      }
    );
  });
});

/* ================= LOGIN ================= */

app.post("/login", (req, res) => {
  const { email, password } = req.body;

  db.query(
    "SELECT * FROM users WHERE email=? AND password=?",
    [email, password],
    (err, result) => {
      if (err) return res.status(500).json({ success: false });

      if (result.length > 0) {
        res.json({ success: true, user: result[0] });
      } else {
        res.json({ success: false });
      }
    }
  );
});

/* ================= ADMIN LOGIN ================= */

app.post("/admin/login", (req, res) => {
  const { email, password } = req.body;

  db.query(
    "SELECT * FROM admins WHERE email=? AND password=?",
    [email, password],
    (err, result) => {
      if (err) return res.status(500).json({ success: false });

      if (result.length > 0) {
        res.json({ success: true });
      } else {
        res.json({ success: false });
      }
    }
  );
});

/* ================= MENU ================= */

app.get("/admin/menu", (req, res) => {
  db.query("SELECT * FROM menu_ad ORDER BY id DESC", (err, result) => {
    if (err) return res.status(500).json([]);
    res.json(result);
  });
});

app.post("/admin/menu", upload.single("image"), (req, res) => {
  const { food, price, desc, stock } = req.body;

  let imagePath = req.file
    ? "http://localhost:3000/uploads/" + req.file.filename
    : "";

  db.query(
    "INSERT INTO menu_ad (food, price, image, description, stock) VALUES (?,?,?,?,?)",
    [food, price, imagePath, desc, stock],
    err => {
      if (err) return res.status(500).json({ success: false });
      res.json({ success: true });
    }
  );
});

app.delete("/admin/menu/:id", (req, res) => {
  db.query("DELETE FROM menu_ad WHERE id=?", [req.params.id], err => {
    if (err) return res.status(500).json({ success: false });
    res.json({ success: true });
  });
});

/* ================= USERS ================= */

app.get("/admin/users", (req, res) => {
  db.query("SELECT * FROM users ORDER BY id DESC", (err, result) => {
    if (err) return res.status(500).json([]);
    res.json(result);
  });
});

/* ================= ORDERS ================= */

app.get("/admin/orders", (req, res) => {
  db.query("SELECT * FROM orders ORDER BY id DESC", (err, result) => {
    if (err) return res.status(500).json([]);
    res.json(result);
  });
});

app.delete("/admin/deleteOrder/:id", (req, res) => {
  db.query("DELETE FROM orders WHERE id=?", [req.params.id], err => {
    if (err) return res.status(500).json({ success: false });
    res.json({ success: true });
  });
});

/* ================= PLACE ORDER ================= */

app.post("/place-order", (req, res) => {
  let { email, food, price, quantity, total, city, payment } = req.body;

  db.query(
    "INSERT INTO orders (email,food,price,quantity,total,city,payment) VALUES (?,?,?,?,?,?,?)",
    [email, food, price, quantity, total, city, payment],
    err => {
      if (err) return res.send({ status: "error" });
      res.send({ status: "success" });
    }
  );
});

/* ================= FEEDBACK ================= */

app.post("/feedback", (req, res) => {
  const { name, email, rating, message } = req.body;

  db.query(
    "INSERT INTO feedbacks (name,email,rating,message) VALUES (?,?,?,?)",
    [name, email, rating, message],
    err => {
      if (err) return res.status(500).json({ status: "error" });
      res.json({ status: "success" });
    }
  );
});

app.get("/feedback", (req, res) => {
  db.query("SELECT * FROM feedbacks ORDER BY id DESC", (err, result) => {
    if (err) return res.status(500).json([]);
    res.json(result);
  });
});

/* ================= ✅ FINAL ADMIN STATS ================= */

app.get("/admin/stats", (req, res) => {

  db.query("SELECT COUNT(*) AS users FROM users", (err, u) => {
    if (err) return res.json({});

    db.query("SELECT COUNT(*) AS orders FROM orders", (err, o) => {
      if (err) return res.json({});

      db.query("SELECT COUNT(*) AS feedback FROM feedbacks", (err, f) => {
        if (err) return res.json({});

        db.query("SELECT SUM(total) AS revenue FROM orders", (err, r) => {
          if (err) return res.json({});

          res.json({
            users: u[0].users || 0,
            orders: o[0].orders || 0,
            feedback: f[0].feedback || 0,
            revenue: r[0].revenue || 0
          });

        });
      });
    });
  });

});

/* ================= SERVER ================= */

app.listen(3000, "0.0.0.0", () => {
  console.log("Server running on port 3000 🚀");
});

app.post("/order",(req,res)=>{

let {email, food, quantity, total, city, payment} = req.body;

let sql = "INSERT INTO orders (email, food, quantity, total, city, payment) VALUES (?,?,?,?,?,?)";

db.query(sql,[email, food, quantity, total, city, payment],(err)=>{
if(err) return res.json({msg:"error"});
res.json({msg:"success"});
});

});
