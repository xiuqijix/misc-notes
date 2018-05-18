# Generic Sensor

## Sensor Link

https://w3c.github.io/sensors/

https://w3c.github.io/ambient-light/

https://w3c.github.io/gyroscope/

https://w3c.github.io/accelerometer/

https://w3c.github.io/magnetometer/

https://w3c.github.io/orientation-sensor/

https://w3c.github.io/proximity/

https://w3c.github.io/geolocation-api/

https://wicg.github.io/geolocation-sensor/
##### Layout tests
https://chromium.googlesource.com/chromium/src.git/+/master/third_party/WebKit/LayoutTests/sensor/
##### Permissions
https://w3c.github.io/permissions/
##### Demos
https://github.com/01org/websensor-ambient-map

https://github.com/01org/websensor-compass

https://github.com/01org/websensor-sensor-info

https://github.com/01org/websensor-vr-button

https://github.com/intel/generic-sensor-demos

http://quaternions.online/


## Information

##### Device and Sensors Working Group
https://www.w3.org/2009/dap/
##### Sensor wiki
https://en.wikipedia.org/wiki/Sensor
##### Sensor Use Cases
https://w3c.github.io/sensors/usecases.html
##### Sensor ployfills
https://github.com/kenchris/sensor-polyfills
##### GENERIC SENSOR API FOR JAVASCRIPT-POWERED PLATFORMS
https://01.org/chromium/blogs/riju/2016/generic-sensor-api-javascript-powered-platforms

## Others

https://android.googlesource.com/platform/frameworks/base/+/master/core/java/android/hardware/SensorManager.java

https://groups.google.com/a/chromium.org/forum/#!msg/blink-dev/_IReUkNKF6o/OOTIa5x7DgAJ

https://codereview.chromium.org/

https://www.w3.org/2017/02/23-dap-minutes.html

https://codereview.chromium.org/2458453002/

##### Quaternion Calculation
https://www.cnblogs.com/mimime/p/6192427.html
欧拉角到四元数：
 
给定一个欧拉旋转(X, Y, Z)（即分别绕x轴、y轴和z轴旋转X、Y、Z度），则对应的四元数为：
 
x = sin(Y/2)sin(Z/2)cos(X/2)+cos(Y/2)cos(Z/2)sin(X/2)
y = sin(Y/2)cos(Z/2)cos(X/2)+cos(Y/2)sin(Z/2)sin(X/2)
z = cos(Y/2)sin(Z/2)cos(X/2)-sin(Y/2)cos(Z/2)sin(X/2)
w = cos(Y/2)cos(Z/2)cos(X/2)-sin(Y/2)sin(Z/2)sin(X/2)
q = ((x, y, z), w)


