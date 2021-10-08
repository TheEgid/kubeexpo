'use strict';

const express = require('express');
const path = require('path');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();

app.use(function (request, response) {
  response.sendFile(__dirname + "/index.html");
});


app.listen(PORT, HOST);

