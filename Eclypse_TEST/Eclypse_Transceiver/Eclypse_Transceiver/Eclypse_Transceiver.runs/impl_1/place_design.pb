
R
Command: %s
53*	vivadotcl2!
place_design -directive ExploreZ4-113h px� 

@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
Implementation2	
xc7z020Z17-347h px� 
o
0Got license for feature '%s' and/or device '%s'
310*common2
Implementation2	
xc7z020Z17-349h px� 
H
Releasing license: %s
83*common2
ImplementationZ17-83h px� 
>
Running DRC with %s threads
24*drc2
8Z23-27h px� 
D
DRC finished with %s
79*	vivadotcl2

0 ErrorsZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
a
/The placer was invoked with the '%s' directive.52242*	vivadotcl2	
ExploreZ4-2302h px� 
^
,Running DRC as a precondition to command %s
22*	vivadotcl2
place_designZ4-22h px� 
>
Running DRC with %s threads
24*drc2
8Z23-27h px� 
Q
DRC finished with %s
79*	vivadotcl2
0 Errors, 23 WarningsZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
k
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
8Z30-611h px� 
C

Starting %s Task
103*constraints2
PlacerZ18-103h px� 
R

Phase %s%s
101*constraints2
1 2
Placer InitializationZ18-101h px� 
d

Phase %s%s
101*constraints2
1.1 2'
%Placer Initialization Netlist SortingZ18-101h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2
00:00:00.012
00:00:00.012

3130.7112
0.0002
59362
10965Z17-722h px� 
a
%s*common2H
FPhase 1.1 Placer Initialization Netlist Sorting | Checksum: 153f0b1fe
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.04 . Memory (MB): peak = 3130.711 ; gain = 0.000 ; free physical = 5936 ; free virtual = 10966h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2

00:00:002

00:00:002

3130.7112
0.0002
59362
10966Z17-722h px� 
q

Phase %s%s
101*constraints2
1.2 24
2IO Placement/ Clock Placement/ Build Placer DeviceZ18-101h px� 
m
%s*common2T
RPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 458a1c8e
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 3162.727 ; gain = 32.016 ; free physical = 5942 ; free virtual = 10975h px� 
Y

Phase %s%s
101*constraints2
1.3 2
Build Placer Netlist ModelZ18-101h px� 
U
%s*common2<
:Phase 1.3 Build Placer Netlist Model | Checksum: e9acc0cc
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:17 ; elapsed = 00:00:10 . Memory (MB): peak = 3201.770 ; gain = 71.059 ; free physical = 5892 ; free virtual = 10926h px� 
V

Phase %s%s
101*constraints2
1.4 2
Constrain Clocks/MacrosZ18-101h px� 
R
%s*common29
7Phase 1.4 Constrain Clocks/Macros | Checksum: e9acc0cc
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:17 ; elapsed = 00:00:10 . Memory (MB): peak = 3201.770 ; gain = 71.059 ; free physical = 5892 ; free virtual = 10926h px� 
N
%s*common25
3Phase 1 Placer Initialization | Checksum: e9acc0cc
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:18 ; elapsed = 00:00:10 . Memory (MB): peak = 3201.770 ; gain = 71.059 ; free physical = 5892 ; free virtual = 10926h px� 
M

Phase %s%s
101*constraints2
2 2
Global PlacementZ18-101h px� 
L

