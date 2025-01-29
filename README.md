# Tunable-Clock-Generator
1. Designed a clock generator using the SKY130 technology flow and Hammer-Blade CAD flow, automating the RTL to GDSII conversion process.
2. Creating 16 different tunable steps using inverted mux's in clk_gen.v. The period delta between each step is designed to be roughly equal. This allows for precise control and fine-tuning of the oscillator’s output frequency.
3. All the cells, (inverters, mux, etc) are chosen from the SKY130 standard cell library : sky130_fd_sc_hd__ss_100C_1v60.lib.
4. First task is to calculate the delay of a “fan-out-of-4 inverter” (known as the FO4 delay) for the SKY130 process.
5. Measure FO4 value from fo4.v file.
6. Make sure that the clock generators min F04 < 25*FO4 and max FO4 > 50*FO4 for a good design.
7. Duty cycle should be 50 percent or very close to it.
8. After designing clk_gen.v, automate Placement and Routing using make scripts in Hammer-Blade CAD flow. 
