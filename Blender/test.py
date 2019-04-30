import bpy
import os
import subprocess
import time

#
#
#   RUN like this:
#   blender vge.blend --python test.py
#
#
#
#
#

def export(obj, file_path):
    bpy.ops.export_scene.obj(filepath=file_path)

#Zmeri hausdorffskou vzdalenost dvou obj a zamipis do csv
def countwrite(path, time, name, metod, r, p):
    output = subprocess.check_output("bash hausdorff.sh " + simpleModels[name] + " " + name + ".out.obj", shell=True)
    output = output.decode("utf-8")
    output = output[:-1]
    record = name + ";Blender;;" + r + ";" + metod + ";" + p + ";" + time + ";" + output + ";"
    rpcFile = open('out.csv', 'a+')
    rpcFile.write(record + "\n")
    rpcFile.close()

#### Funkce pro nacteni obj, aplikovani modifieru, zapis a uklizeni
def laplacian(path, name, r, p):
    start = time.time()
    object = bpy.ops.import_scene.obj(filepath=path, axis_forward='-Z', axis_up='Y', filter_glob="*.obj")
    object = bpy.context.selected_objects[0]
    object.select = True
    modifier = object.modifiers.new(name="LAPLACIANSMOOTH", type='LAPLACIANSMOOTH')
    modifier.iterations = p
    modifier.lambda_factor = 0.1
    export(object, name + ".out.obj")
    end = time.time()
    t = end - start
    countwrite(path, str(t), name, "Laplacian", r, str(p))
    bpy.ops.object.delete()


def smooth(path, name, r, p):
    start = time.time()
    object = bpy.ops.import_scene.obj(filepath=path, axis_forward='-Z', axis_up='Y', filter_glob="*.obj")
    object = bpy.context.selected_objects[0]
    object.select = True
    modifier = object.modifiers.new(name="Smooth", type='SMOOTH')
    modifier.iterations = p
    modifier.factor = 0.25
    export(object, name + ".out.obj")
    end = time.time()
    t = end - start
    countwrite(path, str(t), name, "smooth", r, str(p))
    bpy.ops.object.delete()


def decimatecollapse(path, name, r, p, symetry):
    start = time.time()
    object = bpy.ops.import_scene.obj(filepath=path, axis_forward='-Z', axis_up='Y', filter_glob="*.obj")
    object = bpy.context.selected_objects[0]
    object.select = True
    modifier = object.modifiers.new(name="decimate", type='DECIMATE')
    modifier.decimate_type = 'COLLAPSE'
    modifier.ratio = r
    modifier.use_symmetry = symetry
    export(object, name + ".out.obj")
    end = time.time()
    t = end - start
    if symetry:
        countwrite(path, str(t), name, "Edge collapse with symetry", str(r), str(p))
    else:
        countwrite(path, str(t), name, "Edge collapse without symetry", str(r), str(p))

    bpy.ops.object.delete()


def deciamteplanar(path, name, r, p):
    start = time.time()
    object = bpy.ops.import_scene.obj(filepath=path, axis_forward='-Z', axis_up='Y', filter_glob="*.obj")
    object = bpy.context.selected_objects[0]
    object.select = True
    modifier = object.modifiers.new(name="decimate", type='DECIMATE')
    modifier.decimate_type = 'DISSOLVE'
    modifier.angle_limit = r
    export(object, name + ".out.obj")
    end = time.time()
    t = end - start
    countwrite(path, str(t), name, "Planar Polygons", str(r), str(p))
    bpy.ops.object.delete()


smoothModels = {
    "bunny": [
        ("data/bunny/bunny.rand.displacement.1proc.obj", "1"),
        ("data/bunny/bunny.rand.displacement.2.5proc.obj", "2.5"),
        ("data/bunny/bunny.rand.displacement.5proc.obj", "5")
    ],
    "diamond": [
        ("data/diamond/diamond.rand.displacement.1proc.obj", "1"),
        ("data/diamond/diamond.rand.displacement.2.5proc.obj", "2.5"),
        ("data/diamond/diamond.rand.displacement.5proc.obj", "5")
    ],
    "pig": [
        ("data/pig/pig.rand.displacement.1proc.obj", "1"),
        ("data/pig/pig.rand.displacement.2.5proc.obj", "2.5"),
        ("data/pig/pig.rand.displacement.5proc.obj", "5")
    ],
    "skull": [
        ("data/skull/skull.rand.displacement.1proc.obj", "1"),
        ("data/skull/skull.rand.displacement.2.5proc.obj", "2.5"),
        ("data/skull/skull.rand.displacement.5proc.obj", "5")
    ],
    "sphere": [
        ("data/sphere/sphere.rand.displacement.1proc.obj", "1"),
        ("data/sphere/sphere.rand.displacement.2.5proc.obj", "2.5"),
        ("data/sphere/sphere.rand.displacement.5proc.obj", "5")
    ],
    "sword": [
        ("data/sword/sword.rand.displacement.1proc.obj", "1"),
        ("data/sword/sword.rand.displacement.2.5proc.obj", "2.5"),
        ("data/sword/sword.rand.displacement.5proc.obj", "5")
    ],
 #   "venus": [
  #      ("data/venus/venus.rand.displacement.1proc.obj", "1"),
   #     ("data/venus/venus.rand.displacement.2.5proc.obj", "2.5"),
    #    ("data/venus/venus.rand.displacement.5proc.obj", "5")
   # ],
}
simpleModels = {
    "bunny": "data/bunny/bunny.obj",
    "diamond":"data/diamond/diamond.obj",
    "pig":"data/pig/pig.obj",
    "skull": "data/skull/skull.obj",
    "sphere":"data/sphere/sphere.obj",
    "sword":"data/sword/sword.obj",
    #"venus":"data/venus/venus.obj",
}
# Iterate through all selected objects
for name, values in smoothModels.items():
    for path, r in values:
        print("SMOOTH NAME: "+path)
        laplacian(path, name, r, 1)
        laplacian(path, name, r, 10)
        laplacian(path, name, r, 25)

        smooth(path, name, r, 1)
        smooth(path, name, r, 10)
        smooth(path, name, r, 25)
        print("END NAME: "+path)

for name, value in simpleModels.items():
    print("SIM NAME: "+name)
    deciamteplanar(value, name, 13, "")
    deciamteplanar(value, name, 26, "")
    deciamteplanar(value, name, 39, "")

    decimatecollapse(value, name, 0.25, "", False)
    decimatecollapse(value, name, 0.5, "", False)
    decimatecollapse(value, name, 0.75, "", False)

    decimatecollapse(value, name, 0.25, "", True)
    decimatecollapse(value, name, 0.5, "", True)
    decimatecollapse(value, name, 0.75, "", True)
    print("END NAME: "+name)
