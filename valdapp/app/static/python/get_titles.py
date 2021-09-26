
import csv


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


def titles_list(places_csv):
	"""
	:param places_csv: path to a csv with placenames in column 1
	:type places_csv: str
	:return: list with placenames
	:rtype: list
	"""
	counter = -1
	places = []
	with open(places_csv, 'r', encoding='utf-8') as opening:
		cities = csv.reader(opening)
		for city in cities:
			places.append(city[1])
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
	place_dict = {}
	for item in placenames:
		temporary_list = []
		for title in titles:
			if item in title[0]:
				# print(item, " ==== ", title[0])
				temporary_list.append(title)
		place_dict[item] = temporary_list
	print(place_dict)
	return place_dict
				

dict_title(titles_list("../csv/geocoder.csv"), get_titles_and_url("../csv/theses_URL_dev.csv"))
