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
        return table_name;
    
        var table = window[table_name];
        return table[Math.floor(Math.random() * table.length)];
    };
}

statement
= a:(roll_statement / math_expression) {return a}

roll_statement
= 'roll'i __ a:(math_expression / table_expression) {return a}

math_expression
= a:term _ '+' _ b:math_expression {return a + b}
/ a:term _ '-' _ b:math_expression {return a - b}
/ a:term {return a}

term
= a:factor _ '*' _ b:term {return a * b}
/ a:factor _ '/' _ b:term {return a / b}
/ a:factor {return a}

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

table_expression
= a:([A-Z_]i[A-Z_0-9]i*) {return rollTable(a.join(''))}

_ "optional whitespace"
= [ \t\n\r]*

__ "manditory whitespace"
= [ \t\n\r]+