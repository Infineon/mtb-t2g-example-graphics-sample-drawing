@echo off
echo Converting a PNG to an compressed format with object partitioning enabled with autodetected partition width and RLA compression

resourcegenerator.exe ..\..\..\..\04_sample\basic_graphics\picture_frame_sw\img\flower.png -p -cRLA -oflower_OPauto_RLA.h

echo Converting a PNG to an compressed format with object partitioning enabled with 5 pixel columns and RLAD compression

resourcegenerator.exe ..\..\..\..\04_sample\basic_graphics\picture_frame_sw\img\flower.png -p -cRLAD -oflower_OPp5_RLAD.h

