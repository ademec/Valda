#!/usr/bin/python
# -*- coding: UTF-8 -*-

"""
author = Jean-Damien Généro
date = 2021-09-25
"""

import os

chemin_actuel = os.path.dirname(os.path.abspath(__file__))
print(chemin_actuel)

templates = os.path.join(chemin_actuel, "app", "templates", "static")
print(templates)
