
Y
Command: %s
53*	vivadotcl2(
&opt_design -directive ExploreWithRemapZ4-113h px� 
[
$Directive used for opt_design is: %s67*	vivadotcl2
ExploreWithRemapZ4-136h px� 
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
\
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_designZ4-22h px� 
@

Starting %s Task
103*constraints2
DRCZ18-103h px� 
>
Running DRC with %s threads
24*drc2
8Z23-27h px� 
P
DRC finished with %s
272*project2
0 Errors, 27 WarningsZ1-461h px� 
d
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.76 . Memory (MB): peak = 2330.285 ; gain = 2.969 ; free physical = 6737 ; free virtual = 11724h px� 
O

Starting %s Task
103*constraints2
Logic OptimizationZ18-103h px� 
K

Phase %s%s
101*constraints2
1 2
InitializationZ18-101h px� 
_

Phase %s%s
101*constraints2
1.1 2"
 Core Generation And Design SetupZ18-101h px� 
\
%s*common2C
APhase 1.1 Core Generation And Design Setup | Checksum: 1e73d69b2
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.05 ; elapsed = 00:00:00.08 . Memory (MB): peak = 2573.184 ; gain = 0.000 ; free physical = 6478 ; free virtual = 11466h px� 
a

Phase %s%s
101*constraints2
1.2 2$
"Setup Constraints And Sort NetlistZ18-101h px� 
^
%s*common2E
CPhase 1.2 Setup Constraints And Sort Netlist | Checksum: 1e73d69b2
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.06 ; elapsed = 00:00:00.11 . Memory (MB): peak = 2573.184 ; gain = 0.000 ; free physical = 6478 ; free virtual = 11466h px� 
H
%s*common2/
-Phase 1 Initialization | Checksum: 1e73d69b2
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.06 ; elapsed = 00:00:00.14 . Memory (MB): peak = 2573.184 ; gain = 0.000 ; free physical = 6478 ; free virtual = 11466h px� 
d

Phase %s%s
101*constraints2
2 2)
'Timer Update And Timing Data CollectionZ18-101h px� 
K

Phase %s%s
101*constraints2
2.1 2
Timer UpdateZ18-101h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
H
%s*common2/
-Phase 2.1 Timer Update | Checksum: 1e73d69b2
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:04 ; elapsed = 00:00:02 . Memory (MB): peak = 2637.996 ; gain = 64.812 ; free physical = 6448 ; free virtual = 11435h px� 
U

Phase %s%s
101*constraints2
2.2 2
Timing Data CollectionZ18-101h px� 
R
%s*common29
7Phase 2.2 Timing Data Collection | Checksum: 1e73d69b2
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:04 ; elapsed = 00:00:02 . Memory (MB): peak = 2637.996 ; gain = 64.812 ; free physical = 6440 ; free virtual = 11427h px� 
a
%s*common2H
FPhase 2 Timer Update And Timing Data Collection | Checksum: 1e73d69b2
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:04 ; elapsed = 00:00:02 . Memory (MB): peak = 2637.996 ; gain = 64.812 ; free physical = 6440 ; free virtual = 11427h px� 
E

Phase %s%s
101*constraints2
3 2

RetargetZ18-101h px� 
V
1Number of loadless carry chains removed were: %s
839*opt2
0Z31-1851h px� 
�
XTotal Chains To Be Transformed Were: %s AND Number of Transformed insts Created are: %s
832*opt2
02
0Z31-1834h px� 
c
9Pulled %s inverters resulting in an inversion of %s pins
779*opt2
22
2Z31-1566h px� 
S
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
142
92Z31-138h px� 
9
Retargeted %s cell(s).
49*opt2
0Z31-49h px� 
B
%s*common2)
'Phase 3 Retarget | Checksum: 1b3c12450
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:05 ; elapsed = 00:00:03 . Memory (MB): peak = 2637.996 ; gain = 64.812 ; free physical = 6440 ; free virtual = 11427h px� 
4
Retarget | Checksum: 1b3c12450
*commonh px� 
e
.Phase %s created %s cells and removed %s cells267*opt2

Retarget2
42
260Z31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2

Retarget2
1Z31-1021h px� 
Q

Phase %s%s
101*constraints2
4 2
Constant propagationZ18-101h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
N
%s*common25
3Phase 4 Constant propagation | Checksum: 1fca70a5f
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:06 ; elapsed = 00:00:04 . Memory (MB): peak = 2637.996 ; gain = 64.812 ; free physical = 6440 ; free virtual = 11427h px� 
@
+Constant propagation | Checksum: 1fca70a5f
*commonh px� 
u
.Phase %s created %s cells and removed %s cells267*opt2
Constant propagation2
39262
4356Z31-389h px� 
B