Phase %s%s
101*constraints2
2.1 2
FloorplanningZ18-101h px� 
I
%s*common20
.Phase 2.1 Floorplanning | Checksum: 16f1a67d2
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:25 ; elapsed = 00:00:13 . Memory (MB): peak = 3202.770 ; gain = 72.059 ; free physical = 5890 ; free virtual = 10925h px� 
`

Phase %s%s
101*constraints2
2.2 2#
!Update Timing before SLR Path OptZ18-101h px� 
]
%s*common2D
BPhase 2.2 Update Timing before SLR Path Opt | Checksum: 1b65795eb
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:31 ; elapsed = 00:00:16 . Memory (MB): peak = 3202.770 ; gain = 72.059 ; free physical = 5889 ; free virtual = 10925h px� 
_

Phase %s%s
101*constraints2
2.3 2"
 Post-Processing in FloorplanningZ18-101h px� 
\
%s*common2C
APhase 2.3 Post-Processing in Floorplanning | Checksum: 1b65795eb
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:31 ; elapsed = 00:00:16 . Memory (MB): peak = 3202.770 ; gain = 72.059 ; free physical = 5889 ; free virtual = 10925h px� 
R

Phase %s%s
101*constraints2
2.4 2
Global Place Phase1Z18-101h px� 
O
%s*common26
4Phase 2.4 Global Place Phase1 | Checksum: 19b40514c
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:02 ; elapsed = 00:00:34 . Memory (MB): peak = 3202.770 ; gain = 72.059 ; free physical = 5903 ; free virtual = 10939h px� 
R

Phase %s%s
101*constraints2
2.5 2
Global Place Phase2Z18-101h px� 
g

Phase %s%s
101*constraints2
2.5.1 2(
&UpdateTiming Before Physical SynthesisZ18-101h px� 
d
%s*common2K
IPhase 2.5.1 UpdateTiming Before Physical Synthesis | Checksum: 12ce9bdab
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:08 ; elapsed = 00:00:37 . Memory (MB): peak = 3202.770 ; gain = 72.059 ; free physical = 5903 ; free virtual = 10939h px� 
]

Phase %s%s
101*constraints2
2.5.2 2
Physical Synthesis In PlacerZ18-101h px� 
w
FFound %s LUTNM shape to break, %s LUT instances to create LUTNM shape
553*physynth2
02
995Z32-1035h px� 
�
YBreak lutnm for timing: one critical %s, two critical %s, total %s, new lutff created %s
561*physynth2
02
02
02
0Z32-1044h px� 
�
^End %s Pass. Optimized %s %s. Breaked %s %s, combined %s existing %s and moved %s existing %s
576*physynth2
12
4472
nets or LUTs2
02
LUT2
4472
LUTs2
02
LUTZ32-1138h px� 
K
)No high fanout nets found in the design.
65*physynthZ32-65h px� 
e
$Optimized %s %s. Created %s new %s.
216*physynth2
02
net2
02

instanceZ32-232h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12
02
net or cell2
02
cell2
02
cell2
02
cellZ32-775h px� 
q
0No setup violation found.  %s was not performed.344*physynth2
DSP Register OptimizationZ32-670h px� 

0No setup violation found.  %s was not performed.344*physynth2)
'Shift Register to Pipeline OptimizationZ32-670h px� 
s
0No setup violation found.  %s was not performed.344*physynth2
Shift Register OptimizationZ32-670h px� 
r
0No setup violation found.  %s was not performed.344*physynth2
BRAM Register OptimizationZ32-670h px� 
r
0No setup violation found.  %s was not performed.344*physynth2
URAM Register OptimizationZ32-670h px� 
o
KNo candidate nets found for dynamic/static region interface net replication521*physynthZ32-949h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12
02
net or cell2
02
cell2
02
cell2
02
cellZ32-775h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2

00:00:002
00:00:00.012

3202.7702
0.0002
59002
10939Z17-722h px� 
B
-
Summary of Physical Synthesis Optimizations
*commonh px� 
B
-============================================
*commonh px� 


*commonh px� 


*commonh px� 
�
�-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Optimization                                     |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  LUT Combining                                    |            0  |            447  |                   447  |           0  |           1  |  00:00:01  |
|  Retime                                           |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Very High Fanout                                 |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  DSP Register                                     |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  Shift Register to Pipeline                       |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  Shift Register                                   |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  BRAM Register                                    |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  URAM Register                                    |            0  |              0  |                     0  |           0  |           0  |  00:00:00  |
|  Dynamic/Static Region Interface Net Replication  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Total                                            |            0  |            447  |                   447  |           0  |           4  |  00:00:01  |
-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
Y
%s*common2@
>Phase 2.5.2 Physical Synthesis In Placer | Checksum: db21bf94
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:16 ; elapsed = 00:00:42 . Memory (MB): peak = 3202.770 ; gain = 72.059 ; free physical = 5900 ; free virtual = 10939h px� 
O
%s*common26
4Phase 2.5 Global Place Phase2 | Checksum: 17ae5b5bc
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:17 ; elapsed = 00:00:43 . Memory (MB): peak = 3202.770 ; gain = 72.059 ; free physical = 5899 ; free virtual = 10939h px� 
J
%s*common21
/Phase 2 Global Placement | Checksum: 17ae5b5bc
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:17 ; elapsed = 00:00:43 . Memory (MB): peak = 3202.770 ; gain = 72.059 ; free physical = 5899 ; free virtual = 10939h px� 
M

Phase %s%s
101*constraints2
3 2
Detail PlacementZ18-101h px� 
Y

Phase %s%s
101*constraints2
3.1 2
Commit Multi Column MacrosZ18-101h px� 
V
%s*common2=
;Phase 3.1 Commit Multi Column Macros | Checksum: 18aff3244
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:26 ; elapsed = 00:00:46 . Memory (MB): peak = 3202.770 ; gain = 72.059 ; free physical = 5899 ; free virtual = 10939h px� 
[

Phase %s%s
101*constraints2
3.2 2
Commit Most Macros & LUTRAMsZ18-101h px� 
X
%s*common2?
=Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 113e1dee2
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:39 ; elapsed = 00:00:54 . Memory (MB): peak = 3202.770 ; gain = 72.059 ; free physical = 5899 ; free virtual = 10939h px� 
U

Phase %s%s
101*constraints2
3.3 2
Area Swap OptimizationZ18-101h px� 
R
%s*common29
7Phase 3.3 Area Swap Optimization | Checksum: 10b16c55b
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:39 ; elapsed = 00:00:55 . Memory (MB): peak = 3202.770 ; gain = 72.059 ; free physical = 5899 ; free virtual = 10939h px� 
]

Phase %s%s
101*constraints2
3.4 2 
Pipeline Register OptimizationZ18-101h px� 
Z
%s*common2A
?Phase 3.4 Pipeline Register Optimization | Checksum: 19df8f57b
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:39 ; elapsed = 00:00:55 . Memory (MB): peak = 3202.770 ; gain = 72.059 ; free physical = 5899 ; free virtual = 10939h px� 
[

Phase %s%s
101*constraints2
3.5 2
Small Shape Detail PlacementZ18-101h px� 
X
%s*common2?
=Phase 3.5 Small Shape Detail Placement | Checksum: 12f6939b3
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:49 ; elapsed = 00:01:11 . Memory (MB): peak = 3202.770 ; gain = 72.059 ; free physical = 5896 ; free virtual = 10936h px� 
Q

Phase %s%s
101*constraints2
3.6 2
Re-assign LUT pinsZ18-101h px� 
N
%s*common25
3Phase 3.6 Re-assign LUT pins | Checksum: 13b51e8be
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:50 ; elapsed = 00:01:13 . Memory (MB): peak = 3202.770 ; gain = 72.059 ; free physical = 5896 ; free virtual = 10936h px� 
]

Phase %s%s
101*constraints2
3.7 2 
Pipeline Register OptimizationZ18-101h px� 
Z
%s*common2A
?Phase 3.7 Pipeline Register Optimization | Checksum: 1627da255
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:50 ; elapsed = 00:01:13 . Memory (MB): peak = 3202.770 ; gain = 72.059 ; free physical = 5896 ; free virtual = 10936h px� 
J
%s*common21
/Phase 3 Detail Placement | Checksum: 1627da255
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:51 ; elapsed = 00:01:14 . Memory (MB): peak = 3202.770 ; gain = 72.059 ; free physical = 5896 ; free virtual = 10936h px� 
e

Phase %s%s
101*constraints2
4 2*
(Post Placement Optimization and Clean-UpZ18-101h px� 
W

Phase %s%s
101*constraints2
4.1 2
Post Commit OptimizationZ18-101h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
\

Phase %s%s
101*constraints2
4.1.1 2
Post Placement OptimizationZ18-101h px� 
V
APost Placement Optimization Initialization | Checksum: 17419f908
*commonh px� 
Q

Phase %s%s
101*constraints2

4.1.1.1 2
BUFG InsertionZ18-101h px� 
O

Starting %s Task
103*constraints2
Physical SynthesisZ18-103h px� 
^

Phase %s%s
101*constraints2
1 2#
!Physical Synthesis InitializationZ18-101h px� 
n
EMultithreading enabled for phys_opt_design using a maximum of %s CPUs380*physynth2
8Z32-721h px� 
o
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
1.3372
0.000Z32-619h px� 
[
%s*common2B
@Phase 1 Physical Synthesis Initialization | Checksum: 12441b4c8
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 3225.566 ; gain = 0.000 ; free physical = 5880 ; free virtual = 10920h px� 
�
PProcessed net %s, BUFG insertion was skipped due to placement/routing conflicts.32*	placeflow2K
Isystem_i/trx_0/rx_0/cic_0/U0/i_synth/decimator.decimation_filter/sclr_intZ46-33h px� 
�
PProcessed net %s, BUFG insertion was skipped due to placement/routing conflicts.32*	placeflow2K
Isystem_i/trx_0/rx_0/cic_1/U0/i_synth/decimator.decimation_filter/sclr_intZ46-33h px� 
�
PProcessed net %s, BUFG insertion was skipped due to placement/routing conflicts.32*	placeflow2K
Isystem_i/trx_1/rx_0/cic_0/U0/i_synth/decimator.decimation_filter/sclr_intZ46-33h px� 
�
PProcessed net %s, BUFG insertion was skipped due to placement/routing conflicts.32*	placeflow2K
Isystem_i/trx_1/rx_0/cic_1/U0/i_synth/decimator.decimation_filter/sclr_intZ46-33h px� 
�
PProcessed net %s, BUFG insertion was skipped due to placement/routing conflicts.32*	placeflow2Q
Osystem_i/trx_0/tx_0/cic_0/U0/i_synth/interpolator.interpolation_filter/sclr_intZ46-33h px� 
�
PProcessed net %s, BUFG insertion was skipped due to placement/routing conflicts.32*	placeflow2Q
Osystem_i/trx_0/tx_0/cic_1/U0/i_synth/interpolator.interpolation_filter/sclr_intZ46-33h px� 
�
PProcessed net %s, BUFG insertion was skipped due to placement/routing conflicts.32*	placeflow2Q
Osystem_i/trx_1/tx_0/cic_0/U0/i_synth/interpolator.interpolation_filter/sclr_intZ46-33h px� 
�
PProcessed net %s, BUFG insertion was skipped due to placement/routing conflicts.32*	placeflow2Q
Osystem_i/trx_1/tx_0/cic_1/U0/i_synth/interpolator.interpolation_filter/sclr_intZ46-33h px� 
�
�BUFG insertion identified %s candidate nets. Inserted BUFG: %s, Replicated BUFG Driver: %s, Skipped due to Placement/Routing Conflicts: %s, Skipped due to Timing Degradation: %s, Skipped due to netlist editing failed: %s.43*	placeflow2
82
02
02
82
02
0Z46-56h px� 
P
%s*common27
5Ending Physical Synthesis Task | Checksum: 14684e595
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:04 ; elapsed = 00:00:03 . Memory (MB): peak = 3225.566 ; gain = 0.000 ; free physical = 5880 ; free virtual = 10920h px� 
N
%s*common25
3Phase 4.1.1.1 BUFG Insertion | Checksum: 17419f908
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:12 ; elapsed = 00:01:25 . Memory (MB): peak = 3225.566 ; gain = 94.855 ; free physical = 5880 ; free virtual = 10920h px� 
e

Phase %s%s
101*constraints2

4.1.1.2 2$
"Post Placement Timing OptimizationZ18-101h px� 
�
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
1.337Z30-746h px� 
b
%s*common2I
GPhase 4.1.1.2 Post Placement Timing Optimization | Checksum: 1737c991a
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:12 ; elapsed = 00:01:25 . Memory (MB): peak = 3225.566 ; gain = 94.855 ; free physical = 5880 ; free virtual = 10920h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:12 ; elapsed = 00:01:25 . Memory (MB): peak = 3225.566 ; gain = 94.855 ; free physical = 5880 ; free virtual = 10920h px� 
T
%s*common2;
9Phase 4.1 Post Commit Optimization | Checksum: 1737c991a
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:13 ; elapsed = 00:01:26 . Memory (MB): peak = 3225.566 ; gain = 94.855 ; free physical = 5880 ; free virtual = 10920h px� 
U

Phase %s%s
101*constraints2
4.2 2
Post Placement CleanupZ18-101h px� 
R
%s*common29
7Phase 4.2 Post Placement Cleanup | Checksum: 1737c991a
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:13 ; elapsed = 00:01:26 . Memory (MB): peak = 3225.566 ; gain = 94.855 ; free physical = 5880 ; free virtual = 10920h px� 
O

Phase %s%s
101*constraints2
4.3 2
Placer ReportingZ18-101h px� 
[

Phase %s%s
101*constraints2
4.3.1 2
Print Estimated CongestionZ18-101h px� 
�
'Post-Placement Estimated Congestion %s
38*	placeflow2�
�
 ____________________________________________________
|           | Global Congestion | Short Congestion  |
| Direction | Region Size       | Region Size       |
|___________|___________________|___________________|
|      North|                1x1|                4x4|
|___________|___________________|___________________|
|      South|                1x1|                4x4|
|___________|___________________|___________________|
|       East|                1x1|                1x1|
|___________|___________________|___________________|
|       West|                1x1|                2x2|
|___________|___________________|___________________|
Z30-612h px� 
X
%s*common2?
=Phase 4.3.1 Print Estimated Congestion | Checksum: 1737c991a
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:13 ; elapsed = 00:01:27 . Memory (MB): peak = 3225.566 ; gain = 94.855 ; free physical = 5880 ; free virtual = 10920h px� 
L
%s*common23
1Phase 4.3 Placer Reporting | Checksum: 1737c991a
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:14 ; elapsed = 00:01:27 . Memory (MB): peak = 3225.566 ; gain = 94.855 ; free physical = 5880 ; free virtual = 10920h px� 
V

Phase %s%s
101*constraints2
4.4 2
Final Placement CleanupZ18-101h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2
00:00:00.012

00:00:002

3225.5662
0.0002
58802
10920Z17-722h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:14 ; elapsed = 00:01:27 . Memory (MB): peak = 3225.566 ; gain = 94.855 ; free physical = 5880 ; free virtual = 10920h px� 
b
%s*common2I
GPhase 4 Post Placement Optimization and Clean-Up | Checksum: 133d74e69
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:14 ; elapsed = 00:01:28 . Memory (MB): peak = 3225.566 ; gain = 94.855 ; free physical = 5880 ; free virtual = 10920h px� 
C
%s*common2*
(Ending Placer Task | Checksum: b09396e8
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:14 ; elapsed = 00:01:28 . Memory (MB): peak = 3225.566 ; gain = 94.855 ; free physical = 5880 ; free virtual = 10920h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
832
12
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
place_designZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
place_design: 2

00:02:192

00:01:302

3225.5662	
179.1372
58802
10920Z17-722h px� 
�
)Running report commands "%s" in parallel.56334*	planAhead24
2report_control_sets, report_io, report_utilizationZ12-24838h px� 
Y
+Running report generation with %s threads.
56333*	planAhead2
3Z12-24831h px� 
�
Executing command : %s
56330*	planAhead2K
Ireport_control_sets -verbose -file system_wrapper_control_sets_placed.rptZ12-24828h px� 
�
�report_control_sets: Time (s): cpu = 00:00:00.28 ; elapsed = 00:00:00.3 . Memory (MB): peak = 3225.566 ; gain = 0.000 ; free physical = 5887 ; free virtual = 10927
*commonh px� 
p
Executing command : %s
56330*	planAhead2.
,report_io -file system_wrapper_io_placed.rptZ12-24828h px� 
�
�report_io: Time (s): cpu = 00:00:00.34 ; elapsed = 00:00:00.31 . Memory (MB): peak = 3225.566 ; gain = 0.000 ; free physical = 5879 ; free virtual = 10919
*commonh px� 
�
Executing command : %s
56330*	planAhead2i
greport_utilization -file system_wrapper_utilization_placed.rpt -pb system_wrapper_utilization_placed.pbZ12-24828h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Write ShapeDB Complete: 2
00:00:00.232
00:00:00.072

3225.5662
0.0002
58672
10916Z17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Wrote PlaceDB: 2

00:00:022

00:00:012

3225.5662
0.0002
58232
10902Z17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Wrote PulsedLatchDB: 2

00:00:002

00:00:002

3225.5662
0.0002
58232
10902Z17-722h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Wrote RouteStorage: 2
00:00:00.042

00:00:002

3225.5662
0.0002
58152
10894Z17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Wrote Netlist Cache: 2
00:00:00.012

00:00:002

3225.5662
0.0002
58152
10896Z17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Wrote Device Cache: 2

00:00:002

00:00:002

3225.5662
0.0002
58072
10888Z17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Write Physdb Complete: 2

00:00:022

00:00:012

3225.5662
0.0002
58072
10888Z17-722h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2Y
W/home/andrew/eclypse-z7-notes/tmp/sdr_transceiver.runs/impl_1/system_wrapper_placed.dcpZ17-1381h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
write_checkpoint: 2

00:00:102

00:00:052

3225.5662
0.0002
58092
10859Z17-722h px� 


End Record