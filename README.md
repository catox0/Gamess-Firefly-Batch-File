# Gamess-Firefly-Batch-File
Gamess Firefly Batch File for sequential execution of ab initio calculations.

PCGamess.bat

- Function
  Waits until running GamessFirefly jobs are finished, then runs Firefly with the next input file, writes the output file into input_filename.out, and logs the calculation in log.txt.
  The current batch file version uses the -legacy option for compatibility with WxMacMolplt.

- Installation:
  (1) Place this batch file into your folder containing the Firefly executable. 
  (2) Open the batch file in notepad and set the _Scratch_ variable to a location for temporary files
  (3) Set the _FireflyExe_ variable to your Firefly.exe filename (there may be version numbers in your executable name)
  Optional:
  (4) Create a shortcut to the batch file and place it onto your desktop.
  (5) Download the Firefly icon for the shortcut (http://classic.chem.msu.su/gran/gamess/index.html)

-  How to use:
  Drag and drop your input files onto this batch file or the shortcut.
  Jobs will be processed in random order.
  To recover from a stopped job, run PCGamess.bat without an input file (double-click it).
