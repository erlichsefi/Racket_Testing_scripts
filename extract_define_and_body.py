import sys
def findfunction(filename,functionname):
    print("file= "+str(filename))
    print("function name= "+str(functionname))

    lines=[]
    with open(filename) as f:
        for line in f:
            lines.append(line)

    de=[]
    defopen=False
    body=[]
    openPaent=0
    for l in lines:
        if (not(defopen) and  (" "+functionname+" " in l) and  ("(:" in l)):
            defopen=True
            de.append(l)
        elif defopen:
            de.append(l)
        if (")" in l and defopen):
            defopen=False

        if ( functionname+" " in l and  "define" in l):
            body.append(l)
            openPaent=openPaent+len(l.split("("))-1-len(l.split(")"))+1
        elif (openPaent>0):
            body.append(l)
            openPaent=openPaent+len(l.split("("))-1-len(l.split(")"))+1

    print("define:")
    for d in de:
        print(d)
    print("body:")
    for b in body:
        print(b)

findfunction(sys.argv[1],sys.argv[2])
