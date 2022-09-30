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
var tables = {};
var files = [];
fs.readdirSync(normalizedPath).forEach( f => {
        files.push(f);
        eval(fs.readFileSync('./tables/' + f, 'utf8'));
    }
);

var table_expression = pre + Object.keys(tables).sort((a, b) => b.length - a.length).map(t => "'" + t + "'i").join(delim) + post;
var source_expression = files.map(f => '<script src="tables/' + f + '"></script>').join('\n\t');

fs.copyFileSync('travelang.pegjs', 'travelang.temp');
fs.appendFileSync('travelang.temp', table_expression);

var index = fs.readFileSync('./src_index.html', 'utf8');
index = index.replace(/<inject-script-here>/, source_expression);
fs.writeFileSync('index.html', index);