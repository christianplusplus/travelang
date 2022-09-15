{
    function makeInt(int_arr) {
        return parseInt(int_arr.join(''));
    };
    function rollDice(quantity, faces) {
        return new Array(quantity).map(Math.floor(faces * Math.random()) + 1).reduce((a,b)=>a+b);
    };
}

expression
= "roll"i ? _ dice_expression

dice_expression
= quantity:[0-9]* "d"i faces:[0-9]+ {var qty = makeInt(quantity); return rollDice(Number.isNaN(qty) ? 1 : qty, makeInt(faces))}

_ "whitespace"
  = [ \t\n\r]*

/*
Expression
  = head:Term tail:(_ ("+" / "-") _ Term)* {
      return tail.reduce(function(result, element) {
        if (element[1] === "+") { return result + element[3]; }
        if (element[1] === "-") { return result - element[3]; }
      }, head);
    }

Term
  = head:Factor tail:(_ ("*" / "/") _ Factor)* {
      return tail.reduce(function(result, element) {
        if (element[1] === "*") { return result * element[3]; }
        if (element[1] === "/") { return result / element[3]; }
      }, head);
    }

Factor
  = "(" _ expr:Expression _ ")" { return expr; }
  / Integer

Integer "integer"
  = _ [0-9]+ { return parseInt(text(), 10); }


  
*/