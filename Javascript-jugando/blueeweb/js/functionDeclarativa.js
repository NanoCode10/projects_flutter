// funciones Declarativas

function numeroAleatorio(min, max){
   // return min + min;
   return Math.floor(Math.random() * (max - min)) + min;
}
export default numeroAleatorio;
