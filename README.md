# puppet

## instructions for tasmania show

1. plug mac mini, msi pc, apple router and kinect2 to the power.
* connect mac mini and msi pc to the "puppet" network.
* open the network preferences of the mac mini, and look up the ip address.
* open **kinect_data** processing sketch on the msi pc.
* replace the ipMacbook variable for the current ip address of the mac mini, making sure of using double quotes and dots.
* run the **kinect_data** processing sketch on the mac mini.
* run the **visuals_left** processing sketch on the mac mini.
* run the max patch **puppet.maxpat** on the mac mini.
* run the **visuals_right** processing sketch on the mac mini.


## about

an audiovisual reactive dance piece by yuli cai, aaron montoya-moraga and donald shorter, done as students at the choreographic interventions class at nyu itp during the 2016 spring semester, taught by mimi yin.

## performances

it has been performed during the final show of the choreographic interventions class and at the salamanca moves festival.

## hardware and configuration

the original piece ran on 4 computers:

1. msi windows machine: connected to a kinect v2 and running processing 3.
* macbook: running processing 3 and creating visuals for the left screen, according to the data received.
* macbook: running processing 3 and creating visuals for the right screen, according to the data received.
* macbook: running max msp 7 and manipulating audio, fed to two ue boom 2 bluetooth speakers.

## software and libraries

the following software and its libraries were used:

* processing 3: oscp5, toxiclibs, KinectPV2

note:
1. The library toxiclibs could be barely found online now, so we include it in this GitHub page
2. The library KinectPV2 from the **processing add library page** is broken right now, so we also include it in this repository.

* max msp 7
