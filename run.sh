#!/bin/bash

# Solicitar el archivo al usuario
echo -n "Ingrese el nombre del archivo fuente: "
read FILE

# Verificar si el archivo existe
if [[ ! -f "$FILE" ]]; then
    echo "Error: El archivo no existe."
    exit 1
fi

# Obtener la extensión del archivo
EXT="${FILE##*.}"

# Determinar el lenguaje y el contenedor a usar
case "$EXT" in
    py)
        IMAGE="python:3"
        CMD="python3"
        ;;
    java)
        IMAGE="openjdk:17"
        CMD="javac $FILE && java ${FILE%.java}"
        ;;
    cpp|cc)
        IMAGE="gcc:latest"
        CMD="g++ -o program $FILE && ./program"
        ;;
    js)
        IMAGE="node:latest"
        CMD="node"
        ;;
    rb)
        IMAGE="ruby:latest"
        CMD="ruby"
        ;;
    *)
        echo "Error: Extensión no soportada."
        exit 1
        ;;
esac

# Ejecutar el código en el contenedor y medir el tiempo
echo "Ejecutando $FILE en contenedor $IMAGE..."
START_TIME=$(date +%s%3N)
OUTPUT=$(docker run --rm -v "$PWD:/app" -w /app $IMAGE bash -c "$CMD $FILE" 2>&1)
EXIT_CODE=$?
END_TIME=$(date +%s%3N)

# Calcular el tiempo de ejecución
EXEC_TIME=$((END_TIME - START_TIME))

# Mostrar la salida y el tiempo de ejecución
if [[ $EXIT_CODE -ne 0 ]]; then
    echo "Error en la ejecución del programa:"
    echo "$OUTPUT"
    exit 1
else
    echo "Salida del programa:"
    echo "$OUTPUT"
    echo "Tiempo de ejecución: ${EXEC_TIME}ms"
fi

