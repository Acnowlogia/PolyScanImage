# PolyScanImage

Control and data acquisition software for optical gearbox.

## DAQ devices
AlazarTech ATS9440<br />
NI PXIe-6363<br />
NI PXIe-6341<br />

## MATLAB requirement
MATLAB 2021a<br />
Data Acquisition Toolbox<br />
Symbolic Math Toolbox<br />
Parallel Computing Toolbox<br />
Image Processing Toolbox<br />

## Getting Start
1. Add PolyScanImage and its subfolders to search path of Matlab.<br />
2. Set your machine configuration in 'PolyScanImage\configData\MachineConfiguration_PSI.m'.<br />
3. Load 'configData\Configuration.mat' into matlab workspace, then replace value of 'CFG Files Directory' to full path of your 'configData' folder, and save the updated variable back to 'configData\Configuration.mat'.<br />
4. Type 'polyscanimage' into Matlab command window, then PolyScanImage start.<br />

## Developer
This package is developed by Jianian Lin (lin1203@purdue.edu).

## License
Copyright (c) 2022 Jianian Lin

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
