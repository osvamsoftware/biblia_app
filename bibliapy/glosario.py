import json
from docx import Document

def read_table_from_docx(doc_path):
    # Abrir el documento
    doc = Document(doc_path)
    
    # Lista para almacenar los datos
    table_data = []

    # Iterar sobre las tablas en el documento
    for table in doc.tables:
        # Iterar sobre las filas de la tabla (omitimos la primera fila si es un encabezado)
        for row in table.rows[1:]:
            # Crear un diccionario para cada fila
            row_dict = {
                "Transliteración en Español": row.cells[0].text.strip(),
                "Español": row.cells[1].text.strip(),
                "Transliteration in English": row.cells[2].text.strip(),
                "English": row.cells[3].text.strip(),
                "Hebrew/Original Words": row.cells[4].text.strip()
            }
            # Agregar el diccionario a la lista de datos
            table_data.append(row_dict)

    return table_data

def save_to_json(data, json_path):
    # Guardar los datos en un archivo JSON
    with open(json_path, 'w', encoding='utf-8') as json_file:
        json.dump(data, json_file, ensure_ascii=False, indent=4)

# Ruta al documento de Word
doc_path = 'glosario_2.docx'
# Ruta al archivo JSON de salida
json_path = 'glosario_2.json'

# Leer la tabla del documento de Word
table_data = read_table_from_docx(doc_path)

# Guardar los datos en un archivo JSON
save_to_json(table_data, json_path)

print(f'Datos guardados en {json_path}')
