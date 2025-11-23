this is how u would pass in your credentials safely so esp32 can compile with your creds

idf.py -D WIFI_SSID=\"MyNetwork\" \
       -D WIFI_PASSWORD=\"SuperSecret123\" \
       build
