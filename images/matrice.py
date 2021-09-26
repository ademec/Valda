import cv2
import numpy
import glob
import os
import math

dir = "VSG-ENC" # current directory
ext = ".jpg" # whatever extension you want

pathname = os.path.join(dir, "*" + ext)
print (pathname)
list_of_files = sorted( filter( os.path.isfile,
                        glob.glob(dir + '/*.jpg' ) ) )
print (list_of_files )
#files =  os.listdir(dir)
#files =  sorted(files)

images = [cv2.imread(img) for img in (list_of_files)]
totimgs = len(images)
print ('...reading images: ',totimgs)

# sizing the output image
#height = sum(image.shape[0] for image in images)
module = min(image.shape[1] for image in images)
print (module)
print (' ** module: ',module)
rows = int(1.18 * math.ceil(math.sqrt(totimgs)))
print (' ** rows: ',rows)
lines = int(math.ceil(totimgs/rows))
print (' ** lines: ',lines)
nimages = rows*lines
print (' -> images: ',nimages)
output = numpy.zeros((lines*module,rows*module,3))

x = 0
y = 0
r = 1
n = 1

for image in images:
    #h,w,d = image.shape
    if n>nimages:
        break
    #print (" image: ",n)
    image = cv2.resize(image, (module, module))
    output[y:y+module,x:x+module] = image
    x += module
    r += 1
    n += 1
    if (r > rows):
        print ('new row ')
        r=1
        x=0
        y+=module

print (' ** images used: ',n-1)
print ('             on: ',totimgs)
cv2.imwrite("visages.jpg", output)
