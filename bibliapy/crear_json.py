import os
import json
import re

def extraer_numero(nombre_archivo):
    # Extraer el número al inicio del nombre del archivo
    match = re.match(r'^(\d+)', nombre_archivo)
    return int(match.group(1)) if match else float('inf')

def combinar_jsons(carpeta, archivo_salida):
    datos_combinados = []

    # Obtener y ordenar los archivos según el número en su nombre
    archivos_json = sorted(
        [f for f in os.listdir(carpeta) if f.endswith(".json")],
        key=extraer_numero
    )

    # Iterar sobre los archivos ordenados y combinarlos
    for nombre_archivo in archivos_json:
        ruta_archivo = os.path.join(carpeta, nombre_archivo)
        with open(ruta_archivo, 'r', encoding='utf-8') as archivo_json:
            datos = json.load(archivo_json)
            datos_combinados.append(datos)

    # Guardar el archivo combinado
    with open(archivo_salida, 'w', encoding='utf-8') as archivo_json_salida:
        json.dump(datos_combinados, archivo_json_salida, ensure_ascii=False, indent=4)

    print(f"Todos los archivos JSON han sido combinados en {archivo_salida}")

# Ejemplo de uso:
carpeta_jsons = "brit_jadasha"  # Cambia esta ruta a la carpeta que contiene los archivos JSON
archivo_salida = "brit_jadasha.json"  # Cambia esto a la ruta de salida deseada
combinar_jsons(carpeta_jsons, archivo_salida)
