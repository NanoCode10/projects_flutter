let fruta = prompt(
  "🍉🍌Feria de frutas 🍏🍇. Que fruta desea agregar a su compra 🛒"
);
let frutas = [];
frutas.push(fruta);

while (confirm("Desea Agregar mas frutas? 🛒")) {
  fruta = prompt("Que fruta otra fruta desea agregar a su compra 🛒");

  frutas.push(fruta);
}

console.log("Las Frutas que tiene en su carrito 🛒, son las siguientes.");
for (fruta of frutas) {
  console.log(fruta);
}
