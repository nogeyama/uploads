#!/usr/bin/python
#!/usr/bin/python

# coding: UTF-8

import sys
argvs = sys.argv
argc = len(argvs)
if (argc != 1+1):
    quit() 

s = argvs[1]
print s[4:8] + "/" + s[8:10] + "/" + s

