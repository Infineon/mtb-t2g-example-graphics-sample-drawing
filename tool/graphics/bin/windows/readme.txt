1. ResourceGenerator 3.00
   =================

The ResourceGenerator is an image conversion command line tool that can read a png file and convert it into a uint8 data array. 
The utSurfLoadBitmap utility function is used in many sample application and test cases to create a surface object from such data arrays. 

Please note: The ResourceGenerator tool is provided as is. It is not officially supported. 

Usage:
The Usage of ResourceGenerator with different options available is explained in details as follows.
The basic syntax for the usage of the ResourceGenerator is given below
ResourceGenerator.exe <srcFilename.png> [srcFilename2.png srcFilename3.png ...] [options ...]

• RLE Compress:
 Option '-c'
This option is used to perform 'Run length Encoded' compression. It is a lossless image compression type
supported by VIDEOSS. 
Example:
 >ResourceGenerator.exe images\cypress.png -ncypress -ores\cypress_RLE.h -foA8 -c

• RLA Compress:
 Option '-cRLA'
This option is used to perform 'Run Length Adaptive' compression. It is a lossless image compression type
supported by VIDEOSS. 
Example:
 >ResourceGenerator.exe images\cypress.png -ncypress -ores\cypress_RLA.h -foA8 -cRLA
 
• RLAD Compress:
 Option '-cRLAD'
This option is used to perform 'Run Length Adaptive Dithering' compression. It is a lossless image compression type
supported by VIDEOSS.
Example:
 >ResourceGenerator.exe images\cypress.png -ncypress -ores\cypress_RLAD.h -foA8 -cRLAD

• RLAD Compress with defined bpp:
 Option '-cRLAD<rgba>'
This option is used to perform 'Run Length Adaptive Dithering' compression with defined maximum average bit per pixel
for the channels red, green, blue and alpha. It is a lossless image compression type supported by VIDEOSS.
Example:
 >ResourceGenerator.exe images\castle_p256.png -ncastle -ores\castle_RLAD1110.h -cRLAD1110

• Output file or folder name:
  Option '-o<file>'
This option is used to specify the file name of one output file or folder name for multiple output files.
Example:
 >ResourceGenerator.exe images\arrow.png -narrow -ores\arrow.h

• Binary file name:
 Option '-b<file>'
This option is used to specify the name of the output binary file. 
 
• Binary file name in binary append mode:
 Option '-a<file>'
This option is used to specify the name of the output file in binary append mode.
 
• Variable name:
 Option '-n'
This option is used to specify the name of the variable in the code pointing to the image description.
You can use this option if you want to have a different name for the variable in the code pointing to
the image descrption. If '-n' option is not used the name of the output file is given to the variable as well.
Example:
 >ResourceGenerator.exe c:\logo.png -of:\logo.h -nCYPRESS_LOGO
the above command will create a output file name 'logo.h' whereas the variable in the code pointing
to the image description is named as 'CYPRESS_LOGO'
 
• Shrink the source:
 Option '-s'
This option is used to shrink the source, In other words, it removes black borders if anything exists.
Example:
 >ResourceGenerator.exe
%RES% images\cypress.png -ncypress -ores\cypress_shrink.h -foA8 -s 
 
• Input format:
 Option '-fi<format>'
This option is used to specify the Input format. R8G8B8A8 is default the input format.
The -fi parameter allows to change the "interpretation" of the 32 bit RGBA pixel data.  
e.g.-fiA8X8X8X8 converts a gray in alpha value.
For instance -fiA8X8X8X8 defines that only the first 8 Bit (red channel) from each pixel will be read as 8 bit alpha.
The other 24 bits (x8x8x8) are unused.
 
• Output format:
 Option '-fo<format>'
This option is used to specify Output format of the image (e.g. -foR4G4B4A4)
The default output format is R8G8B8A8. When no output format is specified, it takes the default one.
Example:
>ResourceGenerator.exe c:\logo.png -of:\logo.h -foR3G3B2
This option creates the output bitmap file of R3G3Be format.
 
• Shared index palette:
 Option '-m'
This option is used to abstract shared index palette from multiple images.
When multiple source image (like srcFilename.png srcFilename2.png srcFilename3.png ...) are provided, it generates
abtract shared index palette as well as separate palette data for each and every input file. When '-t' is not used 
to specify the name of the shared index palette, it takes the name from the last input source image.
Example:
>ResourceGenerator.exe c:\Chat.png c:\Phone.png c:\Music.png c:\Play.png -m -of:\  
The above mentioned command will generate 5 bitmap files in total, among them four are palette data and one shared index palette data.
It is necessary to specify the relative path of the image files for this command eventhough they reside in the same folder as exe file.
The files name are Chat.h, Phone.h, Music.h, Play.h and Play_Palette.h. 
The difference in using the option '-t' is explained in the next section.

Note: 
In case if you have four input images for this option, in which one of the image is a color palette and 
remaining three images are generated using the colors available in the palette image. To use '-m' option
on all the four images to generate shared palette, the color palette image must be passed as the first
image for the '-m' option for proper functioning. 

• Index palette file name:
 Option '-t<file>'
File name of output index palette file. 
This option is used to give a name to the genrated index palette data which is generated by the option '-m'
Example:  
>ResourceGenerator.exe c:\Chat.png c:\Phone.png c:\Music.png c:\Play.png -m -of:\ -t%PATH_DST_IMG%\Menu_palette.h 
The above mentioned command will generate 5 bitmap files in total, among them four are palette data and one shared index palette data.
The files name are Chat.h, Phone.h, Music.h, Play.h and Menu_palette.h. This is the usage of the option '-t'

