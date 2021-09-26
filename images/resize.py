import cv2
import numpy
import glob
import os
import argparse
from imutils import paths


output = "OUT" # current directory
ext = ".jpg" # whatever extension you want

output_dir = os.path.realpath(output)
if not os.path.isdir(output_dir):
	print ("Output directory %s does not exist" % output)
else:
	print ("Output will be saved to %s" % output_dir)

ap = argparse.ArgumentParser()
ap.add_argument("-in", "-dir", required=True,
	help="path to input folder")
args = vars(ap.parse_args())

print (' reading: ',args["in"])

#pathname = os.path.join(args["in"], "*" + ext)
#images = [cv2.imread(img) for img in glob.glob(pathname)]
#width = min(image.shape[1] for image in images)
minwidth = 80 # min width under which images are excluded
width = 150 # target width

print (' ---> output size:',width)
print (' ---> min size:',minwidth)
filePaths = list(paths.list_images(args["in"]))
#filePaths = [img.replace("\\", "") for img in filePaths]

for i in filePaths:
    print (" resizing %s",  i)
    img = cv2.imread(i, cv2.IMREAD_UNCHANGED)
    print ('    original dimensions: ',img.shape)
    orgwidth = img.shape[1]
    if orgwidth < minwidth:
        print ('       too small!')
        continue
    if orgwidth > width:
        print ('       large enough!')
        continue
    dim = (width, width) # square
    resized = cv2.resize(img, dim, interpolation = cv2.INTER_AREA)
    print ('    resized dimensions: ',resized.shape)
    if orgwidth < width:
        print ('    bluring small resized images... ')
        resized = cv2.blur(resized,(3,3))
    #cv2.imshow("Resized image", resized)
    filename = os.path.splitext(os.path.basename(i))[0]
    outPath = os.path.join(output_dir, "%s.jpg" % filename)
    cv2.imwrite(outPath, resized)

#cv2.imwrite("test.jpg", output)
