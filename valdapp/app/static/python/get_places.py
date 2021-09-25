import csv
import spacy

nlp = spacy.load("fr_core_news_sm")

def thesis_places(csv_path, output_csv):
    results = []
    with open(csv_path, 'r', encoding='utf-8') as opening:
        table = csv.reader(opening)
        for line in table:
            title = line[2]
            title = title.replace("’", "'")
            doc = nlp(title)
            for ent in doc.ents:
                # print(ent.text, ent.start_char, ent.end_char, ent.label_)
                if ent.label_ in ['LOC'] or ent.label_ in ['GPE']:
                    places = [line[0], line[1], ent.text]
                    print(places)
                    results.append(places)
    with open(output_csv, 'w', encoding='utf-8') as writting:
        writer = csv.writer(writting)
        writer.writerow(["id_these", "id_hackaton", "Places"])
        for result in results:
            writer.writerow(result)

thesis_places("../csv/thesis_list.csv", "../csv/thesis_list_output.csv")