# Magnetometer Soft and Hard Iron magnetic compensation

MATLAB script and data plotter for calculating Hard and Soft Iron magnetic compensation parameters.

This script is intended to work with the [HMC5883L magnetometer](https://github.com/MatthewPatyk/HMC5883L-Arduino-I2C-library), however, the results from this script **can easily be adapted** to work with other magnetometers or implementations.

## Results

![Before](https://raw.githubusercontent.com/MatthewPatyk/MATLAB-Magnetometer-Hard-and-Soft-Iron-Compensation-Algorithm/master/Results/Result.png)

## Getting Started

If you just want to see the results of the algorithm, there are sample measurements in the file `myData`. Just run `main.m` script in MATLAB and change `fileName` variable to see another result.

If you want to get results for your implementation or my [HMC5883L magnetometer](https://github.com/MatthewPatyk/HMC5883L-Arduino-I2C-library) see next paragraph.

### How to generate data for calibration

---

Use my [HMC5883L example](https://github.com/MatthewPatyk/HMC5883L-Arduino-I2C-library) or make your own program to generate data in the specific manner provided in next paragraph.

### Requirements for data file and script usage

---

- data should be scaled in miliGauss [mGs] use `HMC5883L::getScaled();` from [here](https://github.com/MatthewPatyk/HMC5883L-Arduino-I2C-library) with the `HMC5883L_EXTENED_CALIB_PROCEDURE` define set to `0x01` in `HMC5883L.h` file,
- column should be separated by tabs: `"\t"`,
- data order:

```plaintext
TIME[ms]   X-AXIS     Y-AXIS      Z-AXIS
```

Example of data:

```plaintext
798       -151.84     332.88      -275.94
805       -148.19     330.69      -277.40
811       -144.54     329.96      -281.78
818       -141.62     324.12      -281.05
825       -138.70     321.93      -284.70
831       -137.24     323.39      -286.89
838       -136.51     319.01      -285.43
...
```

- file with data can be in the same folder as `main.m` file or in other, but the path should be provided in `filename` variable,
- change `myData/afterCallib1.txt` to yours in `filename` variable in `main.m` file,
- run script,
- copy output from MATLAB `command window`:

```matlab
const float magn_ellipsoid_center[3] = {2.74731, -15.5597, 5.48397};
const float magn_ellipsoid_transform[3][3] = {{0.979956, 0.00991353, 0.00841591}, {0.00991353, 0.93923, -0.00647764}, {0.00841591, -0.0064776}}
```

into `void HMC5883L::useHardAndSoftIronCompensationParameters(void)` and replace data in `ellipsoidCenter` and `ellipsoidTransMatrix` matrixes.

- set `HMC5883L_EXTENED_CALIB_PROCEDURE` define to previous value `0x00`.

## Author

- 2018, **Mateusz Patyk**, <matpatyk@gmail.com>

based on the work:

- 2013 [Peter Bartz](http://ptrbrtz.net) from [Razor AHRS](https://github.com/Razor-AHRS/razor-9dof-ahrs) project,
- 2011-2012 Quality & Usability Lab, Deutsche Telekom Laboratories, TU Berlin from [Razor AHRS](https://github.com/Razor-AHRS/razor-9dof-ahrs) project,
- 2009 [Yury Petrov](https://www.mathworks.com/matlabcentral/fileexchange/24693-ellipsoid-fit), Northeastern University, Boston, MA.
