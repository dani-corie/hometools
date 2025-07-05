# workaround for the psmouse module dying of system suspend
sudo modprobe -r usbhid
sudo modprobe -r psmouse
sudo modprobe psmouse
sudo modprobe usbhid
