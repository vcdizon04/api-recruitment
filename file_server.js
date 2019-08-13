const express = require('express');
const https = require('https');
const fs = require('fs');
const app = express();
const cors = require('cors');
const port = 8000;
const bodyParser = require("body-parser");
var mysql = require('mysql');
const multipart = require('connect-multiparty');
const nodemailer = require('nodemailer');

const privateKey = fs.readFileSync('/etc/letsencrypt/live/aspiremanning.com/privkey.pem', 'utf8');
const certificate = fs.readFileSync('/etc/letsencrypt/live/aspiremanning.com/cert.pem', 'utf8');
const ca = fs.readFileSync('/etc/letsencrypt/live/aspiremanning.com/chain.pem', 'utf8');
const credentials = {
	key: privateKey,
	cert: certificate,
	ca: ca
 };


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

app.post('/api/upload', multipartMiddleware, async function(req, res) {
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

app.post('/api/upload/missing', multipartMiddleware, async function(req, res) {
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

app.post('/mailer', function(req, res) {
    console.log(req.body);
    const body = req.body;
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
        }
      });

      transporter.sendMail({
        from: '"Recruitment" <recruitment@aspiremanning.com>', // sender address
        to: body.email, // list of receivers
        subject: body.subject || '', // Subject line
        // text: "Hello world?", // plain text body
        html: body.message // html body
      }).then(result => {
          console.log(result);
          res.json(result)

      }).catch(err => {
          console.log(err);
      })
});

const httpsServer = https.createServer(credentials, app);
httpsServer.listen(port, () => {
	console.log(`HTTPS Server running on port ${port}`);
});
