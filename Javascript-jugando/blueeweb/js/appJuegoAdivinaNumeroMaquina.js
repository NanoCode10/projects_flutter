let numeroMaquina = Math.floor(Math.random() * (10 - 1)) + 1;
console.log(numeroMaquina);

let numeroUsuario = parseInt(prompt('Adivine el numero del 1 al 10'));
let vidas = 3;
while (numeroMaquina !== numeroUsuario && vidas > 1)    {

    vidas --;
    let mensaje = (numeroMaquina > numeroUsuario) ? 'El numero es Mayor': 'El numero es Menor';
    console.log("Te equivocaste 🤷‍♂️, sigue probando te quedan " + vidas + " intentntos. " + mensaje);
    
    numeroUsuario = parseInt(prompt('Adivine el numero del 1 al 10'));
    
}    

if(numeroMaquina === numeroUsuario){
    console.log("Ganaste 😍");
 
} else {
   console.log("Incorrecto Perdiste😒");
 
}