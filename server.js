const http = require('http');
const url = require('url');
const fs = require('fs');
const path = require('path');
// you can pass the parameter in the command line. e.g. node static_server.js 3000
const port = process.argv[2] || 9000;
const AdmZip = require('adm-zip');

// maps file extention to MIME types
const mimeType = {
    '.ico': 'image/x-icon',
    '.html': 'text/html',
    '.js': 'text/javascript',
    '.json': 'application/json',
    '.css': 'text/css',
    '.png': 'image/png',
    '.jpg': 'image/jpeg',
    '.wav': 'audio/wav',
    '.mp3': 'audio/mpeg',
    '.svg': 'image/svg+xml',
    '.pdf': 'application/pdf',
    '.doc': 'application/msword',
    '.eot': 'appliaction/vnd.ms-fontobject',
    '.ttf': 'aplication/font-sfnt'
  };
  http.createServer(function (req, res) {
    console.log(`${req.method} ${req.url}`);
  
    // parse URL
    const parsedUrl = url.parse(req.url);
  
    // extract URL path
    // Avoid https://en.wikipedia.org/wiki/Directory_traversal_attack
    // e.g curl --path-as-is http://localhost:9000/../fileInDanger.txt
    // by limiting the path to current directory only
    const sanitizePath = path.normalize(parsedUrl.pathname).replace(/^(\.\.[\/\\])+/, '');
    let pathname = path.join(__dirname, sanitizePath);
  
    fs.exists(pathname, function (exist) {
      if(!exist) {
        // if the file is not found, return 404
        res.statusCode = 404;
        res.end(`File ${pathname} not found!`);
        return;
      }
  
      // if is a directory, then look for index.html
      if (fs.statSync(pathname).isDirectory()) {
        pathname += '/index.html';
      }
  
      // read file from file system
      fs.readFile(pathname, function(err, data){
        if(err){
          res.statusCode = 500;
          res.end(`Error getting the file: ${err}.`);
        } else {
          // based on the URL path, extract the file extention. e.g. .js, .doc, ...
          const ext = path.parse(pathname).ext;
          // if the file is found, set Content-type and send data
          res.setHeader('Content-type', mimeType[ext] || 'text/plain' );
          res.end(data);
        }
      });
    });
  
  
  }).listen(parseInt(port));
  
  console.log(`Server listening on port ${port}`);
var mysql = require('mysql')
const SocketIOFile = require('socket.io-file');
const uuidv4 = require('uuid/v4');
// Let’s make node/socketio listen on port 4000
var io = require('socket.io').listen(4000);
console.log('listening localhost:4000');
// Define our db creds
var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'recruitment'
})
 
// Log any errors connected to the db
db.connect(function(err){
    if (err) console.log(err)
})
 
// Define/initialize our global vars
var jobOpenings = []
var candidates = []
var isInitjobOpenings = false
var isInitCandidates = false
var socketCount = 0
 
