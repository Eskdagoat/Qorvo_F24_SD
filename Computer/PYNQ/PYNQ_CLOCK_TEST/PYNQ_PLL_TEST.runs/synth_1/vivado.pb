
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:062

00:00:092	
547.7582	
237.496Z17-268h px� 
>
Refreshing IP repositories
234*coregenZ19-234h px� 
G
"No user IP repositories specified
1154*coregenZ19-1704h px� 
j
"Loaded Vivado IP repository '%s'.
1332*coregen2!
C:/Xilinx/Vivado/2024.1/data/ipZ19-2313h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental B:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.srcs/utils_1/imports/synth_1/MainDesign_wrapper.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2�
�B:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.srcs/utils_1/imports/synth_1/MainDesign_wrapper.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
m
Command: %s
53*	vivadotcl2<
:synth_design -top MainDesign_wrapper -part xc7z020clg400-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7z020Z17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7z020Z17-349h px� 
D
Loading part %s157*device2
xc7z020clg400-1Z21-403h px� 
Z
$Part: %s does not have CEAM library.966*device2
xc7z020clg400-1Z21-9227h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
23504Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:06 . Memory (MB): peak = 1440.496 ; gain = 449.961
h px� 
�
synthesizing module '%s'%s4497*oasys2
MainDesign_wrapper2
 2�
�B:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.gen/sources_1/bd/MainDesign/hdl/MainDesign_wrapper.v2
138@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

MainDesign2
 2�
�b:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.gen/sources_1/bd/MainDesign/synth/MainDesign.v2
138@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
MainDesign_ClockDivider_4_02
 2�
�B:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.runs/synth_1/.Xil/Vivado-23448-AB-Beast/realtime/MainDesign_ClockDivider_4_0_stub.v2
68@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
MainDesign_ClockDivider_4_02
 2
02
12�
�B:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.runs/synth_1/.Xil/Vivado-23448-AB-Beast/realtime/MainDesign_ClockDivider_4_0_stub.v2
68@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

MainDesign2
 2
02
12�
�b:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.gen/sources_1/bd/MainDesign/synth/MainDesign.v2
138@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
MainDesign_wrapper2
 2
02
12�
�B:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.gen/sources_1/bd/MainDesign/hdl/MainDesign_wrapper.v2
138@Z8-6155h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:07 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:03 ; elapsed = 00:00:07 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:03 ; elapsed = 00:00:07 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1549.5862
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�b:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.gen/sources_1/bd/MainDesign/ip/MainDesign_ClockDivider_4_0/MainDesign_ClockDivider_4_0/MainDesign_ClockDivider_4_0_in_context.xdc2
MainDesign_i/ClockDivider_4	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�b:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.gen/sources_1/bd/MainDesign/ip/MainDesign_ClockDivider_4_0/MainDesign_ClockDivider_4_0/MainDesign_ClockDivider_4_0_in_context.xdc2
MainDesign_i/ClockDivider_4	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2�
�B:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.srcs/constrs_1/new/Constraints.xdc8Z20-179h px� 
�
No ports matched '%s'.
584*	planAhead2
LD02�
�B:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.srcs/constrs_1/new/Constraints.xdc2
28@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
LD12�
�B:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.srcs/constrs_1/new/Constraints.xdc2
38@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
LD22�
�B:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.srcs/constrs_1/new/Constraints.xdc2
48@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
LD32�
�B:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.srcs/constrs_1/new/Constraints.xdc2
58@Z12-584h px�
�
Finished Parsing XDC File [%s]
178*designutils2�
�B:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.srcs/constrs_1/new/Constraints.xdc8Z20-178h px� 
�
�One or more constraints failed evaluation while reading constraint file [%s] and the design contains unresolved black boxes. These constraints will be read post-synthesis (as long as their source constraint file is marked as used_in_implementation) and should be applied correctly then. You should review the constraints listed in the file [%s] and check the run log file to verify that these constraints were correctly applied.301*project2�
�B:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.srcs/constrs_1/new/Constraints.xdc2&
$.Xil/MainDesign_wrapper_propImpl.xdcZ1-498h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2�
�B:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.srcs/constrs_1/new/Constraints.xdc2&
$.Xil/MainDesign_wrapper_propImpl.xdcZ1-236h px� 
�
Parsing XDC File [%s]
179*designutils2
{B:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.runs/synth_1/dont_touch.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2
{B:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.runs/synth_1/dont_touch.xdc8Z20-178h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1549.5862
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0012

1549.5862
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:07 ; elapsed = 00:00:15 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7z020clg400-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:07 ; elapsed = 00:00:15 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:07 ; elapsed = 00:00:15 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:07 ; elapsed = 00:00:16 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
%s
*synth2Y
WPart Resources:
DSPs: 220 (col length:60)
BRAMs: 280 (col length: RAMB18 60 RAMB36 30)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:07 ; elapsed = 00:00:17 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:10 ; elapsed = 00:00:23 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:10 ; elapsed = 00:00:23 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:10 ; elapsed = 00:00:23 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:12 ; elapsed = 00:00:28 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:12 ; elapsed = 00:00:28 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:12 ; elapsed = 00:00:28 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:12 ; elapsed = 00:00:28 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:12 ; elapsed = 00:00:28 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:12 ; elapsed = 00:00:28 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
K
%s
*synth23
1+------+----------------------------+----------+
h p
x
� 
K
%s
*synth23
1|      |BlackBox name               |Instances |
h p
x
� 
K
%s
*synth23
1+------+----------------------------+----------+
h p
x
� 
K
%s
*synth23
1|1     |MainDesign_ClockDivider_4_0 |         1|
h p
x
� 
K
%s
*synth23
1+------+----------------------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
E
%s*synth2-
++------+--------------------------+------+
h px� 
E
%s*synth2-
+|      |Cell                      |Count |
h px� 
E
%s*synth2-
++------+--------------------------+------+
h px� 
E
%s*synth2-
+|1     |MainDesign_ClockDivider_4 |     1|
h px� 
E
%s*synth2-
+|2     |IBUF                      |     1|
h px� 
E
%s*synth2-
+|3     |OBUF                      |     1|
h px� 
E
%s*synth2-
++------+--------------------------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:12 ; elapsed = 00:00:28 . Memory (MB): peak = 1549.586 ; gain = 559.051
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 1 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:08 ; elapsed = 00:00:26 . Memory (MB): peak = 1549.586 ; gain = 559.051
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:12 ; elapsed = 00:00:28 . Memory (MB): peak = 1549.586 ; gain = 559.051
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1549.5862
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1549.5862
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

d02f9158Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
292
62
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:152

00:00:352

1549.5862	
986.070Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002

00:00:002

1549.5862
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2�
�B:/OneDrive/OneDrive/_School/QORVO_RADIO/Github/Qorvo_F24_SD/PYNQ/PYNQ_CLOCK_TEST/PYNQ_PLL_TEST.runs/synth_1/MainDesign_wrapper.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2o
mreport_utilization -file MainDesign_wrapper_utilization_synth.rpt -pb MainDesign_wrapper_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Sun Nov 17 23:51:03 2024Z17-206h px� 


End Record