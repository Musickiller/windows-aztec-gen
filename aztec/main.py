from sys import argv
from os import path
from aztec_code_generator import AztecCode

helptext='''
The script makes Aztec Code PNG picture out of a string that is passed as a parameter.

Possible options:
-h or --help to view this message
-p or --paste to make the code from a clipboard
'''

moduledir = path.dirname(path.abspath(__file__))

# first argument is the current file, so...

# Selecting second argument to be converted as out data
# I know that it could be skipped and argc[0] should be passed
#   directly, but I like the word "data".
#if arg == "-h" or "--help" or "":
#    print(helptext)
#    exit()
# if argv[1] == "-p" or "--paste":
    # # ready do do something dirty?
    # from tkinter import Tk #yes, in the middle of the file!
    # data = Tk().clipboard_get()
# else:
data = argv[1]
aztec_code = AztecCode(data)
aztec_code.save(moduledir+'\\aztec_code.png', module_size=4)
