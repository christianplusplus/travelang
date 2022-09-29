const fs = require('fs');

var pre = `
table
= a:(
  `;
var post = `
) {return a.toLowerCase()}
`
var delim = '\n/ '

var normalizedPath = require("path").join(__dirname, "tables");
var all_tables = {};
var files = [];
fs.readdirSync(normalizedPath).forEach( f => {
        files.push(f);
        require('./tables/' + f);
        Object.assign(all_tables, tables);
    }
);

var table_expression = pre + Object.keys(all_tables).sort((a, b) => b.length - a.length).map(t => "'" + t + "'i").join(delim) + post;
var source_expression = files.map(f => '<script src="tables/' + f + '"></script>').join('\n') + '\n';

fs.copyFileSync('travelang.pegjs', 'travelang.temp');
fs.appendFileSync('travelang.temp', table_expression);

fs.copyFileSync('src_index.html', 'index.html');
fs.appendFileSync('index.html', source_expression);