public class Main {
    public static boolean esPrimo(int n) {
        if (n < 2) return false;
        for (int i = 2; i * i <= n; i++)
            if (n % i == 0) return false;
        return true;
    }

    public static void main(String[] args) {
        int contador = 0;
        System.out.println("Números primos entre 0 y 300:");
        for (int i = 0; i <= 300; i++) {
            if (esPrimo(i)) {
                System.out.print(i + " ");
                contador++;
            }
        }
        System.out.println("\nCantidad total: " + contador);
    }
}
