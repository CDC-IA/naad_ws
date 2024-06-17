import math

focal_length = 2.75 #mm
hfov = 95 #degrees
vfov = 74 #degrees
dfov = 120 #degrees

height = 1.5 #m

a = 2*(math.tan(math.radians(hfov/2)))*height
b = 2*(math.tan(math.radians(vfov/2)))*height

print("image width: " + str(a))
print("image length: " + str(b))
print("Area: " + str(a*b))