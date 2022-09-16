f = open("test.txt", "a")
f.write("Now the file has more content!\n")
f.close()

#open and read the file after the appending:
f = open("test.txt", "r")
print(f.read()) 
