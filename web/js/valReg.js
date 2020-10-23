/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const form = document.getElementsByTagName('form')[0];
var a;
var b;
var c;
function validar(){
    crearCaptcha();
    
    form.addEventListener('submit', function (event){
        if (!validarCaptcha()) {
            event.preventDefault();
        }
    });
    
}

function crearCaptcha(){
    a = Math.floor(Math.random() * 11);
    b = Math.floor(Math.random() * 11);
    var op = new Array('+','-','/','*');
     c = op[Math.floor(Math.random() * op.length)];
    
    var code = a + " " + c + " " + b;
    console.log(code);
    creaIMG(code);
}

function creaIMG(texto){
    var ctxCanvas = document.getElementById('captcha').getContext('2d');
    var fontSize = "30px";
    var fontFamily = "Arial";
    var width = 250;
    var height = 50;
    //tamaño
    ctxCanvas.canvas.width = width;
    ctxCanvas.canvas.height = height;
    //color de fondo
    ctxCanvas.fillStyle = "whitesmoke";
    ctxCanvas.fillRect(0, 0, width, height);
    //puntos de distorsión
    ctxCanvas.setLineDash([7, 10]);
    ctxCanvas.lineDashOffset = 5;
    ctxCanvas.beginPath();
    var line;
    for (var i = 0; i < (width); i++) {
        line = i * 5;
        ctxCanvas.moveTo(line, 0);
        ctxCanvas.lineTo(0, line);
    }
    ctxCanvas.stroke();
    //formato texto
    ctxCanvas.direction = 'ltr';
    ctxCanvas.font = fontSize + " " + fontFamily;
    //texto posicion
    var x = (width / 9);
    var y = (height / 3) * 2;
    //color del borde del texto
    ctxCanvas.strokeStyle = "yellow";
    ctxCanvas.strokeText(texto, x, y);
    //color del texto
    ctxCanvas.fillStyle = "red";
    ctxCanvas.fillText(texto, x, y);  
}

function validarCaptcha(){
    var n1 = parseInt(a);
    var n2 = parseInt(b);
    var res = 0;
    
    console.log(n1);
    console.log(n2);
    console.log(c);
    
    
    
    switch (c) {
        case "+":
            res = n1 + n2;
            break;
        case "-":
            res = n1 - n2;
            break;
        case "/":
            res = Math.floor(n1 / n2);
            break;
        case "*":
            res = n1 * n2;
            break;
        default:
            console.log("error");
            break;
    }
    console.log("El valor de res es " + res);
    if (res === parseInt(document.getElementById("txtInput").value)) {
        return true;
    } else {
        crearCaptcha();
        return false;
    };
};