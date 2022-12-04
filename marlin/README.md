# Custom changes to Marlin code/configuration

Current changes are maintained in my fork's branch: https://github.com/blazewicz/marlin/tree/blazewicz-custom

Marlin should be build using Platform.io with STM32F103RE_btt environment or GD32F103RE_btt (fCPU is 96 instead of 72 MHz).

## Patching for GD version

Because my board has GD32F103RE MCU instead of usual ST32F103RE USB doesn't work properly without patching the ArduinoSTM32 framework code.

```diff
--- ~/.platformio/packages/framework-arduinoststm32/cores/arduino/stm32/usb/usbd_ep_conf.c
+++ ~/.platformio/packages/framework-arduinoststm32/cores/arduino/stm32/usb/usbd_ep_conf.c
@@ -35,11 +35,12 @@
   {CDC_IN_EP,  CDC_DATA_FS_MAX_PACKET_SIZE},
   {CDC_CMD_EP, CDC_CMD_PACKET_SIZE}
 #else
-  {0x00,       PMA_EP0_OUT_ADDR, PCD_DBL_BUF},
-  {0x80,       PMA_EP0_IN_ADDR,  PCD_DBL_BUF},
-  {CDC_OUT_EP, PMA_CDC_OUT_ADDR, PCD_DBL_BUF},
-  {CDC_IN_EP,  PMA_CDC_IN_ADDR,  PCD_DBL_BUF},
-  {CDC_CMD_EP, PMA_CDC_CMD_ADDR, PCD_DBL_BUF}
+  {0x00,       PMA_EP0_OUT_ADDR, PCD_SNG_BUF},
+  {0x80,       PMA_EP0_IN_ADDR,  PCD_SNG_BUF},
+  {CDC_OUT_EP, PMA_CDC_OUT_ADDR, PCD_SNG_BUF},
+  {CDC_IN_EP,  PMA_CDC_IN_ADDR,  PCD_SNG_BUF},
+  {CDC_CMD_EP, PMA_CDC_CMD_ADDR, PCD_SNG_BUF}
 #endif
 #endif
 };
```
