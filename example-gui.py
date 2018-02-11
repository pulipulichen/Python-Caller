# Source: https://stackoverflow.com/a/3579625/6645399

from __future__ import print_function

# install packages programmatically
import pip
def install_and_import(package):
    import importlib
    try:
        importlib.import_module(package)
    except ImportError:
        import pip
        pip.main(['install', package])
    finally:
        globals()[package] = importlib.import_module(package)

install_and_import('docopt')
from docopt import docopt

# Python 2-3 compatible
try:
    from Tkinter import Tk
    from tkFileDialog import askopenfilename
    from tkSimpleDialog import askinteger
except:
    from tkinter import tk
    from filedialog import askopenfilename
    from simpledialog import askinteger
import os
import sys

# tkinter GUI
Tk().withdraw() # we don't want a full GUI, so keep the root window from appearing
filename = askopenfilename(initialdir=os.path.dirname(os.path.realpath(sys.argv[0])),
                                    title="Please select a Python script:",
                                    filetypes=[('Python script', '.py')]) # show an "Open" dialog box and return the path to the selected file
print(filename)

intresult = askinteger("Ask a integer", "Which number you like? [1-5]",
                                 minvalue=1, maxvalue=5, initialvalue=3) 
print(intresult)