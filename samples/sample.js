function esPrimo(n) {
    if (n < 2) return false;
    for (let i = 2; i * i <= n; i++)
        if (n % i === 0) return false;
    return true;
}

let contador = 0;
let primos = [];

for (let i = 0; i <= 300; i++) {
    if (esPrimo(i)) {
        primos.push(i);
        contador++;
    }
}

console.log("Números primos entre 0 y 300:");
console.log(primos.join(" "));
console.log("Cantidad total:", contador);

