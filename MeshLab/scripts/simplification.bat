@echo off

call echo Simplification >> results.txt

REM Marching cubes
call time.bat meshlabserver -i %1.obj -o %1.simpl.MC.obj -m vc fq wt -s simply.marching.cubes.noparams.mlx 

call echo Marching cubes >> results.txt
(call meshlabserver -i %1.obj -i %1.simpl.MC.obj -s hausdorff.mlx | findstr mean >> results.txt)

REM Clustering Decimation
call time.bat meshlabserver -i %1.obj -o %1.simpl.CD.obj -m vc fq wt -s simply.clustering.decimation.noparams.mlx 

call echo Clustering Decimation >> results.txt
(call meshlabserver -i %1.obj -i %1.simpl.CD.obj -s hausdorff.mlx | findstr mean >> results.txt)

REM QECD
call time.bat meshlabserver -i %1.obj -o %1.simpl.QECD.25proc.obj -m vc fq wt -s simply.quadric.edge.collapse.decimation.0.25.mlx 
call time.bat meshlabserver -i %1.obj -o %1.simpl.QECD.50proc.obj -m vc fq wt -s simply.quadric.edge.collapse.decimation.0.50.mlx 
call time.bat meshlabserver -i %1.obj -o %1.simpl.QECD.75proc.obj -m vc fq wt -s simply.quadric.edge.collapse.decimation.0.75.mlx 

call echo QECD 25 it >> results.txt
(call meshlabserver -i %1.obj -i %1.simpl.QECD.25proc.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo QECD 50 it >> results.txt
(call meshlabserver -i %1.obj -i %1.simpl.QECD.50proc.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo QECD 75 it >> results.txt
(call meshlabserver -i %1.obj -i %1.simpl.QECD.75proc.obj -s hausdorff.mlx | findstr mean >> results.txt)
