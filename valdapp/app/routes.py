
#!/usr/bin/python
# -*- coding: UTF-8 -*-


"""
author = Jean-Damien Généro
date = 2020-12-15 - 2021-02-15
"""

# libraries
# import csv
import os
import re
# from bs4 import BeautifulSoup
from flask import Flask, render_template, request
# from flask_sqlalchemy import SQLAlchemy
# from sqlalchemy import asc
# from lxml import etree


# imports
from .app import app


# routes
@app.route("/")
def home():
    """Loading the home page.
    """
    return render_template("home.html")

@app.route("/promopic")
def promopic():
    """Loading the pictures page.
    """
    return render_template("promopic.html")

@app.route("/lingua")
def lingua():
    """Loading the linguage page.
    """
    return render_template("lingua.html")

@app.route("/horizon")
def horizon():
    """Loading the horizon page.
    """
    return render_template("horizon.html")
