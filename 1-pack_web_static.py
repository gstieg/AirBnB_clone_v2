#!/usr/bin/python3
"""generates a .tgz archive from the contents of the web_static"""
from fabric.api import local
from datetime import datetime


def do_pack():
    """def do pack prototype"""
    time = datetime.now().strftime('%Y%m%d%H%M%S')
    local("mkdir -p versions")
    path = local("tar -czvf versions/web_static_{}.tgz web_static/"
                 .format(time))
    if path.succeeded:
        return path
    else:
        return None
