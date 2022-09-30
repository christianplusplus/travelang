function run(text) {
    try{
        var output = travelang.parse(text);
        if(output instanceof Array) {
            output = output.reduce((acc, val) => acc + '\n' + val);
        }
        document.getElementById('output').innerHTML = output;
    }
    catch(e) {
        if(e instanceof travelang.SyntaxError)
            document.getElementById('output').innerHTML = e.message;
        else
            throw e;
    }
}