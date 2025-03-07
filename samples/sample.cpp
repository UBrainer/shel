#include <iostream>

bool esPrimo(int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; ++i)
        if (n % i == 0) return false;
    return true;
}

int main() {
    int contador = 0;
    std::cout << "Números primos entre 0 y 300:\n";
    for (int i = 0; i <= 300; ++i) {
        if (esPrimo(i)) {
            std::cout << i << " ";
            contador++;
        }
    }
    std::cout << "\nCantidad total: " << contador << std::endl;
    return 0;
}
