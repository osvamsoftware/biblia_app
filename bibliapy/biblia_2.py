import json

def verificar_capitulos_y_versiculos_completos(ruta_archivo_json):
    # Cargar el JSON desde un archivo
    with open(ruta_archivo_json, 'r', encoding='utf-8') as file:
        data = json.load(file)

    # Extraer los números de los capítulos como una lista de enteros
    capitulos = list(map(int, data['capítulos'].keys()))
    
    # Obtener el número del primer y último capítulo
    primer_capitulo = min(capitulos)
    ultimo_capitulo = max(capitulos)
    
    # Generar una lista de todos los números de capítulo que deberían estar presentes
    capitulos_completos = list(range(primer_capitulo, ultimo_capitulo + 1))
    
    # Verificar si algún capítulo está ausente
    capitulos_faltantes = [cap for cap in capitulos_completos if cap not in capitulos]
    
    if capitulos_faltantes:
        print(f"Faltan los siguientes capítulos: {capitulos_faltantes}")
    else:
        print("Todos los capítulos están presentes y en secuencia.")
    
    # Verificar si algún capítulo tiene un mapa vacío
    capitulos_vacios = [cap for cap, contenido in data['capítulos'].items() if not contenido]
    
    if capitulos_vacios:
        print(f"Los siguientes capítulos tienen un mapa vacío: {capitulos_vacios}")
    else:
        print("No hay capítulos con mapas vacíos.")
    
    # Verificar los versículos dentro de cada capítulo
    for cap_num, versiculos in data['capítulos'].items():
        if versiculos:
            # Obtener la lista de versículos como enteros
            versiculos_nums = list(map(int, versiculos.keys()))
            primer_versiculo = min(versiculos_nums)
            ultimo_versiculo = max(versiculos_nums)
            
            # Generar la lista completa de versículos esperados
            versiculos_completos = list(range(primer_versiculo, ultimo_versiculo + 1))
            
            # Verificar si algún versículo está ausente
            versiculos_faltantes = [vers for vers in versiculos_completos if vers not in versiculos_nums]
            
            if versiculos_faltantes:
                print(f"Faltan los siguientes versículos en el capítulo {cap_num}: {versiculos_faltantes} ----- {ultimo_versiculo}")
            else:
                print(f"Todos los versículos están presentes en el capítulo {cap_num}. ----- {ultimo_versiculo}")
            
            # Imprimir el número del último versículo de cada capítulo
    

# Ruta al archivo JSON
ruta_archivo_json = 'brit_jadasha/30Descendencia.json'

# Llamar a la función de verificación
verificar_capitulos_y_versiculos_completos(ruta_archivo_json)
