/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const form = document.getElementsByTagName('form')[0];

const email = document.getElementById('email');
const emailError = document.getElementById('emailError');

const pass = document.getElementById('pass');
const passError = document.getElementById('passError');


function validar(){
    
    console.log(form);
    console.log(email);
    console.log(emailError);
    
    email.addEventListener('blur', function(e){
       // Quitamos el error si es valido
        if (email.validity.valid) {
            emailError.innerHTML = 'Ok';
            emailError.className = 'no-error';
        }else{ //Si tiene error lo mostramos
            mostrarErrorMail();
        }
    });
    
    pass.addEventListener('blur', function(e){
        // Quitamos el error si es valido
        if (pass.validity.valid) {
            passError.innerHTML = 'Ok';
            passError.className = 'no-error';
        }else{ //Si tiene error lo mostramos
            mostrarErrorPass();
        }
    });
    
    
    function mostrarError(campo, error){
        console.log(campo);
        if (campo.validity.valueMissing) {
            // Si el campo esta cacio
            error.textContent = 'Debe introducir un valor';
        }else if(campo.valitity.patternMismatch){
            // No es el valor esperado
            if (campo === email) {
                error.textContent = 'Debe de introducir un email correcto';
            }else if (campo === pass) {
                error.textContent = 'Debe de introcucir una contraseña de 4 caracteres';
            }
            error.textContent = 'error activate';
        }
    }
    
    function mostrarErrorMail(){
        if (email.validity.valueMissing) {
            emailError.textContent = 'Debe introducir un valor';
        }else if (email.validity.patternMismatch){
            emailError.textContent = 'Debe introducir un email correcto';
        }
        emailError.className = 'error activate';
    }
    
    function mostrarErrorPass(){
        if (pass.validity.valueMissing) {
            passError.textContent = 'Debe introducir un valor';
        }else if (pass.validity.patternMismatch){
            passError.textContent = 'Debe introducir una contraseña de 4 digitos)';
        }
        emailError.className = 'error activate';
    }
    
    form.addEventListener('submit', function (event){
        if (!email.validity.valid) {
            mostrarErrorMail();
            event.preventDefault();
        }
        if (!pass.validity.valid) {
            mostrarErrorPass();
            event.preventDefault();
        }
    });
}