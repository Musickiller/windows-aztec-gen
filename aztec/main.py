from sys import argv
from os import path
from aztec_code_generator.aztec_code_generator import AztecCode

helptext='''
The script makes Aztec Code PNG picture out of a string that is passed as a parameter.

Possible options:
-h to view this message
-p to make the code from a clipboard
'''

log = 0

moduledir = path.dirname(path.abspath(__file__))
imgdir = moduledir+'\\aztec_code.png'
if log > 0:
    print("image dir = " + imgdir)

# first argument is the current helpfile, so...

# Selecting second argument to be converted as out data
# I know that it could be skipped and argc[0] should be passed
#   directly, but I like the word "data".
if log > 0:
    print ("argv[1] = " + argv[1])
if len(argv) <= 1:
    print("ERROR: no argument!")
    print(helptext)
    exit()
elif argv[1] == "-h":
    print(helptext)
    exit()
elif argv[1] == "-p":
    # ready do do something dirty?
    from tkinter import Tk #yes, in the middle of the file!
    data = str(Tk().clipboard_get())
else:
    data = argv[1]
aztec_code = AztecCode(data)
aztec_code.save(imgdir, module_size=4)
