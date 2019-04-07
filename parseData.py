# Write to CVS
import csv



# Read 3d coords from points3.txt
data = open('Results/points3D.txt', 'r').readlines()
XYZ = []
for line in data[3:]:
    parsed = line.split(" ")
    XYZ.append(parsed[1:4])

# Read camera interinsic parameters
data = open('Results/cameras.txt', 'r').readlines()
camera_id, model, width, height, f, px, py, radial = data[-1].split()
# Create Intrisnic matrix of the following form
# | f 0 px |
# | 0 f py |
# | 0 0 1  |
intrinsic = [
    [f, 0,  px],
    [0, f,  py],
    [0, 0,  1],
]

# Read image pose parameters
data = open('Results/images.txt', 'r').readlines()
Pose = []
Names = []
for lineIndex in range(4, len(data),2):
    line = data[lineIndex]
    image_id, qw, qx, qy, qz, tx, ty, tz, camera_id, name = line.split()
    Pose.append([qw,qx,qy,qz,tx,ty,tz])
    Names.append(name)
    Names.append('\n')

# Write 3d coords to XYZ.csv
with open("Results/XYZ.csv","w+") as my_csv:
    csvWriter = csv.writer(my_csv,delimiter=',')
    csvWriter.writerows(XYZ)

# Write Intrinsic matrix to CameraIntrinsic.csv
with open("Results/CameraIntrinsic.csv","w+") as my_csv:
    csvWriter = csv.writer(my_csv,delimiter=',')
    csvWriter.writerows(intrinsic)

# Write Pose to Pose.csv
with open("Results/Pose.csv","w+") as my_csv:
    csvWriter = csv.writer(my_csv,delimiter=',')
    csvWriter.writerows(Pose)

# Write Image Names to Names.csv
with open("Results/Names.txt","w+") as my_file:
    my_file.writelines(Names)
