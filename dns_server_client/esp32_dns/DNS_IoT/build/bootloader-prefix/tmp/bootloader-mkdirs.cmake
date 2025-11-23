# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/soy/esp-idf/components/bootloader/subproject"
  "/home/soy/vault/DNS_Tunneling_MLP/dns_server_client/esp32_dns/DNS_IoT/build/bootloader"
  "/home/soy/vault/DNS_Tunneling_MLP/dns_server_client/esp32_dns/DNS_IoT/build/bootloader-prefix"
  "/home/soy/vault/DNS_Tunneling_MLP/dns_server_client/esp32_dns/DNS_IoT/build/bootloader-prefix/tmp"
  "/home/soy/vault/DNS_Tunneling_MLP/dns_server_client/esp32_dns/DNS_IoT/build/bootloader-prefix/src/bootloader-stamp"
  "/home/soy/vault/DNS_Tunneling_MLP/dns_server_client/esp32_dns/DNS_IoT/build/bootloader-prefix/src"
  "/home/soy/vault/DNS_Tunneling_MLP/dns_server_client/esp32_dns/DNS_IoT/build/bootloader-prefix/src/bootloader-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/soy/vault/DNS_Tunneling_MLP/dns_server_client/esp32_dns/DNS_IoT/build/bootloader-prefix/src/bootloader-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/soy/vault/DNS_Tunneling_MLP/dns_server_client/esp32_dns/DNS_IoT/build/bootloader-prefix/src/bootloader-stamp${cfgdir}") # cfgdir has leading slash
endif()
