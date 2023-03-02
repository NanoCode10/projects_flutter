let frutas = ["manza", "uva", "sandia","banana"];

/* for (i=0;i<frutas.length;i++){
    console.log(frutas[i]);

}
 */

let nombre = "Mariano";

// el for of ;muestra lo que esta adentro del array
for( letra of nombre){

    console.log(letra);
}

// el for in; muestra los indices
for (fruta in frutas){

    console.log(fruta);
}