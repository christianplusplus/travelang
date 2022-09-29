{
    function joinInt(int_arr) {
        return parseInt(int_arr.join(''));
    };
    function rollDice(quantity, faces) {
        var sum = 0;
        for(var i = 0; i < quantity; i++)
            sum += Math.floor(faces * Math.random() + 1)
        return sum;
    };
    function rollTable(table_name) {
        var table = tables[table_name];
        var index = Math.floor(Math.random() * table.length);
        var entry = table[index];
        while(entry === undefined && index < table.length)
            entry = table[++index];
        return entry();
    };
    function listTable(table_name) {
        var table = tables[table_name];
        
        var table_list = [];
        var count = 1;
        table.forEach(entry => {
                if(entry === undefined) {
                    count++;
                }
                else {
                    table_list.push(`${count} : ${entry}`);
                    count = 1;
                }
            }
        )

        return table_list;
    };
}

statement
= a:(
  roll_statement
/ math_expression
/ list_table_expression
) {return a}

list_table_expression
= 'list'i __ 'table'i __ table:table {return listTable(table)}

roll_statement
= 'roll'i __ math:math_expression {return math}
/ 'roll'i __ table:table {return rollTable(table)}

math_expression
= a:term b:(_ ('+' / '-') _ term)* {return b.reduce((acc, tokens) => {
        switch(tokens[1]) {
            case '+':
                return acc + tokens[3];
            case '-':
                return acc - tokens[3];
        }
    }, a)}

term
= a:factor b:(_ ('*' / '/') _ factor)* {return b.reduce((acc, tokens) => {
        switch(tokens[1]) {
            case '*':
                return acc * tokens[3];
            case '/':
                return acc / tokens[3];
        }
    }, a)}

factor
= '-' _ a:unit {return -a}
/ a:unit {return a}

unit
= '(' _ a:math_expression _ ')' {return a}
/ a:value {return a}

value
= a:dice_expression {return a}
/ a:[0-9]+ {return joinInt(a)}
/ a:('$'[A-Z_0-9]i+) {return window[a.join('')]}

dice_expression
= quantity:[0-9]* 'd'i faces:[0-9]+ {var qty = joinInt(quantity); var size = joinInt(faces); return rollDice(Number.isNaN(qty) ? 1 : qty, size)}

_ 'optional whitespace'
= [ \t\n\r]*

__ 'manditory whitespace'
= [ \t\n\r]+
