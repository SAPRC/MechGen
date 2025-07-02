# **SAPRC Box Model**
The SAPRC model simulation software system consists primarily of a series of interrelated
Fortran programs and files that were developed over almost a 40-year period for chemical mechanism
development, evaluation, and box modeling applications research.

The mechanism output derived from **MechGen** can be directly implemented into the SAPRC box model and run with the corresponding version of the SAPRC-based mechanism for a quick setup.  For detailed instructions, please refer to **ModelPgm.pdf**. If you have any questions about configuring the model, contact Dr. Bill Carter (carter@cert.ucr.edu) or Dr. Jia Jiang (jiajiang@mit.edu).


# **Model File Distribution**

This distribution contains files documenting and implementing the most recent versions of the SAPRC gas-phase atmospheric chemical mechanisms and the files and programs necessary simulate the environmental chamber experiments used to evaluate the detailed mechanism, and to run the test calculations used to develop and evaluate versions of SAPRC and other mechanisms.

The current distribution implements the following version of the SAPRC mechanisms: **SAPRC-99**, **SAPRC-07**, **CSAPRC-07**, **SAPRC-11**, **SAPRC-18**, and **SAPRC-22**, the latest version of these mechanisms. Documentation and files for the previous versions, including MIR and other ozone reactivity scale data, is available at the SAPRC mechanism web site.

If you download this software and documentation and find them potentially useful, and want to be on an email list about updates or corrections to the programs, files, or documentation, please contact me and I will add you to the list.


# **File and Program Documentation**

**ModelPgm.pdf** contains draft documentation of the use of the SAPRC modeling software for basic model simulations. This gives details of the programs, their inputs and outputs, file formats, and examples of their use. The current version is a major update of the previous version that was dated 2017, and now includes a more complete discussion of the lumping program and now discusses the programs and files for calculation of reactivity scales. However, this document is still a draft that is not completely proofread and is subject to change. Please contact me if you see errors, undocumented behavior, or unclear or erroneous text. The current version is dated October 7, 2020.

**SAPRCsys.pdf** is a presentation made to the CARB staff in November, 2017, that gives an overview of the SAPRC mechanism development systems and programs as of that date. Although not comprehensive and includes discussion not directly relevant to this software, and may be an easier place to start than ModelPgm.pdf, which gives more complete documentation. This was uploaded on April 15, 2020.

**Programs and files.** See ModelPgm.pdf for more details. These files were updated on May 15, 2023 unless indicated otherwise.

**MECH.ZIP** contains the files implementing the various versions of the SAPRC mechanisms listed above. It now contains the current version of SAPRC-22, which was updated on June 23, 2024.

**PGMS.ZIP** contains the SAPRC modeling programs needed to run the environmental chamber simulations and the test calculations. These programs can be compiled using the public domain gfortran compiler. Templates for Excel spreadsheets with macros that can be used to summarize and plot data from the experiments and calculations are also included.

**TESTCALC.ZIP** contains the files needed to run various test calculations using the mechanisms, including the static and multi-day dynamic test calculations used in the development of CSAPRC-07, the condensed version of SAPRC-07.

**CHAMCALC.ZIP** contains the files necessary to use the distributed mechanisms and software to evaluate the mechanisms against the chamber data. Because of the large number of chamber experiments now available, this archive only contains input and experimental results data for only a small subset of representative experiments for testing the programs. Files for the complete set of experiments are contained in a separate archive discussed below.

**CHAMEXPT.ZIP** contains the input files and experimental results files for the chamber experiments used when evaluating various versions of the SAPRC mechanisms (except for CSAPRC-07, which is derived directly from SAPRC-07). The archive now contains a total of 2915 chamber experiments, including new experiments from the UCR and CSIRO chambers used for the SAPRC-11 mechanism evaluations, but excluding UNC chamber experiments. (UNC chamber experiments have been removed from our distribution of files because our UNC input files may not represent the best inputs for these experiments.) The experiments are listed and summarized in the file CHAMEXPT.XLS, which is included in both CHAMCALC.ZIP and CHAMEXPT.ZIP. This archive was last updated June 27, 2017.

