let fruta = prompt(
  "ππFeria de frutas ππ. Que fruta desea agregar a su compra π"
);
let frutas = [];
frutas.push(fruta);

while (confirm("Desea Agregar mas frutas? π")) {
  fruta = prompt("Que fruta otra fruta desea agregar a su compra π");

  frutas.push(fruta);
}

console.log("Las Frutas que tiene en su carrito π, son las siguientes.");
for (fruta of frutas) {
  console.log(fruta);
}
