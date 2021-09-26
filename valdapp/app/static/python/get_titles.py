
import csv
import pandas as pd


def get_titles_and_url(csv_path):
	"""
	:param csv_path: path to the thesis csv
	:type csv_path: str
	:return: list with lists ["title", "url"]
	:rtype: list
	"""
	titles_url = []
	with open(csv_path, 'r', encoding='utf-8') as opening:
		table = csv.reader(opening)
		for line in table:
			titles_url.append([line[2], line[-1] + "/" + line[0]])
	# print(titles_url)
	del titles_url[0]
	return titles_url


def places_list(places_csv):
	"""
	:param places_csv: path to a csv with placenames in column 1
	:type places_csv: str
	:return: list with placenames, latitude, longitude
	:rtype: list
	"""
	counter = -1
	places = []
	with open(places_csv, 'r', encoding='utf-8') as opening:
		cities = csv.reader(opening)
		for city in cities:
			places.append([city[1], city[2], city[3]])
	# print(places)
	return places


def dict_title(placenames, titles):
	"""
	:param placenames: list with placenames
	:type placenames: list
	:param titles: list with list ["titles", "url"]
	:type titles: list
	:return: dict with {placename1: [["titles with placename1", "url"], ...], placename2: ...}
	"""
	places_dict = {}
	places_dict2 = {}
	for item in placenames:
		temporary_list = []
		for title in titles:
			if item[0] in title[0]:
				# print(item, " ==== ", title[0])
				# temporary_list.append(title)
				tag = '<br/><a href="{}" target="_blank">{}</a>'.format(title[1], title[0])
				temporary_list.append(tag)
		places_dict2[item[0]] = "".join(temporary_list)
	# print(places_dict2)
	return places_dict2


def add_places_to_csv(csv_geocoder, dict_with_places):
	with open(csv_geocoder, 'r', encoding='utf-8') as opening:
		geocode = csv.reader(opening)
		for item in dict_with_places:
			counter = 0
			for thesis in dict_with_places[item]:
				counter += 1
				# print(counter)
				# print(thesis[0])
		for line in geocode:
			place = line[1]
			# print(dict_with_places[place])
	df = pd.read_csv(csv_geocoder)
	Lieux = []
	for index, row in df.iterrows():
		print(dict_with_places[row["Places"]])
		Lieux.append(dict_with_places[row["Places"]])
	df["Lieux"] = Lieux
	df.to_csv(csv_geocoder)

		# for place in dict_with_places:
			# if place == row["Places"] or place == row["Places"].title():
				# df["Lieux"] = dict_with_places[place]
				# df.to_csv(csv_geocoder, index=False)
		# print(df["Lieux"])


				
# dict_title(places_list("../csv/geocoder.csv"), get_titles_and_url("../csv/theses_URL_dev.csv"))
add_places_to_csv("../csv/geocoder.csv", dict_title(places_list("../csv/geocoder.csv"), get_titles_and_url("../csv/theses_URL_dev.csv")))
