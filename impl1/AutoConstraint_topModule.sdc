
#Begin clock constraint
define_clock -name {my_pll_64mhz|CLKOP_inferred_clock} {n:my_pll_64mhz|CLKOP_inferred_clock} -period 1000.000 -clockgroup Autoconstr_clkgroup_0 -rise 0.000 -fall 500.000 -route 0.000 
#End clock constraint

#Begin clock constraint
define_clock -name {clockDivider|clkOut_derived_clock} {n:clockDivider|clkOut_derived_clock} -period 1000.000 -clockgroup Autoconstr_clkgroup_0 -rise 0.000 -fall 500.000 -route 0.000 
#End clock constraint
