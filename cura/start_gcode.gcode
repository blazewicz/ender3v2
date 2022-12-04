; Ender 3 V2 Custom Start G-code
M117 Start G-code ...

M204 P3000 T3000 ; set starting acceleration

M106 S0                                   ; Turn-off fan
M104 S{material_standby_temperature}      ; Pre-heat hotend below oozing temp
M190 S{material_bed_temperature_layer_0}  ; Wait until bed gets to temp

G28       ; Home all axes
G29 A     ; Activate UBL
G29 L0    ; Load mesh data
G29 J     ; Start 3-point tramming
G29 F10.0 ; Fade to 10 mm

G90                                         ; Absolute Positioning
G0 X0 Y0 F5000.0                            ; Move to origin
M109 S{material_print_temperature_layer_0}  ; Wait until hotend gets to temp

M83 ; Relative Extrusion

G0 X0.1 Y20 Z0.3 F5000.0        ; Move to start position
G1 X0.1 Y200.0 Z0.3 E15 F1500.0 ; Draw the first line
G0 X0.4 Y200.0 Z0.3 F5000.0     ; Move to side a little
G1 X0.4 Y20 Z0.3 E15 F1500.0    ; Draw the second line
G0 Z2.0 F3000                   ; Move Z Axis up little to prevent scratching of Heat Bed
G0 X5 Y20 Z0.3 F5000.0          ; Move over to prevent blob squish

G90    ; Absolute Positioning
G92 E0 ; Reset Extruder

M117 Printing ...
