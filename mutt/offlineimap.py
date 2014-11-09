#!/usr/bin/env python

import os
import subprocess

def get_pws():
    command = [
        "gpg", "--batch", "--no-tty", "--quiet", "--decrypt",
        os.path.expanduser("~/.mutt/pws.gpg")]
    pw = subprocess.check_output(command)

    return str(pw).strip()
