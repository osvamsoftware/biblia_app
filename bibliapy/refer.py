import json
from docx import Document

def word_to_json(word_file, json_file):
    # Abre el documento de Word
    doc = Document(word_file)
    
    # Extrae las frases de cada párrafo
    frases = [para.text for para in doc.paragraphs if para.text.strip()]
    
    # Guarda las frases en un archivo JSON
    with open(json_file, 'w', encoding='utf-8') as f:
        json.dump(frases, f, ensure_ascii=False, indent=4)

# Ejemplo de uso
word_to_json('refes.docx', 'frases.json')
