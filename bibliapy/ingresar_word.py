from docx import Document

def save_and_clean_text(doc_path):
    # Cargar el documento completo
    doc = Document(doc_path)
    
    # Inicializar el contador de párrafos y almacenar los textos
    paragraphs = []
    
    # Ajusta el inicio para capturar desde el párrafo 25,000
    start_line = 33000
    for i, para in enumerate(doc.paragraphs):
        if i >= start_line:
            paragraphs.append(para.text)
    
    # Unir los párrafos en un solo bloque de texto
    content = "\n".join(paragraphs)
    
    # Eliminar líneas en blanco
    cleaned_content = "\n".join(line for line in content.splitlines() if line.strip())

    # Guardar el contenido en una variable
    contenido = f'""" {cleaned_content} """'
    
    # Retornar el contenido
    return contenido

# Ruta del documento de Word
doc_path = 'KITBEHAKODESHRESTAURADAOFFSET59971.docx'
contenido_limpio = save_and_clean_text(doc_path)
with open('brit_jadasha.py', 'w', encoding='utf-8') as file:
    file.write(f'contenido = {contenido_limpio}')
# Aquí puedes imprimir el contenido limpio o usarlo en cualquier otra operación
# print(contenido_limpio)
