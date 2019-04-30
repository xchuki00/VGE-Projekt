@echo off

set object[0] = bunny/bunny 
set object[1] = cube/cube 
set object[2] = diamond/diamond 
set object[3] = pig/pig 
set object[4] = skull/skull 
set object[5] = sphere/sphere
set object[6] = sword/sword
set object[7] = venus/venus

for /F "tokens=2 delims==" %%n in ('set object[') do (
   call meshlab_proc.bat %%n
)

