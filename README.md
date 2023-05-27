# Script tools for B2G project


## auto_flash_from_pvt.sh

This script was written for download builds from PVT server.

You'll need an LDAP account and accessibility to the folder to access it.

### Usage:

```
Usage: ./auto_flash_from_pvt.sh [parameters]
  -v|--version  the target build version.
  -d|--device   the target device.
  -s <serial number>    directs command to device with the given serial number.
  -f|--full     flash full image into device.
  -g|--gaia     shallow flash gaia into device.
  -G|--gecko    shallow flash gecko into device.
  --usr specify User(USR) build.
  --eng specify Engineer(ENG) build.
  -b|--buildid  specify target build YYYYMMDDhhmmss
  -w            interaction GUI mode.
  -y            Assume "yes" to all questions
  -h|--help     display help.
Environment:
  HTTP_USER={username}  set LDAP account. (you can fill it into .ldap file)
  HTTP_PWD={password}   set LDAP password. (you can fill it into .ldap file)
  UNINSTALL_COMRIL=true         uninstall the com-ril when shallow flash gecko. (Keep com-ril by default)
  DL_HOME={download_dir_home}   specify download folder. Default=./pvt
  USE_LOCAL=false       force download target builds (with Build ID) from PVT server. Default=true
  USE_LOCAL_LATEST=true do not download Latest builds from PVT server. Default=false
Example:
  Flash by interaction GUI mode                         ./auto_flash_from_pvt.sh -w
  (Linux) Flash inari v1.2.0 ENG image                          ./auto_flash_from_pvt.sh --version=v1.2.0 --device=inari --full --eng
  (Mac)   Flash inari v1.2.0 ENG image                          ./auto_flash_from_pvt.sh --version v1.2.0 --device inari --full --eng
  (Linux) Flash buri master USR build 20131116040201 gaia/gecko ./auto_flash_from_pvt.sh -vmaster -dburi -b20131116040201 -g -G --usr
  (Mac)   Flash buri master USR build 20131116040201 gaia/gecko ./auto_flash_from_pvt.sh -v master -d buri -b 20131116040201 -g -G --usr
```

### Note:

If you are **MAC OS X User**, and got the error while trying to get the build from server.

```bash
Connecting to path.to.server|xxx.xxx.xxx.xxx|:443... connected.
ERROR: The certificate of 'path.to.server' is not trusted.
ERROR: The certificate of 'path.to.server' hasn't got a known issuer.
Download https://path.to.server/xxx/xxx/xxx.zip failed.
```

Please do the following steps to fix the wget problem, and try again.

```bash
sudo port install curl-ca-bundle
echo CA_CERTIFICATE=/opt/local/share/curl/curl-ca-bundle.crt >> ~/.wgetrc
```

----

## auto_flash_from_twci.sh

This script was written for download builds from TW-CI server.

### Usage:

```
Usage: ./auto_flash_from_twci.sh [parameters]
  -v|--version  the target build version.
  -d|--device   the target device.
  -s <serial number>    directs command to device with the given serial number.
  -f|--full     flash full image into device.
  -g|--gaia     shallow flash gaia into device.
  -G|--gecko    shallow flash gecko into device.
  -w            interaction GUI mode.
  -y            Assume "yes" to all questions
  -h|--help     display help.
Environment:
  UNINSTALL_COMRIL=true         uninstall the com-ril when shallow flash gecko. (Keep com-ril by default)
Example:
  Flash by interaction GUI mode         ./auto_flash_from_twci.sh -w
  (Linux) Flash wasabi v1.2.0 image             ./auto_flash_from_twci.sh -vv1.2.0 -dwasabi -f
  (MAC)   Flash wasabi v1.2.0 image             ./auto_flash_from_twci.sh -v v1.2.0 -d wasabi -f
  (Linux) Flash nexus4 master gaia/gecko        ./auto_flash_from_TWCI.sh --version=master --device=nexus4 -g -G
  (MAC)   Flash nexus4 master gaia/gecko        ./auto_flash_from_TWCI.sh --version master --device nexus4 --gaia --gecko
```