**REACT.ZIP** contains the files necessary to do reactivity scale calculations using the SAPRC-07 mechanism, including the MIR, MOIR, EBIR, base case, and averaged conditions scales. This is the latest version of SAPRC for which complete reactivity scales are available. Reactivity calculation files for updated versions are not yet available.

**UNZIP.EXE** is a freeware unzip program by Info-Zip (http://www.info-zip.org/) that can be used to extract the .ZIP files if the user does not already have such a program.

**MINGF.ZIP** contains the minimum set of dynamic link library (.DLL) files needed so that the compiled programs in the distribution will run without GNU MinGW gfortran being installed. Note that these are not sufficient to compile new or modified mechanisms or change any of the programs, and they should be deleted if other compilers or new versions of gfortran are used. It is recommended that the user install GNU MinGW gfortran as described in ModelPgm.pdf rather than using these files. These files are dated 12/1/2011 and should not be used with programs compiled with different versions. DO NOT INSTALL THESE FILES IF YOU HAVE, OR PLAN TO HAVE, MINGW AND GFORTRAN INSTALLED!


# **Recent Update History**

**4/7/23, 5/15/23, 7/1/23, 7/8/23, 7/13/23, 9/9/23, 6/23/24**
- Updated SAPRC-22 to the current version. Versions dated before September 9 should not be used. This version should be final, but we are still in the process of documenting the chemistry used to generate the mechanism, and it can't be ruled out that additional errors may be found during this process. Therefore, please check the SAPRC-22 page before using the mechanism or implementing it in any models in case the version you downloaded had to be updated.

**3/9/23**
- Added files to run simulations for the current version of SAPRC-22, which has not yet been finalized. These are superseded with files uploaded on 4/7/23.

**10/7/20**
- Completed the first complete draft of the documentation in ModelPgm.pdf. This now discusses files and programs for reactivity calculation, and has a more complete discussion of the lumping programs.
- Some minor program fixes made that were found during the documentation process. All files except for those in CHAMEXPT.ZIP have been updated.

**6/3/20**
- Some programs and files used for reactivity calculations were updated. All zip files were updated except for CHAMEXPT.ZIP and MINGW.ZIP. Most changes concerned updating some files for calculating SAPRC-07 MIR and other reactivity scales so that the SAPRC-18 mechanism generation system can be used to add reactivity estimates for appropriate compounds. Please contact me if you are interested in more information about this.

**4/18/20**
- An updated version of the new SAPRC-18 mechanism was uploaded. This will be the final version unless errors are found.
- Other minor file and page updates.

**4/15/20**
- A slightly updated version of the modeling program documentation, with minor formatting corrections, was uploaded.
- A PowerPoint presentation giving an overview of the SAPRC modeling system and software was uploaded. It was not available here previously.

**12/9/18**
- Web page updated to include SAPRC-18 and the discussions of the other mechanisms were also updated.

**11/18/19**
- Downloadable ZIP files updated to include SAPRC-18 and latest versions of all the distributed programs and files.

**1/26/15**
- Draft documentation describing the model simulation programs. This version discusses using the program for basic simulations only. A discussion of use of adjustable parameter mechanisms, special programs and inputs for incremental reactivity calculations, or special time-varying or emissions input for ambient simulations is not covered in this version.
- The INTRUN program was changed so use of LUMPGEN for processing for fixed-parameter mechanisms as discussed in ModelPgm.pdf is now the default.

**1/22/13**
- Files for SAPRC aromatic mechanism are revised to reflect the version published in Atmospheric Environment (Carter and Heo, 2013).

**6/25/12**
- Files for the SAPRC-11 aromatic mechanism are now included.
- Data for new chamber experiments used for SAPRC-11 and PM-SAPRC-11 mechanism evaluation have been added. Data are now available for most UCR chamber experiments used for mechanism evaluation through May, 2011.
- Fortran programs revised so all are now compatible with public-domain GNU Fortran (gfortran). The method for organizing and saving model simulation results has also been improved.
