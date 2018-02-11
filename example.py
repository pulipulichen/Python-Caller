# Source: https://stackoverflow.com/a/3579625/6645399

try:
    from tkFileDialog import askopenfilename
except:
        from filedialog import askopenfilename

Tk().withdraw() # we don't want a full GUI, so keep the root window from appearing
filename = askopenfilename() # show an "Open" dialog box and return the path to the selected file
print(filename)