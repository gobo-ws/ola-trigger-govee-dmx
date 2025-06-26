**OLA trigger config to control a Govee device with DMX (Art-Net, sACN or via DMX input)**

**Requirements**

* [OLA](https://www.openlighting.org/ola)
* Bash shell, socat and bc
* [Govee device](https://eu.govee.com) (only tested with Smart Outdoor S14 Bulb String Lights 2, H702A). Only on/off and brightness control succeeded using the LAN API. RGB and colour temperature were unsuccessful

**Installation**
  
* Download the [govee.conf](govee.conf) and [govee.sh](govee.sh) files and configure the Govee hostname or IP address in the shell script


[OLA trigger documentation](https://www.openlighting.org/ola/advanced-topics/ola-dmx-trigger/)

**Usage** 

* Before running ola_trigger, make sure that olad is running and the universe has been configured with a DMX512 source.  
The config file is provided on the command line:

`ola_trigger govee.conf`