----

## backup_restore_profile.sh

This script was written for backup and restore user profile.

### Usage:

```
Usage:
  -b|--backup   backup user profile.
  -r|--restore  restore user profile.
  -h|--help     display help.
```

----

## change_ota_channel_pref.sh

Setup a FxOS device for QA by forcing the 'nightly' update channel

### Usage:

```
Help:
     -d <device>  : specify a device (leo, hamachi, helix, inari) to update
     -v <version> : version to update to ( 1.3.0, 1.2.0, 1.1.1)
     -h : this help menu
```

----

## change_ota_url.sh

This script is used to change OTA update URL to a local or a specific URL.

### Usage:

```
-h, --help      Show usage.
-p              Show prefs file of device.
-u, --url       The update.xml URL.
```

### Example:

Change the OTA update URL to http://update.server/update.xml.

    ./change_OTA_URL.sh --url http://update.server/update.xml

----

## check_versions.sh

Checking the version of B2G on devices.

Please make sure your devices can be detected by ADB tool.

### Usage:

```
-s <serial number>            - directs command to the USB device or emulator with
                                 the given serial number. Overrides ANDROID_SERIAL
                                 environment variable.
-h | --help                   - print usage.
```

### Example:

Check version with serial number parameter

    ./check_versions.sh -s serialnumber

Check version with environment variable

    ANDROID_SERIAL=serialnumber ./check_versions.sh

----

## download_desktop_client.sh

This script was written for download last desktop from server.

Visit [MDN: Using the B2G desktop client](https://developer.mozilla.org/en-US/docs/Mozilla/Firefox_OS/Using_the_B2G_desktop_client) for more detail information.

### Parameters:

There are three os platform `l32` (linux 32bit), `l64` (linux 64bit) and `mac`.

And you can run `./download_desktop_client.sh -v` to get the supported versions.

```
Usage: ./download_desktop_client.sh [parameters]
-o|--os         The target OS. Default: linux64
                show available OS if nothing specified.
-v|--version    The target build version. Default: master
                show available version if nothing specified.
-r|--run-once   Run once to get BuildID.
-h|--help       Display help.
Example:
  B2G v1.2.0 Linux 32bit build. ./download_desktop_client.sh --os=l32 --version=120
  B2G v1.1.0 Linux 64bit build. ./download_desktop_client.sh -ol64 -v110
  B2G master Mac build. ./download_desktop_client.sh -omac
```

----

## get_crashreports.sh

This is to get the crash reports of submitted/pending.

It will get reports under `/data/b2g/mozilla/Crash Reports/` on device.

----

## install_comril.sh

This script was written for uninstall/install com-ril.

### Usage:

```
Usage: ./install_comril.sh [parameters]
  -u|--uninstall        uninstall the com-ril.
  -r|--ril      install the com-ril from the file.
  -d|--ril-debug        turn on ril debugging.
  -s <serial number>    directs command to device with the given serial number.
  -y            Assume "yes" to all questions
  -h|--help     display help.

```

----

## shallow_flash.sh

This script was written for shallow flash the gaia and/or gecko.

### Usage:

```
Usage: ./shallow_flash.sh [parameters]
-g|--gaia       Flash the gaia (zip format) into your device.
-G|--gecko      Flash the gecko (tar.gz format) into your device.
-s <serial number>      directs command to device with the given serial number.
-y              flash the file without asking askeing (it's a joke...)
-h|--help       Display help.
Example:
  Flash gaia.           ./shallow_flash.sh --gaia=gaia.zip
  Flash gecko.          ./shallow_flash.sh --gecko=b2g-18.0.en-US.android-arm.tar.gz
  Flash gaia and gecko. ./shallow_flash.sh -ggaia.zip -Gb2g-18.0.en-US.android-arm.tar.gz
```

----

