# Install Wifi

    Configure the wifi credentials (check here for additional details)

'''
    $ sudo vi /etc/wpa_supplicant/wpa_supplicant.conf 
'''

And add the following block at the end of the file, replacing SSID and password to match your network:

'''
            network={
                ssid="The_SSID_of_your_wifi"
                psk="Your_wifi_password"
            }
'''
