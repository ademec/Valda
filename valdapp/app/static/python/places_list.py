import csv
import pandas as pd

def places_list(csv_path):
	places = []
	with open(csv_path, 'r', encoding='utf-8') as opening:
		file = csv.reader(opening, sep=';')
		for line in file:
			if " " not in line[-1]:
				place = line[-1].title()
				places.append(place)
		new_list = set(places)
		for item in sorted(new_list):
			print(item)

def places_list2(csv_path, output):
	places = []
	df = pd.read_csv(csv_path, sep=";")
	# print(df.iloc[:,[-1]])
	for index, row in df.iterrows():
		if " " not in row['Places']:
			places.append(row['Places'].title())
	new_list = set(places)
	for item in sorted(new_list):
		print(item)
	results = sorted(new_list)

places_list2("../csv/liste_totale_theses_id_hackathon_joined_prepared-1.csv",
	"../csv/geocoder.csv")
