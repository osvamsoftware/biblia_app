from docx import Document

def extraer_notas_al_pie(ruta_documento):
    doc = Document(ruta_documento)
    notas_al_pie = []

    for p in doc.paragraphs:
        if p.style.name == 'Footnote Text':
            notas_al_pie.append(p.text)

    return notas_al_pie

ruta_documento = "bi.docx"
notas_al_pie = extraer_notas_al_pie(ruta_documento)

if notas_al_pie:
    print("Notas al pie encontradas:")
    for idx, nota in enumerate(notas_al_pie, start=1):
        print(f"Nota {idx}: {nota}")
else:
    print("No se encontraron notas al pie.")