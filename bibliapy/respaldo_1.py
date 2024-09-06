import json
import re
from brit_jadasha import contenido

# Texto de entrada


def procesar_texto(texto):
    libros = {}
    libro_actual = None
    capitulo_actual = None
    linea_acumulada = ""
    versiculo_numero = ""


    lineas = texto.split('\n')
    i = 0

    while i < len(lineas):
        linea = lineas[i].strip()

        
        if not linea:
            i += 1
            continue
        
        # Detectar y procesar el nombre del libro
        if re.match(r'^[A-Za-z]+$', linea):
            libro_actual = linea
            info_libro = {}
            
            # Leer la información adicional
            i += 1
            if i < len(lineas):
                info_linea = lineas[i].strip()
                if re.match(r'^\(En ivri:', info_linea):
                    info_libro = {
                        "En ivri": re.search(r'En ivri:\s*(.*?)\s*(?:–|-)', info_linea).group(1),
                        "Español": re.search(r'Español:\s*(.*?)\s*(?:–|-)', info_linea).group(1),
                        "Significado": re.search(r'Significado:\s*(.*)', info_linea).group(1).strip(')')
                    }
                # i += 1
            
            libros[libro_actual] = {
                "info": info_libro,
                "referencias":[],
                "capítulos": {}
            }
        
        
        # Detectar y procesar los capítulos
            print('LIBRO ACTUAL ==>> ' + libro_actual)
        elif re.match(r'^\s*\d+\s*$', linea):
            capitulo_actual = linea.strip()
            # print('CAPITULO ACTUAL ===> ' + capitulo_actual)
            libros[libro_actual]["capítulos"][capitulo_actual] = {}
            
        
        # Detectar y procesar los versículos
        elif re.match(r'^\d+', linea) and ':' not in linea[:3]:
            versiculo, texto_versiculo = linea.split(' ', 1)
            versiculo_numero = re.match(r'^(\d+)', versiculo).group(1)
            linea_acumulada = texto_versiculo
            libros[libro_actual]["capítulos"][capitulo_actual][versiculo_numero] = linea_acumulada

        # Procesar referencias con formato "X:Y ..."
        elif re.match(r'^\d+:\d+', linea):
            partes = linea.split(":", 1)  # Dividir en la primera ocurrencia de ":"
            if len(partes) == 2:
                subpartes = partes[1].strip().split()
                if subpartes[0].isdigit():
                    dividir_versiculo = partes[1].split(" ", 1)
                    linea_acumulada = dividir_versiculo[1]
                    libros[libro_actual]["capítulos"][capitulo_actual][str(dividir_versiculo[0])] = linea_acumulada
                        

        elif re.match(r'^\s*:\d+', linea):
            texto_sin_dos_puntos = linea.lstrip(':')
            versiculo, texto_versiculo = texto_sin_dos_puntos.split(' ', 1)
            versiculo_numero = re.match(r'^(\d+)', versiculo).group(1)
            linea_acumulada = texto_versiculo
            libros[libro_actual]["capítulos"][capitulo_actual][versiculo_numero] = linea_acumulada

        else:
            # print("CAPITULO ===>> " + capitulo_actual)
            # print("VERSICULO ===>>" +  versiculo_numero)
            # print("LINEA ACUMULADA ====>>>")
            # print(linea_acumulada)
            if '“' in linea_acumulada:
                print(f"COMILLAS =>>>>>>>>  {linea_acumulada}")
    
            linea_acumulada = linea_acumulada + " " + linea
            if libros[libro_actual]["capítulos"]:
                libros[libro_actual]["capítulos"][capitulo_actual][versiculo_numero] = linea_acumulada
                None
            else:
                libros[libro_actual]["info"]["Significado"] = libros[libro_actual]["info"]["Significado"] + " " + linea
                print('Significado ----===---' + libros[libro_actual]["info"]["Significado"])
           
        i += 1
    return libros

# Procesar el texto
datos = procesar_texto(contenido)

# Guardar en archivo JSON
with open('brit_jadasha.json', 'w', encoding='utf-8') as archivo:
    json.dump(datos, archivo, ensure_ascii=False, indent=4)

print("Archivo JSON creado exitosamente.")


# def formatear_texto(texto):
#     # Separar el texto en líneas
#     lineas = texto.split('\n')
#     resultado = []
#     linea_acumulada = ""
    
#     for linea in lineas:
#         linea = linea.strip()
#         if not linea:
#             continue  # Omitir líneas vacías
        
#         if linea[0].isdigit() and (len(linea) == 1 or linea[1] == ' ' or linea[1].isdigit()) or linea[0] == ":":
#             # Si la línea empieza con un número y es corta o seguida de un espacio
#             if linea_acumulada:
#                 resultado.append(linea_acumulada)
#             linea_acumulada = linea
#         else:
#             # Si la línea no comienza con un número, agregar al texto acumulado
#             if linea_acumulada:
#                 linea_acumulada += ' ' + linea
#             else:
#                 linea_acumulada = linea
    
#     # Agregar la última línea acumulada
#     if linea_acumulada:
#         resultado.append(linea_acumulada)
    
#     return '\n'.join(resultado)
# # Aplicar la función al texto
# texto_formateado = formatear_texto(texto)

# # Imprimir el texto formateado
# print(texto_formateado)