• Smallest Indexed color format:
 Option '-fa'
This option is used to find a minimal index palette from the given image. It is able to generate images with indexed color palettes.
The -fa parameter checks the used image colors and tries to find a small format. For instance if no green values 
are in the pixel data it will remove the green channel. The tool will automatically dimension the indexed palette size 
based on the number of unique colors that are found in the image. The palette size will be the smallest power-of-2 number
that is greater or equal to the number of unique colors found in the image and that still meets the format specifications. 
(For 3 colors the palette size will be  4 (2bpp), for 17 colors the palette size will be 32bpp, for 8 colors the palette size will be 16 (4bpp)).
The alpha channel, if present and if possible it will be used in the palette otherwise it will be stored next to the palette.
It is necessary to specify the name of the output indexed
palette data file for successful operation. 
Example:  
>ResourceGenerator.exe c:\Phone.png -of:\Phone_Palette.h -fa
The '-fa' option creates a smallest index palette data which includes both the palette data as well as the index data.
The created indexed palette data file is named as Phone_Palette.h
 
• Depart index palette:
 Option '-d'
This option is used to depart indexed colors output into two files: index data and palette data. 
It is necessary to specify the name of the palette and index data file for successful operation.
Example:  
>ResourceGenerator.exe c:\Phone.png -of:\Phone_pal -fa -d -tf:\Menu_pal.h
The '-fa' option creates a smallest index palette data which includes both the palette data as well as the index data.
and the '-d' option which is followed by, departs them into two files. The palette data is named as Phone_pal.h and
the index data is named as Menu_pal.h. 
 
• Enable object partitioning:
 Option '-p[x]'
This option is used to enable object partitioning only for images with compression and Traveo II line mode. 
it pack the data in x column.Use -p for auto detection of the column count (recommended). 
For example, use '-p4' to force 4 column.
Example:  
>ResourceGenerator.exe images\castle_p256.png -ores\castle_RLE_OP3.h -c -p3
The above command created three partion on the input image which is compressed using RLE technique.

• Resize:
 Option '-r<l,r,t,b>'
 This option is used to resize the given input image according to the specified parameters (left, right,top, bottom).
Example:
When the input image has 'width * height' as '400 * 100' pixel and if it required to resize to '300 * 50' pixels,
the option should be given with the parameters as specified below.
>ResourceGenerator.exe images\test.png -ntest -ores/test_resize_color.h -r100,400,50,100 -foR8G8B8
If the 'right' parameter is less than 'left' parameter or the 'bottom' parameter is less than 'top' parameter,
the command returns a error message.

• Define Include files:
 Option '-i<filename>'
This option is used to specify the name of the header (include) file created by the Resource Generator.
The default include name used is flash_resource.h.

• Pre-multiply alpha:
 Option '-z'
This option created alpha pre-multiplied resource header files. For those pixels with alpha = 0, this option makes the 
colors values pixel also 0. This option is requiered to support colored luminance images (image contains RGB and optional alpha).

General Examples:
    >ResourceGenerator.exe c:\logo.png -of:\logo.h -nLOGO                   <- Image will be stored as 32bit RGBA buffer
    >ResourceGenerator.exe c:\logo.png -of:\logo.h -nLOGO -foRGB8 -c        <- Compressed 8 bpp gray image 
    >ResourceGenerator.exe c:\logo.png -of:\logo.h -nLOGO -fiR8X8X8X8 -foA8 <- 8 bit alpha image (the red channel is used as alpha)
    >ResourceGenerator.exe c:\logo.png -of:\logo.h -nLOGO -fa -c            <- auto optimization (it may result in indexed images) 
                                                                               with compression

Note:
The Resource Generator source code is available in 03_build folder.
Release 3.00
(a) RLA compression is better (bitmap needs fewer memory) than Release 2.12 in some cases.
(b) A new option to pre-multiply alpha is included in this version. This option is used in Safety display driver.

Release 2.12
(a) In this release, the endianness of color format is modified to be consistent with the driver definition. In older version, 
color format R8G8B8A8 means the red channel is on lower bits and the alpha channel is on higher bits. In the driver, 
color format R8G8B8A8 means the red channel is on higher bits and the alpha channel is on lower bits. In the new version, the
resource generator is modified to have same color format definition as the driver. This change will have following impacts on 
your existing application.
(i) the old existing command which is using the input format "-fi" option has to be reversed to have the correct output.
For Example:
In older version: >ResourceGenerator.exe c:\logo.png -of:\logo.h -fiR8G8B8A8 -foR3G3B2
In new version:   >ResourceGenerator.exe c:\logo.png -of:\logo.h -fiA8B8G8R8 -foR3G3B2

(ii) the bitmap file generated by "-fo" option will be different, if you want to maintain the bitmap
file same as before you can reverse the "-fo" option.
For Example:
In older version: >ResourceGenerator.exe c:\logo.png -of:\logo.h -foR3G3B2
In new version:   >ResourceGenerator.exe c:\logo.png -of:\logo.h -foB2G3R3 

(b)The Resource Generator is an internal tool developed for generating header files that can be used for testing Graphics Driver.
Customers can use Resource Generator to generate their own header files but it is the responsibility of customers to validate 
the generated data if they want to use them in their application. There is no Warranty or guarantee that the Resource Generator will
work as expected in customers application.



Bin2Text converts a binary file to a text file with C/C++ code, describing the binary content as char array.


Attention:
The include guard, that is included to the resulting header file, gets the name of the resource (e.g. name of an image, name of a font).
It does NOT get the name of the header file!
Please keep this in mind, if you create multiple header files for the same resource (e.g. with varying compression format or with varying color formats)!

