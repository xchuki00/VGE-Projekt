@echo off

call echo object name: %1. >> results.txt
call echo object name: %1. >> times.txt

REM vertex displacement
call time.bat meshlabserver -i %1.obj -o %1.rand.displacement.1proc.obj -m vc fq wt -s rvd1.mlx
call time.bat meshlabserver -i %1.obj -o %1.rand.displacement.2.5proc.obj -m vc fq wt -s rvd2.5.mlx
call time.bat meshlabserver -i %1.obj -o %1.rand.displacement.5proc.obj -m vc fq wt -s rvd5.mlx

call echo Vxt Displacement >> results.txt

call echo rvd 1proc vertex displacement >> results.txt
(call meshlabserver -i %1.obj -i %1.rand.displacement.1proc.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 2.5proc vertex displacement >> hausdorff.txt
(call meshlabserver -i %1.obj -i %1.rand.displacement.2.5proc.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 5proc vertex displacement >> hausdorff.txt
(call meshlabserver -i %1.obj -i %1.rand.displacement.5proc.obj -s hausdorff.mlx | findstr mean >> results.txt)

REM smoothing

call smoothing.bat %1

REM simplification

call simplification.bat %1