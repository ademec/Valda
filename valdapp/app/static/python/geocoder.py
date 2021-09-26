import csv
import time
import pandas
from geopy.geocoders import Nominatim

def getting_coordinates() -> None:
    """
    Getting monographs' places' coordinates.
    :return: None
    """
    start_time = time.time()
    data = pandas.read_csv("../csv/geocoder.csv", index_col=None, header=0, sep=",")
    print(data)

    def get_latitude(geolocate):
        """
        Getting latitude
        :param geolocate: string with placename region country
        :return: latitude
        :rtype: str
        """
        if hasattr(geolocate, 'latitude') and (geolocate.latitude is not None):
            print(geolocate.latitude)
            return geolocate.latitude

    def get_longitude(geolocate):
        """
        Getting longitude.
        :param geolocate: string with placename region country
        :type geolocate: str
        :return: longitude
        :rtype: str
        """
        if hasattr(geolocate, 'longitude') and (geolocate.longitude is not None):
            return geolocate.longitude

    geolocator = Nominatim(user_agent="You", timeout=5)
    # data['Localisation'] = data['Settlement'].map(str) + " " + data['Region'].map(str) + " " + data['Country'].map(str)
    # data.to_csv("../csv/geocoder.csv")
    geolocate_column = data['Places'].apply(geolocator.geocode)
    print()
    data['latitude'] = geolocate_column.apply(get_latitude)
    data['longitude'] = geolocate_column.apply(get_longitude)
    # data = data.drop(["Settlement", "Region", "Country"], axis=1)
    data.to_csv("../csv/geocoder.csv")
    print("--- %s seconds ---" % (time.time() - start_time))


getting_coordinates()