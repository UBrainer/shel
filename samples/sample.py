def es_primo(n):
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False
    return True

primos = [i for i in range(301) if es_primo(i)]
contador = len(primos)

print("Números primos entre 0 y 300:")
print(" ".join(map(str, primos)))
print(f"Cantidad total: {contador}")
