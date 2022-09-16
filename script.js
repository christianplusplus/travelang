function run(text) {
    try{
        document.getElementById('output').innerHTML = travelang.parse(text);
    }
    catch(e) {
        throw e;
    }
}