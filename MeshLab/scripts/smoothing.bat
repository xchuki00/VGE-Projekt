
call echo Smoothing >> results.txt

REM laplacian
call time.bat meshlabserver -i %1.rand.displacement.1proc.obj -o %1.1proc.smooth.laplacian.1it.obj -m vc fq wt -s smooth.laplacian.1it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.1proc.obj -o %1.1proc.smooth.laplacian.10it.obj -m vc fq wt -s smooth.laplacian.10it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.1proc.obj -o %1.1proc.smooth.laplacian.25it.obj -m vc fq wt -s smooth.laplacian.25it.mlx 

call echo rvd 1proc Taubin 1 it >> results.txt
(call meshlabserver -i %1.obj -i %1.1proc.smooth.laplacian.1it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 1proc Taubin 10 it >> results.txt
(call meshlabserver -i %1.obj -i %1.1proc.smooth.laplacian.10it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 1proc Taubin 25 it >> results.txt
(call meshlabserver -i %1.obj -i %1.1proc.smooth.laplacian.25it.obj -s hausdorff.mlx | findstr mean >> results.txt)

call time.bat meshlabserver -i %1.rand.displacement.2.5proc.obj -o %1.2.5proc.smooth.laplacian.1it.obj -m vc fq wt -s smooth.laplacian.1it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.2.5proc.obj -o %1.2.5proc.smooth.laplacian.10it.obj -m vc fq wt -s smooth.laplacian.10it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.2.5proc.obj -o %1.2.5proc.smooth.laplacian.25it.obj -m vc fq wt -s smooth.laplacian.25it.mlx 

call echo rvd 2.5proc Taubin 1 it >> results.txt
(call meshlabserver -i %1.obj -i %1.2.5proc.smooth.laplacian.1it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 2.5proc Taubin 10 it >> results.txt
(call meshlabserver -i %1.obj -i %1.2.5proc.smooth.laplacian.10it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 2.5proc Taubin 25 it >> results.txt
(call meshlabserver -i %1.obj -i %1.2.5proc.smooth.laplacian.25it.obj -s hausdorff.mlx | findstr mean >> results.txt)

call time.bat meshlabserver -i %1.rand.displacement.5proc.obj -o %1.5proc.smooth.laplacian.1it.obj -m vc fq wt -s smooth.laplacian.1it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.5proc.obj -o %1.5proc.smooth.laplacian.10it.obj -m vc fq wt -s smooth.laplacian.10it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.5proc.obj -o %1.5proc.smooth.laplacian.25it.obj -m vc fq wt -s smooth.laplacian.25it.mlx 

call echo rvd 5proc Taubin 1 it >> results.txt
(call meshlabserver -i %1.obj -i %1.5proc.smooth.laplacian.1it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 5proc Taubin 10 it >> results.txt
(call meshlabserver -i %1.obj -i %1.5proc.smooth.laplacian.10it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 5proc Taubin 25 it >> results.txt
(call meshlabserver -i %1.obj -i %1.5proc.smooth.laplacian.25it.obj -s hausdorff.mlx | findstr mean >> results.txt)

REM taubin
call time.bat meshlabserver -i %1.rand.displacement.1proc.obj -o %1.1proc.smooth.taubin.1it.obj -m vc fq wt -s smooth.taubin.1it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.1proc.obj -o %1.1proc.smooth.taubin.10it.obj -m vc fq wt -s smooth.taubin.10it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.1proc.obj -o %1.1proc.smooth.taubin.25it.obj -m vc fq wt -s smooth.taubin.25it.mlx 

call echo rvd 1proc Taubin 1 it >> results.txt
(call meshlabserver -i %1.obj -i %1.1proc.smooth.taubin.1it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 1proc Taubin 10 it >> results.txt
(call meshlabserver -i %1.obj -i %1.1proc.smooth.taubin.10it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 1proc Taubin 25 it >> results.txt
(call meshlabserver -i %1.obj -i %1.1proc.smooth.taubin.25it.obj -s hausdorff.mlx | findstr mean >> results.txt)

call time.bat meshlabserver -i %1.rand.displacement.2.5proc.obj -o %1.2.5proc.smooth.taubin.1it.obj -m vc fq wt -s smooth.taubin.1it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.2.5proc.obj -o %1.2.5proc.smooth.taubin.10it.obj -m vc fq wt -s smooth.taubin.10it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.2.5proc.obj -o %1.2.5proc.smooth.taubin.25it.obj -m vc fq wt -s smooth.taubin.25it.mlx 

call echo rvd 2.5proc Taubin 1 it >> results.txt
(call meshlabserver -i %1.obj -i %1.2.5proc.smooth.taubin.1it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 2.5proc Taubin 10 it >> results.txt
(call meshlabserver -i %1.obj -i %1.2.5proc.smooth.taubin.10it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 2.5proc Taubin 25 it >> results.txt
(call meshlabserver -i %1.obj -i %1.2.5proc.smooth.taubin.25it.obj -s hausdorff.mlx | findstr mean >> results.txt)

call time.bat meshlabserver -i %1.rand.displacement.5proc.obj -o %1.5proc.smooth.taubin.1it.obj -m vc fq wt -s smooth.taubin.1it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.5proc.obj -o %1.5proc.smooth.taubin.10it.obj -m vc fq wt -s smooth.taubin.10it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.5proc.obj -o %1.5proc.smooth.taubin.25it.obj -m vc fq wt -s smooth.taubin.25it.mlx 

call echo rvd 5proc Taubin 1 it >> results.txt
(call meshlabserver -i %1.obj -i %1.5proc.smooth.taubin.1it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 5proc Taubin 10 it >> results.txt
(call meshlabserver -i %1.obj -i %1.5proc.smooth.taubin.10it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 5proc Taubin 25 it >> results.txt
(call meshlabserver -i %1.obj -i %1.5proc.smooth.taubin.25it.obj -s hausdorff.mlx | findstr mean >> results.txt)


REM twoStep
call time.bat meshlabserver -i %1.rand.displacement.1proc.obj -o %1.1proc.smooth.twostep.1it.obj -m vc fq wt -s smooth.twostep.1it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.1proc.obj -o %1.1proc.smooth.twostep.10it.obj -m vc fq wt -s smooth.twostep.10it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.1proc.obj -o %1.1proc.smooth.twostep.25it.obj -m vc fq wt -s smooth.twostep.25it.mlx 

call echo rvd 1proc TwoStep 1 it >> results.txt
(call meshlabserver -i %1.obj -i %1.1proc.smooth.twostep.1it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 1proc TwoStep 10 it >> results.txt
(call meshlabserver -i %1.obj -i %1.1proc.smooth.twostep.10it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 1proc TwoStep 25 it >> results.txt
(call meshlabserver -i %1.obj -i %1.1proc.smooth.twostep.25it.obj -s hausdorff.mlx | findstr mean >> results.txt)

call time.bat meshlabserver -i %1.rand.displacement.2.5proc.obj -o %1.2.5proc.smooth.twostep.1it.obj -m vc fq wt -s smooth.twostep.1it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.2.5proc.obj -o %1.2.5proc.smooth.twostep.10it.obj -m vc fq wt -s smooth.twostep.10it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.2.5proc.obj -o %1.2.5proc.smooth.twostep.25it.obj -m vc fq wt -s smooth.twostep.25it.mlx 

call echo rvd 2.5proc TwoStep 1 it >> results.txt
(call meshlabserver -i %1.obj -i %1.2.5proc.smooth.twostep.1it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 2.5proc TwoStep 10 it >> results.txt
(call meshlabserver -i %1.obj -i %1.2.5proc.smooth.twostep.10it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 2.5proc TwoStep 25 it >> results.txt
(call meshlabserver -i %1.obj -i %1.2.5proc.smooth.twostep.25it.obj -s hausdorff.mlx | findstr mean >> results.txt)

call time.bat meshlabserver -i %1.rand.displacement.5proc.obj -o %1.5proc.smooth.twostep.1it.obj -m vc fq wt -s smooth.twostep.1it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.5proc.obj -o %1.5proc.smooth.twostep.10it.obj -m vc fq wt -s smooth.twostep.10it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.5proc.obj -o %1.5proc.smooth.twostep.25it.obj -m vc fq wt -s smooth.twostep.25it.mlx 

call echo rvd 5proc TwoStep 1 it >> results.txt
(call meshlabserver -i %1.obj -i %1.5proc.smooth.twostep.1it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 5proc TwoStep 10 it >> results.txt
(call meshlabserver -i %1.obj -i %1.5proc.smooth.twostep.10it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 5proc TwoStep 25 it >> results.txt
(call meshlabserver -i %1.obj -i %1.5proc.smooth.twostep.25it.obj -s hausdorff.mlx | findstr mean >> results.txt)

REM Depth
call time.bat meshlabserver -i %1.rand.displacement.1proc.obj -o %1.1proc.smooth.depth.1it.obj -m vc fq wt -s smooth.depth.1it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.1proc.obj -o %1.1proc.smooth.depth.10it.obj -m vc fq wt -s smooth.depth.10it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.1proc.obj -o %1.1proc.smooth.depth.25it.obj -m vc fq wt -s smooth.depth.25it.mlx 

call echo rvd 1proc Depth 1 it >> results.txt
(call meshlabserver -i %1.obj -i %1.1proc.smooth.depth.1it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 1proc Depth 10 it >> results.txt
(call meshlabserver -i %1.obj -i %1.1proc.smooth.depth.10it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 1proc Depth 25 it >> results.txt
(call meshlabserver -i %1.obj -i %1.1proc.smooth.depth.25it.obj -s hausdorff.mlx | findstr mean >> results.txt)

call time.bat meshlabserver -i %1.rand.displacement.2.5proc.obj -o %1.2.5proc.smooth.depth.1it.obj -m vc fq wt -s smooth.depth.1it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.2.5proc.obj -o %1.2.5proc.smooth.depth.10it.obj -m vc fq wt -s smooth.depth.10it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.2.5proc.obj -o %1.2.5proc.smooth.depth.25it.obj -m vc fq wt -s smooth.depth.25it.mlx 

call echo rvd 2.5proc Depth 1 it >> results.txt
(call meshlabserver -i %1.obj -i %1.2.5proc.smooth.depth.1it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 2.5proc Depth 10 it >> results.txt
(call meshlabserver -i %1.obj -i %1.2.5proc.smooth.depth.10it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 2.5proc Depth 25 it >> results.txt
(call meshlabserver -i %1.obj -i %1.2.5proc.smooth.depth.25it.obj -s hausdorff.mlx | findstr mean >> results.txt)

call time.bat meshlabserver -i %1.rand.displacement.5proc.obj -o %1.5proc.smooth.depth.1it.obj -m vc fq wt -s smooth.depth.1it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.5proc.obj -o %1.5proc.smooth.depth.10it.obj -m vc fq wt -s smooth.depth.10it.mlx 
call time.bat meshlabserver -i %1.rand.displacement.5proc.obj -o %1.5proc.smooth.depth.25it.obj -m vc fq wt -s smooth.depth.25it.mlx 

call echo rvd 5proc Depth 1 it >> results.txt
(call meshlabserver -i %1.obj -i %1.5proc.smooth.depth.1it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 5proc Depth 10 it >> results.txt
(call meshlabserver -i %1.obj -i %1.5proc.smooth.depth.10it.obj -s hausdorff.mlx | findstr mean >> results.txt)
call echo rvd 5proc Depth 25 it >> results.txt
(call meshlabserver -i %1.obj -i %1.5proc.smooth.depth.25it.obj -s hausdorff.mlx | findstr mean >> results.txt)
