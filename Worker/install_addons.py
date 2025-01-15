import bpy
# Install and enable blendluxcore addon
#bpy.ops.wm.addon_install(filepath='/home/shane/Downloads/testaddon.py') #this should be done by Dockerfile unzip
bpy.ops.wm.addon_enable(module='LuxCoreRender')
# Make persistent by saving preferences
bpy.ops.wm.save_userpref()