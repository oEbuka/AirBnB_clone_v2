#!/usr/bin/python3
<<<<<<< HEAD
"""Generates a .tgz archive from the contents of the web_static folder."""
from fabric.api import local
import time


def do_pack():
    """Generate an tgz archive from web_static folder"""
    try:
        local("mkdir -p versions")
        local("tar -cvzf versions/web_static_{}.tgz web_static/".
              format(time.strftime("%Y%m%d%H%M%S")))
        return ("versions/web_static_{}.tgz".format(time.
                                                    strftime("%Y%m%d%H%M%S")))
    except:
        return None
=======
""" a module to package web_static files """
import datetime
import os
from fabric.api import local


def do_pack():
    """ package function """
    if not os.path.isdir("./versions"):
        os.makedirs("./versions")
    ntime = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    local("tar -czzf versions/web_static_{}.tgz web_static/*".format(ntime))
    return ("{}/versions/web_static_{}.tgz".format(os.path.dirname(
        os.path.abspath(__file__)), ntime))
>>>>>>> 798f722e8f4d9a40f56b0ee21ba8ff0a067cdca5