Phase %s%s
101*constraints2
5 2
SweepZ18-101h px� 
b
2Building netlist checker database with flags, 0x%s23991*constraints2
8Z18-11670h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2*
(Done building netlist checker database: 2
00:00:00.012
00:00:00.012

2637.9962
0.0002
64402
11427Z17-722h px� 
b
2Building netlist checker database with flags, 0x%s23991*constraints2
8Z18-11670h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2*
(Done building netlist checker database: 2
00:00:00.012

00:00:002

2637.9962
0.0002
64402
11427Z17-722h px� 
?
%s*common2&
$Phase 5 Sweep | Checksum: 1ecfe8dee
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:07 ; elapsed = 00:00:05 . Memory (MB): peak = 2637.996 ; gain = 64.812 ; free physical = 6440 ; free virtual = 11427h px� 
1
Sweep | Checksum: 1ecfe8dee
*commonh px� 
b
.Phase %s created %s cells and removed %s cells267*opt2
Sweep2
02
218Z31-389h px� 
N

Phase %s%s
101*constraints2
6 2
BUFG optimizationZ18-101h px� 
K
%s*common22
0Phase 6 BUFG optimization | Checksum: 1ecfe8dee
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:07 ; elapsed = 00:00:05 . Memory (MB): peak = 2670.012 ; gain = 96.828 ; free physical = 6440 ; free virtual = 11427h px� 
=
(BUFG optimization | Checksum: 1ecfe8dee
*commonh px� 
�
EPhase %s created %s cells of which %s are BUFGs and removed %s cells.395*opt2
BUFG optimization2
02
02
0Z31-662h px� 
X

Phase %s%s
101*constraints2
7 2
Shift Register OptimizationZ18-101h px� 
�
dSRL Remap converted %s SRLs to %s registers and converted %s registers of register chains to %s SRLs546*opt2
02
02
02
0Z31-1064h px� 
U
%s*common2<
:Phase 7 Shift Register Optimization | Checksum: 162ec4c02
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:08 ; elapsed = 00:00:06 . Memory (MB): peak = 2670.012 ; gain = 96.828 ; free physical = 6440 ; free virtual = 11427h px� 
G
2Shift Register Optimization | Checksum: 162ec4c02
*commonh px� 
z
.Phase %s created %s cells and removed %s cells267*opt2
Shift Register Optimization2
4542
908Z31-389h px� 
s
Jcontrol_set_opt supports Versal devices only, and device %s is unsupported769*opt2
7z020Z31-1555h px� 
B

Phase %s%s
101*constraints2
8 2
RemapZ18-101h px� 
?
%s*common2&
$Phase 8 Remap | Checksum: 12da078e6
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:13 ; elapsed = 00:00:11 . Memory (MB): peak = 2981.980 ; gain = 408.797 ; free physical = 6039 ; free virtual = 11059h px� 
1
Remap | Checksum: 12da078e6
*commonh px� 
d
.Phase %s created %s cells and removed %s cells267*opt2
Remap2
4332
688Z31-389h px� 
T

Phase %s%s
101*constraints2
9 2
Post Processing NetlistZ18-101h px� 
Q
%s*common28
6Phase 9 Post Processing Netlist | Checksum: 1437f3dcb
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:13 ; elapsed = 00:00:11 . Memory (MB): peak = 2981.980 ; gain = 408.797 ; free physical = 6039 ; free virtual = 11059h px� 
C
.Post Processing Netlist | Checksum: 1437f3dcb
*commonh px� 
r
.Phase %s created %s cells and removed %s cells267*opt2
Post Processing Netlist2
02
0Z31-389h px� 
J

Phase %s%s
101*constraints2
10 2
FinalizationZ18-101h px� 
k

Phase %s%s
101*constraints2
10.1 2-
+Finalizing Design Cores and Updating ShapesZ18-101h px� 
h
%s*common2O
MPhase 10.1 Finalizing Design Cores and Updating Shapes | Checksum: 1aa3cb5fa
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:14 ; elapsed = 00:00:13 . Memory (MB): peak = 2981.980 ; gain = 408.797 ; free physical = 6039 ; free virtual = 11059h px� 
^

Phase %s%s
101*constraints2
10.2 2 
Verifying Netlist ConnectivityZ18-101h px� 
O

Starting %s Task
103*constraints2
Connectivity CheckZ18-103h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.06 ; elapsed = 00:00:00.05 . Memory (MB): peak = 2981.980 ; gain = 0.000 ; free physical = 6039 ; free virtual = 11059h px� 
[
%s*common2B
@Phase 10.2 Verifying Netlist Connectivity | Checksum: 1aa3cb5fa
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:14 ; elapsed = 00:00:13 . Memory (MB): peak = 2981.980 ; gain = 408.797 ; free physical = 6039 ; free virtual = 11059h px� 
G
%s*common2.
,Phase 10 Finalization | Checksum: 1aa3cb5fa
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:14 ; elapsed = 00:00:13 . Memory (MB): peak = 2981.980 ; gain = 408.797 ; free physical = 6039 ; free virtual = 11059h px� 
/
Opt_design Change Summary
*commonh px� 
/
=========================
*commonh px� 


*commonh px� 


*commonh px� 
�
z-------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Phase                        |  #Cells created  |  #Cells Removed  |  #Constrained objects preventing optimizations  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Retarget                     |               4  |             260  |                                              1  |
|  Constant propagation         |            3926  |            4356  |                                              0  |
|  Sweep                        |               0  |             218  |                                              0  |
|  BUFG optimization            |               0  |               0  |                                              0  |
|  Shift Register Optimization  |             454  |             908  |                                              0  |
|  Remap                        |             433  |             688  |                                              0  |
|  Post Processing Netlist      |               0  |               0  |                                              0  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
P
%s*common27
5Ending Logic Optimization Task | Checksum: 1aa3cb5fa
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:14 ; elapsed = 00:00:13 . Memory (MB): peak = 2981.980 ; gain = 408.797 ; free physical = 6039 ; free virtual = 11059h px� 
P

Starting %s Task
103*constraints2
Netlist ObfuscationZ18-103h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2
00:00:00.012
00:00:00.012

2981.9802
0.0002
60392
11059Z17-722h px� 
Q
%s*common28
6Ending Netlist Obfuscation Task | Checksum: 1aa3cb5fa
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.03 . Memory (MB): peak = 2981.980 ; gain = 0.000 ; free physical = 6039 ; free virtual = 11059h px� 
H
Releasing license: %s
83*common2
ImplementationZ17-83h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
392
12
02
0Z4-41h px� 
J
%s completed successfully
29*	vivadotcl2

opt_designZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
opt_design: 2

00:00:192

00:00:162

2981.9802	
654.6642
60392
11059Z17-722h px� 
�
Executing command : %s
56330*	planAhead2q
oreport_drc -file system_wrapper_drc_opted.rpt -pb system_wrapper_drc_opted.pb -rpx system_wrapper_drc_opted.rpxZ12-24828h px� 
�
Command: %s
53*	vivadotcl2q
oreport_drc -file system_wrapper_drc_opted.rpt -pb system_wrapper_drc_opted.pb -rpx system_wrapper_drc_opted.rpxZ4-113h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
>
Running DRC with %s threads
24*drc2
8Z23-27h px� 
�
#The results of DRC are in file %s.
586*	vivadotcl2�
Z/home/andrew/eclypse-z7-notes/tmp/sdr_transceiver.runs/impl_1/system_wrapper_drc_opted.rptZ/home/andrew/eclypse-z7-notes/tmp/sdr_transceiver.runs/impl_1/system_wrapper_drc_opted.rpt8Z2-168h px� 
J
%s completed successfully
29*	vivadotcl2

report_drcZ4-42h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Wrote PlaceDB: 2
00:00:00.042
00:00:00.012

3008.7622
2.9692
60292
11051Z17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Wrote PulsedLatchDB: 2

00:00:002

00:00:002

3008.7622
0.0002
60292
11051Z17-722h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Write ShapeDB Complete: 2
00:00:00.262
00:00:00.072

3022.4182
16.6252
60012
11028Z17-722h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Wrote RouteStorage: 2
00:00:00.252
00:00:00.062

3022.4182
13.6562
59932
11021Z17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Wrote Netlist Cache: 2
00:00:00.022

00:00:002

3022.4182
0.0002
59932
11021Z17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Wrote Device Cache: 2
00:00:00.012
00:00:00.022

3022.4182
0.0002
59912
11020Z17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Write Physdb Complete: 2
00:00:00.332
00:00:00.092

3022.4182
16.6252
59912
11020Z17-722h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2V
T/home/andrew/eclypse-z7-notes/tmp/sdr_transceiver.runs/impl_1/system_wrapper_opt.dcpZ17-1381h px� 


End Record