// Create a new element and attach it to the page
function makeNewElement() {
    var num = Math.floor( Math.random() * 100 );
    var newElem = '<p>You are lucky number ' + num + '</p>';
    document.write(newElem);
    document.close();
}
