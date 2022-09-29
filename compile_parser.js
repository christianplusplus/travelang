require('./tables.js');
const fs = require('fs');

var pre = `
table
= a:(
  `;

var post = `
) {return a.toLowerCase()}
`

var delim = '\n/ '

var table_expression = pre + Object.keys(tables).sort((a, b) => b.length - a.length).map(t => "'" + t + "'i").join(delim) + post;

fs.copyFileSync('travelang.pegjs', 'travelang.temp');
fs.appendFileSync('travelang.temp', table_expression);