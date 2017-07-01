
@echo off

PATH_VID="usr\share\presto"

del release\orix\%PATH_VID%\rabbit.vhi 
del release\orix\%PATH_VID%\rabbitc.vhi 


FOR /L %%G IN (1,4,10) DO (
%OSDK%\bin\pictconv -m0 -f0 -o2 -d2 d:\lapin\scene0000%%G.png release\%PATH_VID%\0000%%G_oric.hir
)
FOR /L %%G IN (13,4,100) DO (
%OSDK%\bin\pictconv -m0 -f0 -o2 -d2 d:\lapin\scene000%%G.png release\orix\%PATH_VID%\000%%G_oric.hir
)


FOR /L %%G IN (101,4,1000) DO (
echo %%G
%OSDK%\bin\pictconv -m0 -f0 -o2 -d2 d:\lapin\scene00%%G.png release\orix\%PATH_VID%\00%%G_oric.hir
)

FOR /L %%G IN (1001,4,7561) DO (
echo %%G
%OSDK%\bin\pictconv -m0 -f0 -o2 -d2 d:\lapin\scene0%%G.png release\orix\%PATH_VID%\0%%G_oric.hir
)

type release\orix\%PATH_VID%\0*.hir > release\orix\%PATH_VID%\presto.vhi 


echo generating video color

FOR /L %%G IN (1,4,10) DO (
%OSDK%\bin\pictconv -m0 -f6 -o2  d:\lapin\scene0000%%G.png release\orix\%PATH_VID%\0000%%G_oric.hir
)
FOR /L %%G IN (13,4,100) DO (
%OSDK%\bin\pictconv -m0 -f6 -o2  d:\lapin\scene000%%G.png release\orix\%PATH_VID%\000%%G_oric.hir
)


FOR /L %%G IN (101,4,1000) DO (
echo %%G
%OSDK%\bin\pictconv -m0 -f6 -o2  d:\lapin\scene00%%G.png release\orix\%PATH_VID%\00%%G_oric.hir
)

FOR /L %%G IN (1001,4,7561) DO (
echo %%G
%OSDK%\bin\pictconv -m0 -f6 -o2  d:\lapin\scene0%%G.png release\orix\%PATH_VID%\0%%G_oric.hir
)

type release\orix\%PATH_VID%\0*.hir > release\orix\%PATH_VID%\rabbitc.vhi 


rem FOR /L %%G IN (1,4,10) DO %OSDK%\bin\pictconv -m0 -f0 -o5 -d2 d:\lapin\scene0000%%G.png release\orix\usr\share\rabbit\scene0000%%G_oric.png
rem FOR /L %%G IN (13,4,100) DO %OSDK%\bin\pictconv -m0 -f0 -o5 -d2 d:\lapin\scene000%%G.png release\orix\usr\share\rabbit\scene000%%G_oric.png
rem FOR /L %%G IN (101,4,1000) DO %OSDK%\bin\pictconv -m0 -f0 -o5 -d2 d:\lapin\scene00%%G.png release\orix\usr\share\rabbit\scene00%%G_oric.png
rem FOR /L %%G IN (1001,4,7561) DO %OSDK%\bin\pictconv -m0 -f0 -o5 -d2 d:\lapin\scene0%%G.png release\orix\usr\share\rabbit\scene0%%G_oric.png