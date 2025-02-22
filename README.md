# SAPRC Mechanism Generation System (MechGen)

The **SAPRC mechanism generation system** (**MechGen**) is a tool designed to derive explicit mechanisms for the gas-phase reactions of many types of emitted organic compounds and their oxidation products when they react in the atmosphere in the presence of oxides of nitrogen and other pollutants. It then uses the results to derive lumped mechanisms suitable for use in atmospheric models.

## Learn More

- **About MechGen**: [Visit the MechGen website](https://mechgen.cert.ucr.edu/) for more details about what MechGen can do.

- **SAPRC Mechanisms**: MechGen was used to derive the latest SAPRC-22 chemical mechanism. Learn more about SAPRC mechanisms [here](https://intra.engr.ucr.edu/~carter/SAPRC/).

## Access MechGen online
MechGen is easy to access! No installation is required for the online version, which you can use directly from your browser.

- **Web Access**:<br>[Click here to try MechGen online](https://intra.engr.ucr.edu/~carter/SAPRC/)

- **Telnet Access**:<br>Additional Telnet access is also available to this online version, please refer to the website and user manual for more information.

## Repository Contents

This repository includes the following folders and files:

```
.
├── README.md               // This file
├── LICENSE.md              // License information
|
├── docs                    // Documentation
│   ├── MechGenMan.pdf      // Complete user manual
│   └── StartGuide.pdf      // Quick-start guide for web users
|
├── src                     // Source code
│   └── MechGen.db          // Main MechGen database for Windows, Unix, or Linux
|
└── win                     // Tools for Windows
    ├── FUP.dll             // File upload plugin for WinMOO
    ├── MechGen.bat         // Batch file for running MechGen on Windows
    └── WinMOO.exe          // Windows MOO server
```

The main database file, `MechGen.db`, is required for running MechGen on your own computer (Windows, Unix, or Linux). It is not required for web users.


## Getting Started

To help you get started, refer to the following documents:

* [Getting Started with MechGen Web Access](https://github.com/SAPRC/MechGen/blob/master/docs/StartGuide.pdf)

  A quick guide to using the online version of MechGen via web interface. No installation needed.

* [Installing and Running MechGen on Unix or Linux Systems](https://github.com/SAPRC/MechGen/wiki/Install-and-Run-MechGen-on-Unix-or-Linux-Systems)

  A guide for installing and running MechGen on Unix or Linux.

* See additional resources in [MechGen Wiki Pages](https://github.com/SAPRC/MechGen/wiki). More content will be added over time.


## Citation

If you use MechGen in your research, please cite the following publication:

* Carter, W. P. L., Jiang, J., Orlando, J. J., and Barsanti, K. C.: Derivation of atmospheric reaction mechanisms for volatile organic compounds by the SAPRC mechanism generation system (MechGen), Atmos. Chem. Phys., 25, 199–242, https://doi.org/10.5194/acp-25-199-2025, 2025.


## Publications

For publication information, please visit the [Publications](https://github.com/SAPRC/MechGen/wiki/Publications) page.


## Contact Information

*For inquiries and further information, please contact the primary author, William P. L. Carter, at carter@cert.ucr.edu*
