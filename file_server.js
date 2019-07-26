const express = require('express');
const app = express();
const cors = require('cors');
const port = 8000;
const bodyParser = require("body-parser");
var mysql = require('mysql');
const multipart = require('connect-multiparty');
const nodemailer = require('nodemailer');
const multipartMiddleware = multipart({
    uploadDir: './uploads',
    
});

var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'recruitment'
});
 
db.connect(function(err){
    if (err) console.log(err)
});
 

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));

app.post('/api/upload', multipartMiddleware, async (req, res) => {
    const files = req.files.uploads;
    const data = JSON.parse(req.body.data);
    const fields = data.details;
    const fixName = (filename) => {
        const split = filename.split('fakepath\\')
        return split[1];
    };
    fields.forEach(element => {
        if(element.type == 'file') {
           const index = files.findIndex(value => value.originalFilename == fixName(element.value));
           if(index > -1) {
            element.value = files[index].path
           }
        }
    });
    const dateNow = new Date().getTime();

    db.query(`INSERT INTO candidates (id, created_on, job_opening_id, job_title, stage, rating, details, interviews, to_dos, status, comment) VALUES (NULL, ${dateNow}, ${data.job_opening_id}, '${data.job_title}', '${data.stage}', 0.00, '${JSON.stringify(data.details)}', '[]', '[]', '', '')`, (err, results) => {
        if(err) {
            console.log(err)
        }
        res.json(data);
    });

});

app.post('/api/upload/missing', multipartMiddleware, async (req, res) => {
    const files = req.files.uploads;
    const data = JSON.parse(req.body.data);
    const fields = data.missing_fields;
    const fixName = (filename) => {
        const split = filename.split('fakepath\\')
        return split[1];
    };
    fields.forEach(element => {
        if(element.type == 'file') {
           const index = files.findIndex(value => value.originalFilename == fixName(element.value));
           if(index > -1) {
            element.value = files[index].path
           }
        }
    });
    db.query(`UPDATE candidates SET details = '${JSON.stringify([...data.completed_fields, ...data.missing_fields])}' WHERE id = ${data.candidate_id}`, (err, results) => {
        if(err) {
            console.log(err)
        }
        res.json(data);
    });

});

app.get('/mailer', (req, res) => {
    var transporter = nodemailer.createTransport({
        host: 'localhost',
        port: 25,
        secure: false
       });

       transporter.verify(function(error, success) {
        if (error) {
          console.log(error);
          res.json(error);
        } else {
          console.log("Server is ready to take our messages");
          res.json(success)
        }
      });
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`));