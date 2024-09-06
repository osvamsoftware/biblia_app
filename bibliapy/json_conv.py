import json

def transformar_json(input_path, output_path):
    # Cargar el archivo JSON original
    with open(input_path, 'r', encoding='utf-8') as file:
        data = json.load(file)
    
    # Crear la nueva estructura de datos
    nuevo_json = []
    for libro, contenido in data.items():
        nuevo_json.append({
            "nombre": libro,
            "info": contenido.get("info", {}),
            "referencias": contenido.get("referencias", []),
            "capítulos": contenido.get("capítulos", {})
        })
    
    # Guardar el nuevo JSON en un archivo
    with open(output_path, 'w', encoding='utf-8') as file:
        json.dump(nuevo_json, file, ensure_ascii=False, indent=4)

# Uso de la función
input_path = 'brit_jadasha.json'  # Reemplaza con la ruta de tu archivo JSON de entrada
output_path = 'brit_jadasha_format.json'  # Reemplaza con la ruta donde quieres guardar el archivo JSON de salida
transformar_json(input_path, output_path)
