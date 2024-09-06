
import json

def verificar_versiculos(json_file):
    with open(json_file, 'r', encoding='utf-8') as file:
        data = json.load(file)
    
    capitulos = data.get('capítulos', {})
    
    for capitulo_num, versiculos in capitulos.items():
        versiculos_list = list(versiculos.keys())
        
        # Verificar si el primer versículo es 1
        if versiculos_list[0] != '1':
            print(f"El capítulo {capitulo_num} no comienza con el versículo 1.")
        
        # Verificar que los versículos estén en orden numérico y consecutivo
        for i in range(1, len(versiculos_list)):
            actual = int(versiculos_list[i])
            anterior = int(versiculos_list[i - 1])
            
            if actual != anterior + 1:
                print(f"El capítulo {capitulo_num} tiene un desorden en los versículos: "
                      f"el versículo {anterior} es seguido por el versículo {actual}.")
                break
        
        print(f"Capítulo {capitulo_num} tiene {len(versiculos)} versículos.")

verificar_versiculos('tanaj.json')

