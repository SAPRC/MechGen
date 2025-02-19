if exist MechGen.db copy /Y MechGen.db MechGen.old
if exist MechGen.new copy /Y MechGen.new MechGen.db
SET TZ=PST8PDT
winmoo -p fup.dll -l MechGen.log -o MechGen.db MechGen.new 7777
echo new core in MechGen.new