io.sockets.on('connection', function(socket){

    db.query('SELECT * FROM job_openings', (err, data) =>{
        if(!err){
          jobOpenings = data;
          // socket.emit('initial notes', data)
          socket.emit('initial-job-openings', data)
        }

      })

    db.query('SELECT * FROM candidates', (err, data) =>{
    if(!err){
        candidates = data;
        // socket.emit('initial notes', data)
        socket.emit('initial-candidates', data)
    }

    })

    db.query('SELECT * FROM employee', (err, data) =>{
        if(!err){
            candidates = data;
            // socket.emit('initial notes', data)
            socket.emit('initial-employee', data)
        }
    
        })

    // var count = 0;
	var uploader = new SocketIOFile(socket, {
		// uploadDir: {			// multiple directories
		// 	music: 'data/music',
		// 	document: 'data/document'
		// },
		uploadDir: 'data',							// simple directory
		// accepts: ['audio/mpeg', 'audio/mp3'],		// chrome and some of browsers checking mp3 as 'audio/mp3', not 'audio/mpeg'
		// maxFileSize: 4194304, 						// 4 MB. default is undefined(no limit)
		chunkSize: 10240,							// default is 10240(1KB)
		transmissionDelay: 0,						// delay of each transmission, higher value saves more cpu resources, lower upload speed. default is 0(no delay)
		overwrite: true, 							// overwrite file if exists, default is true.
		// rename: function(filename) {
		// 	var split = filename.split('.');	// split filename by .(extension)
		// 	var fname = split[0];	// filename without extension
		// 	var ext = split[1];

		// 	return `${fname}_${ uuidv4() }.${ext}`;
		// }
		// rename: 'MyMusic.pdf'
	});
	uploader.on('start', (fileInfo) => {
		console.log('Start uploading');
		console.log(fileInfo);
	});
	uploader.on('stream', (fileInfo) => {
		console.log(`${fileInfo.wrote} / ${fileInfo.size} byte(s)`);
	});
	uploader.on('complete', (fileInfo) => {
		console.log('Upload Complete.');
		console.log(fileInfo);
	});
	uploader.on('error', (err) => {
		console.log('Error!', err);
	});
	uploader.on('abort', (fileInfo) => {
		console.log('Aborted: ', fileInfo);
	});
    // Socket has connected, increase socket count
    socketCount++
    // Let all sockets know how many are connected
    io.sockets.emit('users connected', socketCount)
    console.log('new user connected')
 
    socket.on('disconnect', function() {
        // Decrease the socket count on a disconnect, emit
        socketCount--
        io.sockets.emit('users connected', socketCount)
    })
 
    socket.on('new note', function(data){
        // New note added, push to all sockets and insert into db
        notes.push(data)
        io.sockets.emit('new note', data)
        // Use node's db injection format to filter incoming data
        db.query('INSERT INTO job_openings', data, (err, results) => {
            if(err) {
                console.log(err)
            }
            console.log(results)
        })
    })

    socket.on('add-uid', function(id, res) {
        const uid = uuidv4();
        db.query(`UPDATE candidates SET uid = '${uid}' WHERE candidates.id = ${id};`, (err, results) => {
            if(err) {
                console.log(err)
            }
            console.log(results)
            res({uid: uid});

        })
    })

    socket.on('add-stage', function(data, res) {
        db.query(`INSERT INTO stages (stage) VALUES ('${data}')`, (err, results) => {
            if(err) {
                console.log(err)
            }
            console.log(results)
            io.sockets.emit('new-stage', data)
            res(results);

        })
    })
    socket.on('get-stages', function(data, res) {
        db.query('SELECT * FROM stages', (err, results) => {
            if(err) {
                console.log(err)
            }
            console.log(results)
            res(results);

        })
    })

    socket.on('get-candidate-by-uid', function(uid, res) {
        db.query(`SELECT * FROM candidates WHERE uid = '${uid}'`, (err, results) => {
            if(err) {
                console.log(err)
            }
            console.log(results)
            res(results);

        })
    })

    socket.on('get-candidate', function(id, res) {
        db.query(`SELECT * FROM candidates WHERE id = ${id}`, (err, results) => {
            if(err) {
                console.log(err)
            }
            res(results);

        })
    })

    
    socket.on('get-job-stages', function(id, res) {
        db.query(`SELECT hiring_workflow FROM job_openings WHERE id = ${id}`, (err, results) => {
            if(err) {
                console.log(err)
            }
            res(results);

        })
    })

    socket.on('get-departments', function(id, res) {
        db.query(`SELECT * FROM departments`, (err, results) => {
            if(err) {
                console.log(err)
            }
            res(results);

        })
    })

    socket.on('add-department', function(department, res) {
        db.query(`INSERT INTO departments (title) VALUES ('${department}')`, (err, results) => {
            if(err) {
                console.log(err)
            }
            res(results);
        })
    })

    socket.on('delete-department', function(id, res) {
        db.query(`DELETE FROM departments WHERE id = ${id}`, (err, results) => {
            if(err) {
                console.log(err)
            }
            res(results);
        })
    })

    socket.on('download-profile', function(data,res) {
        var zip = new AdmZip();
        // add local file
        data.files.forEach(element => {
            zip.addLocalFile(element.value);
        });
        // get everything as a buffer
        var willSendthis = zip.toBuffer();
        // or write everything to disk
        zip.writeZip(/*target file name*/`downloads/${data.fileName.replace(/ /g, '_')}.zip`);
        res(`downloads/${data.fileName.replace(/ /g, '_')}.zip`);
    })

    
    socket.on('log-in', function(data, res){
        console.log(data);
        db.query(`SELECT * FROM employee WHERE email = '${data.email}' AND password = '${data.password}'`, (err, results) => {
            console.log(results)
            if(err) {
                console.log(err)
                res({error: err})
            } else {
                if(results.length > 0) {
                    res(results)
                } else {
                    res({error: 'Login in Error'})
                }
            }
        })
    })

    socket.on('add-employee', function(data, res){

        const dateNow = new Date().getTime();
        console.log(data, dateNow);
        db.query(`INSERT INTO employee (id, created_on, status, name, designation, department, employment_type, details, email, level) VALUES (NULL, ${dateNow}, '${data.status}', '${data.firstName} ${data.lastName}', '${data.designation}', '${data.department}',  '${data.employeeType}', '${JSON.stringify(data.details)}', '${data.email}', 1)`, (err, results) => {
            if(err) {
                console.log(err)
            }
            console.log(results)
            res('Employee Added');
            data.id = results.insertId;
            data.name = `${data.firstName} ${data.lastName}`,
            data.employment_type = data.employeeType;
            io.sockets.emit('add-employee',data);

        })
    })

    socket.on('edit-employee', function(data, res){
 
        db.query(`UPDATE employee SET status = '${data.status}', name = '${data.name}', designation = '${data.designation}', department = '${data.department}', employment_type = '${data.employeeType}', password = '${data.password}', level = ${data.level} WHERE employee.id = ${data.id}`, (err, results) => {
            if(err) {
                console.log(err)
            }
            console.log(results)

            res(results);

        })
    })

    socket.on('add-candidate', function(data, res){
        // New note added, push to all sockets and insert into db
        // notes.push(data)
        // io.sockets.emit('new note', data)
        // Use node's db injection format to filter incoming data
        // db.query('INSERT INTO notes (note) VALUES (?)', data.note)

        const dateNow = new Date().getTime();

        console.log(data, dateNow);
        db.query(`INSERT INTO candidates (id, created_on, job_opening_id, job_title, stage, rating, details, interviews, to_dos) VALUES (NULL, ${dateNow}, ${data.job_opening_id}, '${data.job_title}', '${data.stage}', 0.00, '${JSON.stringify(data.details)}', '[]', '[]')`, (err, results) => {
            if(err) {
                console.log(err)
            }
            console.log(results)
            res('Candidate Added');
            io.sockets.emit('add-candidate',data);

        })
    })  

        socket.on('update-asignor-candidate', function(data, res){
        
            console.log(data);


            db.query(`UPDATE candidates  SET asignor = ${data.asignor}, asignor_name = '${data.asignorName}' WHERE id = ${data.id}`, (err, results) => {
                if(err) {
                    console.log(err)
                }
                console.log(results)
                res('candidate Updated');

            })
        })

      socket.on('update-interviews-candidate', function(data, res){
    
        console.log(data);


        db.query(`UPDATE candidates  SET interviews = '${JSON.stringify(data.interviews)}' WHERE id = ${data.id}`, (err, results) => {
            if(err) {
                console.log(err)
            }
            console.log(results)
            res('candidated Updated');

        })
    })

     socket.on('update-status-candidate', function(data, res){
    
        console.log(data);


        db.query(`UPDATE candidates  SET status = '${data.status}' WHERE id = ${data.id}`, (err, results) => {
            if(err) {
                console.log(err)
            }
            console.log(results)
            res('candidated Updated');

        })
    })
    socket.on('update-stage-candidate', function(data, res){
    
        console.log(data);


        db.query(`UPDATE candidates  SET stage = '${data.stage}' WHERE id = ${data.id}`, (err, results) => {
            if(err) {
                console.log(err)
            }
            console.log(results)
            res('candidated Updated');

        })
    })

    socket.on('update-comment-candidate', function(data, res){
        console.log(data);
        db.query(`UPDATE candidates  SET comment = '${data.comment}' WHERE id = ${data.id}`, (err, results) => {
            if(err) {
                console.log(err)
            }
            console.log(results)
            res('candidated Updated');

        })
    })
    socket.on('update-rating-candidate', function(data, res){
        console.log(data);
        db.query(`UPDATE candidates  SET rating = '${data.rating}' WHERE id = ${data.id}`, (err, results) => {
            if(err) {
                console.log(err)
            }
            console.log(results)
            res('candidated Updated');

        })
    })

    socket.on('add-job-opening', function(data, res){
        // New note added, push to all sockets and insert into db
        // notes.push(data)
        // io.sockets.emit('new note', data)
        // Use node's db injection format to filter incoming data
        // db.query('INSERT INTO notes (note) VALUES (?)', data.note)

        const dateNow = new Date().getTime();
        data.created_on = dateNow;
        data.job_description = JSON.stringify(data.job_description);
        data.hiring_workflow = JSON.stringify(data.hiring_workflow);
        data.job_information = JSON.stringify(data.job_information);
        data.basic_information = JSON.stringify(data.basic_information);
        data.question_set = JSON.stringify(data.question_set);

        console.log(data, dateNow);
        db.query(`INSERT INTO job_openings (id, opening_description, created_on, job_description, hiring_workflow, job_information, basic_information, question_set) VALUES (NULL, '${data.opening_description}' , ${dateNow}, '${data.job_description}', '${data.hiring_workflow}', '${data.job_information}', '${data.basic_information}', '${data.question_set}')`, (err, results) => {
            if(err) {
                console.log(err)
            }
            console.log(results)
            res('Job Opening Added');
            io.sockets.emit('add-job-opening',data);

        })
    })

    socket.on('update-job-opening', function(data, res){
    
        console.log(data);

        data.job_description = JSON.stringify(data.job_description);
        data.hiring_workflow = JSON.stringify(data.hiring_workflow);
        data.job_information = JSON.stringify(data.job_information);
        data.basic_information = JSON.stringify(data.basic_information);
        data.question_set = JSON.stringify(data.question_set);

        db.query(`UPDATE job_openings  SET opening_description = '${data.opening_description}', job_description = '${data.job_description}', hiring_workflow = '${data.hiring_workflow}', job_information = '${data.job_information}', basic_information = '${data.basic_information}', question_set = '${data.question_set}' WHERE id = ${data.id}`, (err, results) => {
            if(err) {
                console.log(err)
            }
            console.log(results)
            res('Job Opening Updated');
            io.sockets.emit('update-job-opening',data);

        })
    })

    socket.on('delete-job-opening', function(id, res){
        console.log(`${id} Deleted`);
        db.query(`DELETE FROM job_openings WHERE job_openings.id = ${id}`, (err, results) => {
            if(err) {
                console.log(err)
            }
            console.log(results)
            res('Candidate Updated');
            io.sockets.emit('delete-job-opening',id);
        })
    })

    socket.on('delete-candidate', function(id,res){
        console.log(`${id} Deleted`);
        db.query(`DELETE FROM candidates WHERE id = ${id}`, (err, results) => {
            if(err) {
                console.log(err)
            }
            console.log(results)
            res(results);
            io.sockets.emit('delete-candidate',id);
        })
    })
    // Check to see if initial query/notes are set
    // if (!isInitjobOpenings) {
    //     // Initial app start, run db query
    //     db.query('SELECT * FROM job_openings', (err, data) =>{
    //       if(!err){
    //         console.log(data);
    //         jobOpenings = data;
    //         // socket.emit('initial notes', data)
    //         socket.emit('initial-job-openings', data)
    //         console.log('!isInitjobOpenings')
    //       }

    //     })
    //     isInitNotes = true
    // } else {
    //     // Initial notes already exist, send out
    //     console.log(jobOpenings, 'else')
    //     socket.emit('initial notes', jobOpenings)
    // }

    // Check to see if initial query/notes are set
    // if (!isInitCandidates) {
    //     // Initial app start, run db query
    //     db.query('SELECT * FROM candidates', (err, data) =>{
    //       if(!err){
    //         candidates = data;
    //         // socket.emit('initial notes', data)
    //         socket.emit('initial-candidates', data)
    //         console.log('!isInitCandidates')
    //       }

    //     })
    //     isInitCandidates = true
    // } else {
    //     console.log(candidates)
    //     // Initial notes already exist, send out
    //     socket.emit('initial-candidates', candidates)
    // }
})