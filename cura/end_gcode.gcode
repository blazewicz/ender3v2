M117 End G-code

G91 ; Relative positioning

G1 E{material_anti_ooze_retracted_position} F2700 ; Retract to prevent oozing
G0 Z0.2 F2400                                     ; Raise Z
G0 X5 Y5 F3000                                    ; Wipe out
G0 Z10                                            ; Raise Z more

G4  ; Wait for all movenet to stop

G90 ; Absolute positioning

G1 X0 Y{machine_depth} ; Present print

M106 S0 ; Turn-off fan
M104 S0 ; Turn-off hotend
M140 S0 ; Turn-off bed

M84 X Y E ; Disable all steppers but Z
