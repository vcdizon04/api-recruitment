const express = require('express')
const app = express()
const cors = require('cors')
const port = 8000
const bodyParser = require("body-parser");
var mysql = require('mysql')
const multipart = require('connect-multiparty');
const multipartMiddleware = multipart({
    uploadDir: './uploads',
    
});

var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'recruitment'
})
 
// Log any errors connected to the db
db.connect(function(err){
    if (err) console.log(err)
})
 

app.use(cors())
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
    }
    fields.forEach(element => {
        if(element.type == 'file') {
           const index = files.findIndex(value => value.originalFilename == fixName(element.value));
           if(index > -1) {
            element.value = files[index].path
           }
        }
    });
    const dateNow = new Date().getTime();

    db.query(`INSERT INTO candidates (id, created_on, job_opening_id, job_title, stage, rating, details, interviews, to_dos) VALUES (NULL, ${dateNow}, ${data.job_opening_id}, '${data.job_title}', '${data.stage}', 0.00, '${JSON.stringify(data.details)}', '[]', '[]')`, (err, results) => {
        if(err) {
            console.log(err)
        }
        res.json(data);
    })


    // res.json({
    //     'message': 'File uploaded succesfully.'
    // });
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`))