#!/usr/bin/python

import os
import sys

baseDir = ''

def main():
    global baseDir
    baseDir = sys.argv[1]
    contents = getDirContents(baseDir)
    processFolders(contents)
    print 'Finished'

def getDirContents(path):
    if os.path.isdir(path):
        return os.listdir(path)

def zipFolder(folder, fileName):
    global baseDir
    o = '%s/%s' % (baseDir, fileName)
    print o
    os.system("7za a -mx9 %s.7z %s" % (o, folder))

def processFolders(content):
    global baseDir
    for i in content:
        fp = "%s/%s" % (baseDir, i)
        if os.path.isdir(fp):
            print "Zipping %s" % fp
            zipFolder(fp, i)

if __name__ == '__main__':main();
