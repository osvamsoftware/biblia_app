import json
import re
from texto import texto_inicial

def formatear_texto(texto_inicial):
    # Separar el texto_inicial en líneas
    lineas = texto_inicial.split('\n')
    resultado = []
    linea_acumulada = ""
    
    for linea in lineas:
        linea = linea.strip()
        if not linea:
            continue  # Omitir líneas vacías
        
        if linea[0].isdigit() and (len(linea) == 1 or linea[1] == ' ' or linea[1].isdigit()) or linea[0] == ":" or re.match(r'^\d+:\d+', linea) or linea.startswith('(En ivri:'):
            # Si la línea empieza con un número y es corta o seguida de un espacio
            if linea_acumulada:
                resultado.append(linea_acumulada)
            linea_acumulada = linea
        else:
            # Si la línea no comienza con un número, agregar al texto_inicial acumulado
            if linea_acumulada:
                linea_acumulada += ' ' + linea
            else:
                linea_acumulada = linea
                if "Significado:" in linea:
                    resultado.append("") 
                    
    if linea_acumulada:
        resultado.append(linea_acumulada)

    return '\n'.join(resultado)

def procesar_texto(texto_2):
    capitulos = {}
    capitulo_actual = None
    ref_buffer = []

    lineas = texto_2.split('\n')
    i = 0

    while i < len(lineas):
        linea = lineas[i].strip()

        if not linea:
            i += 1
            continue
        
        # Detectar y procesar los capítulos
        if re.match(r'^\s*\d+\s*$', linea):
            capitulo_actual = linea.strip()
            print("CAPITULO ACTUAL -------> " + capitulo_actual)
            capitulos[capitulo_actual] = {}
        
        # Detectar y procesar los versículos
        elif re.match(r'^\d+', linea) and ':' not in linea[:3]:
            versiculo, texto_versiculo = linea.split(' ', 1)
            versiculo_numero = re.match(r'^(\d+)', versiculo).group(1)
            print('ULTIMO VERSICULO REGISTRADO: -----> ' + versiculo_numero)
            capitulos[capitulo_actual][versiculo_numero] = { "texto":linea, "referencias":[] }

        # Procesar referencias con formato "X:Y ..."
        elif re.match(r'^\d+:\d+', linea):
            partes = linea.split(":", 1)  # Dividir en la primera ocurrencia de ":"
            
            if len(partes) == 2:
                subpartes = partes[1].strip().split()
        
                if subpartes[0].isdigit():
                    numero_m = subpartes[0]
                    print("El número extraído es:", numero_m)
        
                    # Verificar si el número extraído ya existe en el capítulo actual
                    if numero_m in capitulos[capitulo_actual]:
                        print('EXISTE')
                        capitulos[capitulo_actual][numero_m]['referencias'].append(" ".join(subpartes[1:]))  # Agregar texto sin el número
                        capitulos[capitulo_actual][numero_m]['referencias'].extend(ref_buffer)
                        ref_buffer = []
                    else:
                        print('NO EXISTE')
                        ref_buffer.append(" ".join(subpartes))  # Agregar la línea entera sin el número y dos puntos
  
        # Procesar versículos con formato ":X ..."
        elif re.match(r'^\s*:\d+', linea):
            texto_sin_dos_puntos = linea.lstrip(':')
            versiculo, texto_versiculo = texto_sin_dos_puntos.split(' ', 1)
            versiculo_numero = re.match(r'^(\d+)', versiculo).group(1)
            capitulos[capitulo_actual][versiculo_numero] =  { "texto":linea, "referencias":[] }

        else:
            print("AQUI EL ERROR ======>" + linea)
        i += 1
    return capitulos

# Aplicar la función al texto
texto_formateado = formatear_texto(texto_inicial)
# print(texto_formateado)

# Procesar el texto para organizar capítulos y versículos
datos = procesar_texto(texto_formateado)

# Formatear el JSON con saltos de línea
json_formateado = json.dumps(datos, ensure_ascii=False, indent=4)
json_formateado = json_formateado.replace("\\n", "\n")
print(json_formateado)

# Guardar en archivo JSON
with open('12212.json', 'w', encoding='utf-8') as archivo:
    archivo.write(json_formateado)
print("Archivo JSON creado exitosamente.")
