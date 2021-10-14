#!/bin/bash
source /usr/local/gromacs2019/bin/GMXRC
toilet -f mono12 -F metal MDA

if [ ! -f MD_Traj_Protein ]; then
mkdir MD_Traj_Protein
cd MD_Traj_Protein
fi

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+   Type the name of the PDB (without extension)!!!   +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ List of PDBs @"
ls -lh ../*.pdb
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ Type PDB name : "; read pdb

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+   Type the name of the EM (without extension)!!!   +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ List of EMs @"
ls -lh ../em*.tpr
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ Type EM name : "; read EM

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+   Type the name of the MD 25ns (without extension)!!!   +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ List of MDs @"
ls -lh ../md*.tpr
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ Type MD name : "; read MDtpr

:'
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+                Length of second extention (ns)      +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
ls -lh ../*.tpr
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ length : "; read n_one

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+                Length of third  extention (ns)      +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
ls -lh ../*.tpr
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ length : "; read n_two

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+                Length of fourth  extention (ns)      +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
ls -lh ../*.tpr
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ length : "; read n_three
'
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+                Total Length of trajectory (ns)      +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
ls -lh ../*.tpr
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ length : "; read n_three

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+                     Title for PDB                   +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+   For Example:   PDB ID                             +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ Title : "; read TITLE

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+                   sub Title for PDB                 +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+   For Example:    APO                               +"
echo "+   For Example:    {/Symbol b}CTT                    +"
echo "+   For Example:    {/Symbol a}CTT                    +"
echo "+   For Example:    ATP                               +"
echo "+   For Example:    {/Symbol b}CTT + ATP              +"
echo "+   For Example:    {/Symbol a}CTT + ATP              +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ subTitle : "; read subTITLE

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+   Type the name of the nvt xtc (without extension)!!!   +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ List of XTC @"
ls -lh ../nvt*.xtc
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ Type XTC name : "; read xtc_nvt

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+   Type the name of the npt xtc (without extension)!!!   +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ List of XTC @"
ls -lh ../npt*.xtc
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ Type XTC name : "; read xtc_npt

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+   Type the name of the md trp 50ns (without extension)!!!   +"
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ List of tpr @"
ls -lh ../md*.tpr
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "		@ Type TPR name : "; read MD

#xtc=../$xtc.xtc
xtc_nvt=../$xtc_nvt.xtc
xtc_npt=../$xtc_npt.xtc
tpr=../$MDtpr.tpr
gro=../$MDtpr.gro
ndx=../index_residue.ndx

rm $ndx
if [ ! -f $ndx ]; then
    echo "File index_residue.ndx not found!"
gmx make_ndx -f $gro -o $ndx << EOF
a 1-18315

1 & a 418-613
1 & a 3401-3596
1 & a 6384-6579
1 & a 9367-9562
1 & a 12350-12545
1 & a 15333-15528

1 & a 873-970
1 & a 3856-3953
1 & a 6839-6936
1 & a 9822-9919
1 & a 12805-12902
1 & a 15788-15885

1 & a 2364-2571
1 & a 5347-5554
1 & a 8330-8537
1 & a 11313-11520
1 & a 14296-14503
1 & a 17279-17486

1 & a 13 928
1 & a 2996 3911
1 & a 5979 6894
1 & a 8962 9877
1 & a 11945 12860
1 & a 14928 15843

1 & a 928 2499
1 & a 3911 5482
1 & a 6894 8465
1 & a 9877 11448
1 & a 12860 14431
1 & a 15843 17414

1 & a 2499 5482
1 & a 5482 8465
1 & a 8465 11448
1 & a 11448 14431
1 & a 14431 17414
1 & a 2499 17414

1 & a 928 3911 
1 & a 3911 6894
1 & a 6894 9877
1 & a 9877 12860
1 & a 12860 15843
1 & a 15843 928

1 & a 1275 4258
1 & a 4258 7241
1 & a 7241 10224
1 & a 10224 13207
1 & a 13207 16190
1 & a 16190 1275

1 & a 928 9877 
1 & a 3911 12860
1 & a 6894 15843

1 & a 535 928
1 & a 3518 3911
1 & a 6501 6894
1 & a 9484 9877
1 & a 12467 12860
1 & a 15450 15843

a 2576 11552
a 5568 14544
a 8560 17536

1 & a 928 1275
1 & a 3911 4258
1 & a 6894 7241
1 & a 9877 10224
1 & a 12860 13207
1 & a 15843 16190 

1 & a 1275 10224
1 & a 4258 13207
1 & a 7241 16190

a 2548 722 1036
a 5531 3705 4019
a 8541 6688 7002
a 11497 9671 9985
a 14480 12654 12968
a 17463 15637 15951

1 & a 1326 10275
1 & a 4309 13258
1 & a 7292 16241

q
EOF
fi

Pro_ATP="a_1-18315";
##########################
#For Residue range 500-520
##########################
aone="Protein_&_a_418-613"; bone="Protein_&_a_3401-3596"; cone="Protein_&_a_6384-6579"; done="Protein_&_a_9367-9562"; eone="Protein_&_a_12350-12545"; fone="Protein_&_a_15333-15528";
##########################
#For Residue range 550-560
##########################
atwo="Protein_&_a_873-970"; btwo="Protein_&_a_3856-3953"; ctwo="Protein_&_a_6839-6936"; dtwo="Protein_&_a_9822-9919"; etwo="Protein_&_a_12805-12902"; ftwo="Protein_&_a_15788-15885";
##########################
#For Residue range 700-720
##########################
athree="Protein_&_a_2364-2571"; bthree="Protein_&_a_5347-5554"; cthree="Protein_&_a_8330-8537"; dthree="Protein_&_a_11313-11520"; ethree="Protein_&_a_14296-14503"; fthree="Protein_&_a_17279-17486";
#####################################
#For RESID pair 456CA-556CA atom for each chain
#####################################
ant_ap1="Protein_&_a_13_928"; bnt_bp1="Protein_&_a_2996_3911"; cnt_cp1="Protein_&_a_5979_6894"; dnt_dp1="Protein_&_a_8962_9877"; ent_ep1="Protein_&_a_11945_12860"; fnt_fp1="Protein_&_a_14928_15843";
#####################################
#For RESID pair 556CA-713CA atom for each chain
#####################################
ap1_Act="Protein_&_a_928_2499"; bp1_Bct="Protein_&_a_3911_5482"; cp1_Cct="Protein_&_a_6894_8465"; dp1_Dct="Protein_&_a_9877_11448"; ep1_Ect="Protein_&_a_12860_14431"; fp1_Fct="Protein_&_a_15843_17414";
#####################################
#For RESID 713CA-713CAi atom
#####################################
Act_Bct="Protein_&_a_2499_5482"; Bct_Cct="Protein_&_a_5482_8465"; Cct_Dct="Protein_&_a_8465_11448"; Dct_Ect="Protein_&_a_11448_14431"; Ect_Fct="Protein_&_a_14431_17414"; Act_Fct="Protein_&_a_2499_17414";
#####################################
#For RESID 556CA-556CAi atom 
#####################################
ap1_bp1="Protein_&_a_928_3911"; bp1_cp1="Protein_&_a_3911_6894"; cp1_dp1="Protein_&_a_6894_9877"; dp1_ep1="Protein_&_a_9877_12860"; ep1_fp1="Protein_&_a_12860_15843"; fp1_ap1="Protein_&_a_15843_928"; 
#####################################
#For RESID R591CA-R591CAi atom 
#####################################
ap2_bp2="Protein_&_a_1275_4258"; bp2_cp2="Protein_&_a_4258_7241"; cp2_dp2="Protein_&_a_7241_10224"; dp2_ep2="Protein_&_a_10224_13207"; ep2_fp2="Protein_&_a_13207_16190"; fp2_ap2="Protein_&_a_16190_1275"; 
#####################################
#For RESID 556CA-556CAopp atom
##################################### 
ap1_dp1="Protein_&_a_928_9877"; bp1_ep1="Protein_&_a_3911_12860"; cp1_fp1="Protein_&_a_6894_15843";
#For RESID 512CA-556CA atom 
#####################################
ant3_ap1="Protein_&_a_535_928"; bnt3_bp1="Protein_&_a_3518_3911"; cnt3_cp1="Protein_&_a_6501_6894"; dnt3_dp1="Protein_&_a_9484_9877"; ent3_ep1="Protein_&_a_12467_12860"; fnt3_fp1="Protein_&_a_15450_15843"; 
#####################################
#For distance of residues (Y556Ca-R591Ca)
#####################################
ap1_ap2="a_928_1275"; bp1_bp2="a_3911_4258"; cp1_cp2="a_6894_7241"; dp1_dp2="a_9877_10224"; ep1_ep2="a_12860_13207"; fp1_fp2="a_15843_16190";
#####################################
#For distance of digonally exposed residues (ALA718-ALA718)
#####################################
aexpo_dexpo="a_2576_11552"; bexpo_eexpo="a_5568_14544"; cexpo_fexpo="a_8560_17536";
#####################################
#For RESID 596CA-596CAopp atom (H596-H596)
#####################################
ap2H_dp2H="a_1326_10275"; bp2H_ep2H="a_4309_13258"; cp2H_fp2H="a_7292_16241";
#####################################
#For RESID 591CA-591CAopp atom 
#####################################
ap2_dp2="a_1275_10224"; bp2_ep2="a_4258_13207"; cp2_fp2="a_7241_16190";
#####################################
#For Angles
#####################################
angleone=a_2548_722_1036; angletwo=a_5531_3705_4019; anglethree=a_8541_6688_7002; anglefour=a_11497_9671_9985; anglefive=a_14480_12654_12968; anglesix=a_17463_15637_15951;
############
p="500-520"; q="550-560"; r="700-720";
############

#############################################################
##### Extract only protein and Concatenate all the xtc ###### # Create output to upload in VMD
if [ ! -f $EM-protein.gro ]; then
    echo "File $EM-protein.gro not found!"
gmx trjconv -s ../$EM.tpr -f ../$EM.gro -o $EM-protein.gro -n $ndx -pbc mol -center <<EOL
$Pro_ATP
$Pro_ATP
EOL

gmx trjconv -s ../$EM.tpr -f ../$EM.gro -o $EM-protein.pdb -n $ndx -pbc mol -center <<EOL
$Pro_ATP
$Pro_ATP
EOL
fi
######
if [ ! -f $MDtpr-protein.gro ]; then
    echo "File $MDtpr-protein.gro not found!"
gmx trjconv -s ../$MDtpr.tpr -f ../$MDtpr.gro -o $MDtpr-protein.gro -n $ndx -pbc mol -center <<EOL
$Pro_ATP
$Pro_ATP
EOL
fi
######
:"
if [ -f ../traj_comp.part0002.xtc ]; then
   if [ ! -f md-$pdb-protein.xtc ]; then
    rm md-$pdb-protein.xtc
    gmx trjconv -s ../md-$pdb.tpr              -f ../md-$pdb.xtc            -o md-$pdb-protein.xtc -n $ndx              -pbc mol -center <<EOL
Protein
Protein
EOL
    gmx trjconv -s ../md-$pdb-extend$n_one.tpr -f ../traj_comp.part0002.xtc -o md-$pdb-extend$n_one-protein.xtc -n $ndx -pbc mol -center <<EOL
Protein
Protein
EOL
    gmx trjconv -s ../md-$pdb-extend$n_two.tpr     -f ../traj_comp.part0003.xtc -o md-$pdb-extend$n_two-protein.xtc -n $ndx     -pbc mol -center <<EOL
Protein
Protein
EOL
    gmx trjconv -s ../md-$pdb-extend$n_three.tpr     -f ../traj_comp.part0004.xtc -o md-$pdb-extend$n_three-protein.xtc -n $ndx     -pbc mol -center <<EOL
Protein
Protein
EOL
    gmx trjcat -f md-$pdb-protein.xtc md-$pdb-extend$n_one-protein.xtc md-$pdb-extend$n_two-protein.xtc md-$pdb-extend$n_three-protein.xtc -o md-$pdb-complete$n_three-protein.xtc
fi
    elif [ ! -f ../traj_comp.part0002.xtc ]; then
		if [ ! -f md-$pdb-complete$n_three-protein.xtc ]; then
    gmx trjconv -s ../md-$pdb.tpr              -f ../md-$pdb.xtc            -o md-$pdb-complete$n_three-protein.xtc -n $ndx              -pbc mol -center <<EOL
Protein
Protein
EOL
fi
fi
"
if [ ! -f $MD-complete$n_three-protein.xtc ]; then
    gmx trjconv -s ../$MD.tpr              -f ../$MD.xtc            -o $MD-complete$n_three-protein.xtc -n $ndx              -pbc mol -center <<EOL
Protein
Protein
EOL
fi
#############################################################################
rm index.ndx
#make index for backbone and c-alpha atoms for each chain and for ABC and DEF
gmx make_ndx -f $gro -o index.ndx << EOL
4 & a 1-8949
4 & a 8950-17898
3 & a 1-8949
3 & a 8977-17898
4 & a 1-2983
4 & a 2984-5966
4 & a 5967-8949
4 & a 8950-11932
4 & a 11933-14915
4 & a 14916-17898
3 & a 1-2983
3 & a 2984-5966
3 & a 5967-8949
3 & a 8950-11932
3 & a 11933-14915
3 & a 14916-17898
q
EOL

#Reduce the number of frames
if [ ! -f $MD-reduced$n-protein.xtc ]; then
gmx trjconv -f $MD-complete$n_three-protein.xtc -o $MD-reduced$n-protein.xtc -skip 10
fi
####
if [ ! -f $MD-protein.gro ]; then
    echo "File $MD-protein.gro not found!"
gmx trjconv -s ../$MD.tpr -f ../$MD.gro -o $MD-protein.gro -n index.ndx -pbc mol -center <<EOL
Protein
Protein
EOL
fi

#############################################################################
mkdir DISTANCE
cd DISTANCE		#path=MD_Traj_Protein/DISTANCE
#++++++++++++++++++++++++++ Distance Y556_Y556-R591_R591++++++++++++++++++++++++++++++
if [ ! -f Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg ]; then
    echo "File Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg not found!"
gmx distance -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -oall Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg -tu ns -n ../$ndx <<EOL
"$ap1_bp1"
"$bp1_cp1"
"$cp1_dp1"
"$dp1_ep1"
"$ep1_fp1"
"$fp1_ap1"
"$ap2_bp2"
"$bp2_cp2"
"$cp2_dp2"
"$dp2_ep2"
"$ep2_fp2"
"$fp2_ap2"
EOL
fi
#++++++++++++++++++++++++++ Distance Y556_Y556 diagonal ++++++++++++++++++++++++++++++
ap1_dp1="Protein_&_a_928_9877"; bp1_ep1="Protein_&_a_3911_12860"; cp1_fp1="Protein_&_a_6894_15843";
if [ ! -f Y556_Y556_dgnl_$pdb-$n_three-ns.xvg ]; then
    echo "File Y556_Y556_dgnl_$pdb-$n_three-ns.xvg not found!"
gmx distance -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -oall Y556_Y556_dgnl_$pdb-$n_three-ns.xvg -tu ns -n ../$ndx <<EOL
"$ap1_dp1"
"$bp1_ep1"
"$cp1_fp1"
EOL
fi
#++++++++++++++++++++++++++ Distance Y556_C713 ++++++++++++++++++++++++++++++
if [ ! -f Y556_C713_$pdb-$n_three-ns.xvg ]; then
    echo "File Y556_C713_$pdb-$n_three-ns.xvg not found!"
gmx distance -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -oall Y556_C713_$pdb-$n_three-ns.xvg -tu ns -n ../$ndx <<EOL
"$ap1_Act"
"$bp1_Bct"
"$cp1_Cct"
"$dp1_Dct"
"$ep1_Ect"
"$fp1_Fct"
EOL
fi

#++++++++++++++++++++++++++ Distance C713_C713 ++++++++++++++++++++++++++++++
if [ ! -f C713_C713_$pdb-$n_three-ns.xvg ]; then
    echo "File C713_C713_$pdb-$n_three-ns.xvg not found!"
gmx distance -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -oall C713_C713_$pdb-$n_three-ns.xvg -tu ns -n ../$ndx <<EOL
"$Act_Bct"
"$Bct_Cct"
"$Cct_Dct"
"$Dct_Ect"
"$Ect_Fct"
"$Act_Fct"
EOL
fi

#++++++++++++++++++++++++++ Distance V456_Y556 ++++++++++++++++++++++++++++++
if [ ! -f V456_Y556_$pdb-$n_three-ns.xvg ]; then
    echo "File V456_Y556_$pdb-$n_three-ns.xvg not found!"
gmx distance -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -oall V456_Y556_$pdb-$n_three-ns.xvg -tu ns -n ../$ndx <<EOL
"$ant_ap1"
"$bnt_bp1"
"$cnt_cp1"
"$dnt_dp1"
"$ent_ep1"
"$fnt_fp1"
EOL
fi

#++++++++++++++++++++++++++ Distance L512_Y556 ++++++++++++++++++++++++++++++
if [ ! -f L512_Y556_$pdb-$n_three-ns.xvg ]; then
    echo "File L512_Y556_$pdb-$n_three-ns.xvg not found!"
gmx distance -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -oall L512_Y556_$pdb-$n_three-ns.xvg -tu ns -n ../$ndx <<EOL
"$ant3_ap1"
"$bnt3_bp1"
"$cnt3_cp1"
"$dnt3_dp1"
"$ent3_ep1"
"$fnt3_fp1"
EOL
fi

#++++++++++++++++++++++++++ Distance A718-A718 ++++++++++++++++++++++++++++++
if [ ! -f A718_A718_dgnl_$pdb-$n_three-ns.xvg ]; then
    echo "File A718_A718_dgnl_$pdb-$n_three-ns.xvg not found!"
gmx distance -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -oall A718_A718_dgnl_$pdb-$n_three-ns.xvg -tu ns -n ../$ndx <<EOL
"$aexpo_dexpo"
"$bexpo_eexpo"
"$cexpo_fexpo"
EOL
fi

#++++++++++++++++++++++++++ Distance Y556-R591 ++++++++++++++++++++++++++++++
if [ ! -f Y556-R591_$pdb-$n_three-ns.xvg ]; then
    echo "File Y556-R591_$pdb-$n_three-ns.xvg not found!"
gmx distance -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -oall Y556-R591_$pdb-$n_three-ns.xvg -tu ns -n ../$ndx <<EOL
"$ap1_ap2"
"$bp1_bp2"
"$cp1_cp2"
"$dp1_dp2"
"$ep1_ep2"
"$fp1_fp2"
EOL
fi

#++++++++++++++++++++++++++ Diagonal Distance correlation between Y556-Y556 and R591-R591 ++++++++++++++++++++++++++++++
if [ ! -f Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg ]; then
    echo "File Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg not found!"
gmx distance -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -oall Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg -tu ns -n ../$ndx <<EOL
"$ap1_dp1"
"$bp1_ep1"
"$cp1_fp1"
"$ap2_dp2"
"$bp2_ep2"
"$cp2_fp2"
EOL
fi

#++++++++++++++++++++++++++ Diagonal Distance correlation between Y556-Y556 and A718-A718 ++++++++++++++++++++++++++++++
if [ ! -f Y556_A718_dgnl_corrl_$pdb-$n_three-ns.xvg ]; then
    echo "File Y556_A718_dgnl_corrl_$pdb-$n_three-ns.xvg not found!"
gmx distance -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -oall Y556_A718_dgnl_corrl_$pdb-$n_three-ns.xvg -tu ns -n ../$ndx <<EOL
"$ap1_dp1"
"$bp1_ep1"
"$cp1_fp1"
"$aexpo_dexpo"
"$bexpo_eexpo"
"$cexpo_fexpo"
EOL
fi

#++++++++++++++++++++++++++ Diagonal Distance correlation between Y556-Y556 and H596-H596 ++++++++++++++++++++++++++++++
if [ ! -f Y556_H596_dgnl_corrl_$pdb-$n_three-ns.xvg ]; then
    echo "File Y556_H596_dgnl_corrl_$pdb-$n_three-ns.xvg not found!"
gmx distance -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -oall Y556_H596_dgnl_corrl_$pdb-$n_three-ns.xvg -tu ns -n ../$ndx <<EOL
"$ap1_dp1"
"$bp1_ep1"
"$cp1_fp1"
"$ap2H_dp2H"
"$bp2H_ep2H"
"$cp2H_fp2H"
EOL
fi

########################################################
########################################################
toilet -f mono12 -F metal DISTANCE
########################################################
################# Distance Plots #######################
gnuplot <<EOL
reset
set terminal pngcairo  background "#ffffff" enhanced font "arial-Bold,18" fontscale 1.0 size 1080, 768 
set key on b c inside horizontal
set output 'Distance_Y556-Y556-$pdb-$n_three.png'
set title "Distance : Y556-Y556 ($n_three ns)\n{/*0.5 $TITLE + $subTITLE}"
set xlabel "Time (ns)"
set ylabel "Distance (\305)"
set grid
set style function linespoints
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 6 dt 1 pi 0 ps 1
set style line 5  lt 7 dt 1 pi 0 ps 1
set style line 6  lt 8 dt 1 pi 0 ps 1
set style line 7  lt 9 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u 1:(column(2)*10) name "AB"
stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u 1:(column(3)*10) name "BC"
stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u 1:(column(4)*10) name "CD"
stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u 1:(column(5)*10) name "DE"
stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u 1:(column(6)*10) name "EF"
stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u 1:(column(7)*10) name "AF"
set bmargin 5
set label 10 sprintf("%.4f", AB_min_y) center at graph 0.14,-0.17  point pt 7 ps 0  tc lt "1"
set label 11 sprintf("%.4f", AB_max_y) center at graph 0.14,-0.21  point pt 7 ps 0  tc lt "1"
set label 12 sprintf("%.4f", BC_min_y) center at graph 0.28,-0.17  point pt 7 ps 0  tc lt "2"
set label 13 sprintf("%.4f", BC_max_y) center at graph 0.28,-0.21  point pt 7 ps 0  tc lt "2"
set label 14 sprintf("%.4f", CD_min_y) center at graph 0.42,-0.17  point pt 7 ps 0  tc lt "4"
set label 15 sprintf("%.4f", CD_max_y) center at graph 0.42,-0.21  point pt 7 ps 0  tc lt "4"
set label 16 sprintf("%.4f", DE_min_y) center at graph 0.56,-0.17  point pt 7 ps 0  tc lt "6"
set label 17 sprintf("%.4f", DE_max_y) center at graph 0.56,-0.21  point pt 7 ps 0  tc lt "6"
set label 18 sprintf("%.4f", EF_min_y) center at graph 0.70,-0.17  point pt 7 ps 0  tc lt "7"
set label 19 sprintf("%.4f", EF_max_y) center at graph 0.70,-0.21  point pt 7 ps 0  tc lt "7"
set label 20 sprintf("%.4f", AF_min_y) center at graph 0.84,-0.17  point pt 7 ps 0  tc lt "8"
set label 21 sprintf("%.4f", AF_max_y) center at graph 0.84,-0.21  point pt 7 ps 0  tc lt "8"
set label 22 "Min" c at graph 0,-0.17 point pt 7 ps 0 
set label 23 "Max" c at graph 0,-0.21 point pt 7 ps 0

p 	[0:][] \
'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(2)*10) w d ls 1 lw 2 t "", \
'' u (column(1)):(column(2)*10) w l ls 1 lw 3 smooth bezier t 'AB',\
'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(3)*10) w d ls 2 lw 2 t "", \
'' u (column(1)):(column(3)*10) w l ls 2 lw 3 smooth bezier t 'BC',\
'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(4)*10) w d ls 3 lw 2 t "", \
'' u (column(1)):(column(4)*10) w l ls 3 lw 3 smooth bezier t 'CD', \
'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(5)*10) w d ls 4 lw 2 t "", \
'' u (column(1)):(column(5)*10) w l ls 4 lw 3 smooth bezier t 'DE', \
'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(6)*10) w d ls 5 lw 2 t "", \
'' u (column(1)):(column(6)*10) w l ls 5 lw 3 smooth bezier t 'EF', \
'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(7)*10) w d ls 6 lw 2 t "", \
'' u (column(1)):(column(7)*10) w l ls 6 lw 3 smooth bezier t 'AF'

#####
reset
set terminal pngcairo  background "#ffffff" enhanced font "arial-Bold,18" fontscale 1.0 size 1080, 768 
set key on b c inside horizontal
set output 'Distance_R591-R591-$pdb-$n_three.png'
set title "Distance : R591-R591  ($n_three ns)\n{/*0.5 $TITLE + $subTITLE}"
set xlabel "Time (ns)"
set ylabel "Distance (\305)"
set grid
set style function linespoints
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 6 dt 1 pi 0 ps 1
set style line 5  lt 7 dt 1 pi 0 ps 1
set style line 6  lt 8 dt 1 pi 0 ps 1
set style line 7  lt 9 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u 1:(column(8)*10) name "AB"
stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u 1:(column(9)*10) name "BC"
stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u 1:(column(10)*10) name "CD"
stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u 1:(column(11)*10) name "DE"
stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u 1:(column(12)*10) name "EF"
stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u 1:(column(13)*10) name "AF"
set bmargin 5
set label 10 sprintf("%.4f", AB_min_y) center at graph 0.14,-0.17  point pt 7 ps 0  tc lt "1"
set label 11 sprintf("%.4f", AB_max_y) center at graph 0.14,-0.21  point pt 7 ps 0  tc lt "1"
set label 12 sprintf("%.4f", BC_min_y) center at graph 0.28,-0.17  point pt 7 ps 0  tc lt "2"
set label 13 sprintf("%.4f", BC_max_y) center at graph 0.28,-0.21  point pt 7 ps 0  tc lt "2"
set label 14 sprintf("%.4f", CD_min_y) center at graph 0.42,-0.17  point pt 7 ps 0  tc lt "4"
set label 15 sprintf("%.4f", CD_max_y) center at graph 0.42,-0.21  point pt 7 ps 0  tc lt "4"
set label 16 sprintf("%.4f", DE_min_y) center at graph 0.56,-0.17  point pt 7 ps 0  tc lt "6"
set label 17 sprintf("%.4f", DE_max_y) center at graph 0.56,-0.21  point pt 7 ps 0  tc lt "6"
set label 18 sprintf("%.4f", EF_min_y) center at graph 0.70,-0.17  point pt 7 ps 0  tc lt "7"
set label 19 sprintf("%.4f", EF_max_y) center at graph 0.70,-0.21  point pt 7 ps 0  tc lt "7"
set label 20 sprintf("%.4f", AF_min_y) center at graph 0.84,-0.17  point pt 7 ps 0  tc lt "8"
set label 21 sprintf("%.4f", AF_max_y) center at graph 0.84,-0.21  point pt 7 ps 0  tc lt "8"
set label 22 "Min" c at graph 0,-0.17 point pt 7 ps 0 
set label 23 "Max" c at graph 0,-0.21 point pt 7 ps 0

p 	[0:][] \
'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(8)*10) w d ls 1 lw 2 t "", \
'' u (column(1)):(column(8)*10) w l ls 1 lw 3 smooth bezier t 'AB',\
'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(9)*10) w d ls 2 lw 2 t "", \
'' u (column(1)):(column(9)*10) w l ls 2 lw 3 smooth bezier t 'BC',\
'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(10)*10) w d ls 3 lw 2 t "", \
'' u (column(1)):(column(10)*10) w l ls 3 lw 3 smooth bezier t 'CD', \
'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(11)*10) w d ls 4 lw 2 t "", \
'' u (column(1)):(column(11)*10) w l ls 4 lw 3 smooth bezier t 'DE', \
'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(12)*10) w d ls 5 lw 2 t "", \
'' u (column(1)):(column(12)*10) w l ls 5 lw 3 smooth bezier t 'EF', \
'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(13)*10) w d ls 6 lw 2 t "", \
'' u (column(1)):(column(13)*10) w l ls 6 lw 3 smooth bezier t 'AF'

#####
reset
set terminal pngcairo  background "#ffffff" enhanced font "arial-Bold,18" fontscale 1.0 size 1080, 768 
set key on b c inside horizontal
set output 'Distance_Y556-Y556_dgnl-$pdb-$n_three.png'
set title "Distance : Y556-Y556 Diagonal ($n_three ns)\n{/*0.5 $TITLE + $subTITLE}"
set xlabel "Time (ns)"
set ylabel "Distance (\305)"
set grid
set style function linespoints
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 6 dt 1 pi 0 ps 1
set style line 5  lt 7 dt 1 pi 0 ps 1
set style line 6  lt 8 dt 1 pi 0 ps 1
set style line 7  lt 9 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'Y556_Y556_dgnl_$pdb-$n_three-ns.xvg' u 1:(column(2)*10) name "AD"
stats 'Y556_Y556_dgnl_$pdb-$n_three-ns.xvg' u 1:(column(3)*10) name "BE"
stats 'Y556_Y556_dgnl_$pdb-$n_three-ns.xvg' u 1:(column(4)*10) name "CF"
set bmargin 5
set label 10 sprintf("%.4f", AD_min_y) center at graph 0.25,-0.17  point pt 7 ps 0  tc lt "1"
set label 11 sprintf("%.4f", AD_max_y) center at graph 0.25,-0.21  point pt 7 ps 0  tc lt "1"
set label 12 sprintf("%.4f", BE_min_y) center at graph 0.50,-0.17  point pt 7 ps 0  tc lt "2"
set label 13 sprintf("%.4f", BE_max_y) center at graph 0.50,-0.21  point pt 7 ps 0  tc lt "2"
set label 14 sprintf("%.4f", CF_min_y) center at graph 0.75,-0.17  point pt 7 ps 0  tc lt "4"
set label 15 sprintf("%.4f", CF_max_y) center at graph 0.75,-0.21  point pt 7 ps 0  tc lt "4"
set label 22 "Min" c at graph 0,-0.17 point pt 7 ps 0 
set label 23 "Max" c at graph 0,-0.21 point pt 7 ps 0

p 	[0:][] \
'Y556_Y556_dgnl_$pdb-$n_three-ns.xvg' u (column(1)):(column(2)*10) w d ls 1 lw 2 t "", \
'' u (column(1)):(column(2)*10) w l ls 1 lw 3 smooth bezier t 'AD',\
'Y556_Y556_dgnl_$pdb-$n_three-ns.xvg' u (column(1)):(column(3)*10) w d ls 2 lw 2 t "", \
'' u (column(1)):(column(3)*10) w l ls 2 lw 3 smooth bezier t 'BE',\
'Y556_Y556_dgnl_$pdb-$n_three-ns.xvg' u (column(1)):(column(4)*10) w d ls 3 lw 2 t "", \
'' u (column(1)):(column(4)*10) w l ls 3 lw 3 smooth bezier t 'CF'

#####
reset
set terminal pngcairo  background "#ffffff" enhanced font "arial-Bold,18" fontscale 1.0 size 1080, 768 
set key on b c inside horizontal
set output 'Distance_R591-R591_dgnl-$pdb-$n_three.png'
set title "Distance : R591-R591 Diagonal ($n_three ns)\n{/*0.5 $TITLE + $subTITLE}"
set xlabel "Time (ns)"
set ylabel "Distance (\305)"
set grid
set style function linespoints
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 6 dt 1 pi 0 ps 1
set style line 5  lt 7 dt 1 pi 0 ps 1
set style line 6  lt 8 dt 1 pi 0 ps 1
set style line 7  lt 9 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg' u 1:(column(5)*10) name "AD"
stats 'Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg' u 1:(column(6)*10) name "BE"
stats 'Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg' u 1:(column(7)*10) name "CF"
set bmargin 5
set label 10 sprintf("%.4f", AD_min_y) center at graph 0.25,-0.17  point pt 7 ps 0  tc lt "1"
set label 11 sprintf("%.4f", AD_max_y) center at graph 0.25,-0.21  point pt 7 ps 0  tc lt "1"
set label 12 sprintf("%.4f", BE_min_y) center at graph 0.50,-0.17  point pt 7 ps 0  tc lt "2"
set label 13 sprintf("%.4f", BE_max_y) center at graph 0.50,-0.21  point pt 7 ps 0  tc lt "2"
set label 14 sprintf("%.4f", CF_min_y) center at graph 0.75,-0.17  point pt 7 ps 0  tc lt "4"
set label 15 sprintf("%.4f", CF_max_y) center at graph 0.75,-0.21  point pt 7 ps 0  tc lt "4"
set label 22 "Min" c at graph 0,-0.17 point pt 7 ps 0 
set label 23 "Max" c at graph 0,-0.21 point pt 7 ps 0

p 	[0:][] \
'Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(1)):(column(5)*10) w d ls 1 lw 2 t "", \
'' u (column(1)):(column(5)*10) w l ls 1 lw 3 smooth bezier t 'AD',\
'Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(1)):(column(6)*10) w d ls 2 lw 2 t "", \
'' u (column(1)):(column(6)*10) w l ls 2 lw 3 smooth bezier t 'BE',\
'Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(1)):(column(7)*10) w d ls 3 lw 2 t "", \
'' u (column(1)):(column(7)*10) w l ls 3 lw 3 smooth bezier t 'CF'

#####
reset
set terminal pngcairo  background "#ffffff" enhanced font "arial-Bold,18" fontscale 1.0 size 1080, 768 
set key on b c inside horizontal
set output 'Distance_Y556-C713-$pdb-$n_three.png'
set title "Distance : Y556-C713  ($n_three ns)\n{/*0.5 $TITLE + $subTITLE}"
set xlabel "Time (ns)"
set ylabel "Distance (\305)"
set grid
set style function linespoints
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 6 dt 1 pi 0 ps 1
set style line 5  lt 7 dt 1 pi 0 ps 1
set style line 6  lt 8 dt 1 pi 0 ps 1
set style line 7  lt 9 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'Y556_C713_$pdb-$n_three-ns.xvg' u 1:(column(2)*10) name "A"
stats 'Y556_C713_$pdb-$n_three-ns.xvg' u 1:(column(3)*10) name "B"
stats 'Y556_C713_$pdb-$n_three-ns.xvg' u 1:(column(4)*10) name "C"
stats 'Y556_C713_$pdb-$n_three-ns.xvg' u 1:(column(5)*10) name "D"
stats 'Y556_C713_$pdb-$n_three-ns.xvg' u 1:(column(6)*10) name "E"
stats 'Y556_C713_$pdb-$n_three-ns.xvg' u 1:(column(7)*10) name "F"
set bmargin 5
set label 10 sprintf("%.4f", A_min_y) center at graph 0.14,-0.17  point pt 7 ps 0  tc lt "1"
set label 11 sprintf("%.4f", A_max_y) center at graph 0.14,-0.21  point pt 7 ps 0  tc lt "1"
set label 12 sprintf("%.4f", B_min_y) center at graph 0.28,-0.17  point pt 7 ps 0  tc lt "2"
set label 13 sprintf("%.4f", B_max_y) center at graph 0.28,-0.21  point pt 7 ps 0  tc lt "2"
set label 14 sprintf("%.4f", C_min_y) center at graph 0.42,-0.17  point pt 7 ps 0  tc lt "4"
set label 15 sprintf("%.4f", C_max_y) center at graph 0.42,-0.21  point pt 7 ps 0  tc lt "4"
set label 16 sprintf("%.4f", D_min_y) center at graph 0.56,-0.17  point pt 7 ps 0  tc lt "6"
set label 17 sprintf("%.4f", D_max_y) center at graph 0.56,-0.21  point pt 7 ps 0  tc lt "6"
set label 18 sprintf("%.4f", E_min_y) center at graph 0.70,-0.17  point pt 7 ps 0  tc lt "7"
set label 19 sprintf("%.4f", E_max_y) center at graph 0.70,-0.21  point pt 7 ps 0  tc lt "7"
set label 20 sprintf("%.4f", F_min_y) center at graph 0.84,-0.17  point pt 7 ps 0  tc lt "8"
set label 21 sprintf("%.4f", F_max_y) center at graph 0.84,-0.21  point pt 7 ps 0  tc lt "8"
set label 22 "Min" c at graph 0,-0.17 point pt 7 ps 0 
set label 23 "Max" c at graph 0,-0.21 point pt 7 ps 0

p 	[0:][:] \
	'Y556_C713_$pdb-$n_three-ns.xvg' u (column(1)):(column(2)*10) w d ls 1 lw 3 t "", \
	'' u (column(1)):(column(2)*10) w l ls 1 lw 3 smooth bezier t 'A',\
	'Y556_C713_$pdb-$n_three-ns.xvg' u (column(1)):(column(3)*10) w d ls 2 lw 3 t "", \
	'' u (column(1)):(column(3)*10) w l ls 2 lw 3 smooth bezier t 'B',\
	'Y556_C713_$pdb-$n_three-ns.xvg' u (column(1)):(column(4)*10) w d ls 3 lw 3 t "", \
	'' u (column(1)):(column(4)*10) w l ls 3 lw 3 smooth bezier t 'C',\
	'Y556_C713_$pdb-$n_three-ns.xvg' u (column(1)):(column(5)*10) w d ls 4 lw 3 t "", \
	'' u (column(1)):(column(5)*10) w l ls 4 lw 3 smooth bezier t 'D',\
	'Y556_C713_$pdb-$n_three-ns.xvg' u (column(1)):(column(6)*10) w d ls 5 lw 3 t "", \
	'' u (column(1)):(column(6)*10) w l ls 5 lw 3 smooth bezier t 'E',\
	'Y556_C713_$pdb-$n_three-ns.xvg' u (column(1)):(column(7)*10) w d ls 6 lw 3 t "", \
	'' u (column(1)):(column(7)*10) w l ls 6 lw 3 smooth bezier t 'F'

#####
reset
set terminal pngcairo  background "#ffffff" enhanced font "arial-Bold,18" fontscale 1.0 size 1080, 768 
set key on b c inside horizontal
set output 'Distance_C713-C713-$pdb-$n_three.png'
set title "Distance : C713-C713  ($n_three ns)\n{/*0.5 $TITLE + $subTITLE}"
set xlabel "Time (ns)"
set ylabel "Distance (\305)"
set grid
set style function linespoints
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 6 dt 1 pi 0 ps 1
set style line 5  lt 7 dt 1 pi 0 ps 1
set style line 6  lt 8 dt 1 pi 0 ps 1
set style line 7  lt 9 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'C713_C713_$pdb-$n_three-ns.xvg' u 1:(column(2)*10) name "A"
stats 'C713_C713_$pdb-$n_three-ns.xvg' u 1:(column(3)*10) name "B"
stats 'C713_C713_$pdb-$n_three-ns.xvg' u 1:(column(4)*10) name "C"
stats 'C713_C713_$pdb-$n_three-ns.xvg' u 1:(column(5)*10) name "D"
stats 'C713_C713_$pdb-$n_three-ns.xvg' u 1:(column(6)*10) name "E"
stats 'C713_C713_$pdb-$n_three-ns.xvg' u 1:(column(7)*10) name "F"
set bmargin 5
set label 10 sprintf("%.4f", A_min_y) center at graph 0.14,-0.17  point pt 7 ps 0  tc lt "1"
set label 11 sprintf("%.4f", A_max_y) center at graph 0.14,-0.21  point pt 7 ps 0  tc lt "1"
set label 12 sprintf("%.4f", B_min_y) center at graph 0.28,-0.17  point pt 7 ps 0  tc lt "2"
set label 13 sprintf("%.4f", B_max_y) center at graph 0.28,-0.21  point pt 7 ps 0  tc lt "2"
set label 14 sprintf("%.4f", C_min_y) center at graph 0.42,-0.17  point pt 7 ps 0  tc lt "4"
set label 15 sprintf("%.4f", C_max_y) center at graph 0.42,-0.21  point pt 7 ps 0  tc lt "4"
set label 16 sprintf("%.4f", D_min_y) center at graph 0.56,-0.17  point pt 7 ps 0  tc lt "6"
set label 17 sprintf("%.4f", D_max_y) center at graph 0.56,-0.21  point pt 7 ps 0  tc lt "6"
set label 18 sprintf("%.4f", E_min_y) center at graph 0.70,-0.17  point pt 7 ps 0  tc lt "7"
set label 19 sprintf("%.4f", E_max_y) center at graph 0.70,-0.21  point pt 7 ps 0  tc lt "7"
set label 20 sprintf("%.4f", F_min_y) center at graph 0.84,-0.17  point pt 7 ps 0  tc lt "8"
set label 21 sprintf("%.4f", F_max_y) center at graph 0.84,-0.21  point pt 7 ps 0  tc lt "8"
set label 22 "Min" c at graph 0,-0.17 point pt 7 ps 0 
set label 23 "Max" c at graph 0,-0.21 point pt 7 ps 0

p 	[0:][:] \
	'C713_C713_$pdb-$n_three-ns.xvg' u (column(1)):(column(2)*10) w d ls 1 lw 3 t "", \
	'' u (column(1)):(column(2)*10) w l ls 1 lw 3 smooth bezier t 'AB',\
	'C713_C713_$pdb-$n_three-ns.xvg' u (column(1)):(column(3)*10) w d ls 2 lw 3 t "", \
	'' u (column(1)):(column(3)*10) w l ls 2 lw 3 smooth bezier t 'BC',\
	'C713_C713_$pdb-$n_three-ns.xvg' u (column(1)):(column(4)*10) w d ls 3 lw 3 t "", \
	'' u (column(1)):(column(4)*10) w l ls 3 lw 3 smooth bezier t 'CD',\
	'C713_C713_$pdb-$n_three-ns.xvg' u (column(1)):(column(5)*10) w d ls 4 lw 3 t "", \
	'' u (column(1)):(column(5)*10) w l ls 4 lw 3 smooth bezier t 'DE',\
	'C713_C713_$pdb-$n_three-ns.xvg' u (column(1)):(column(6)*10) w d ls 5 lw 3 t "", \
	'' u (column(1)):(column(6)*10) w l ls 5 lw 3 smooth bezier t 'EF',\
	'C713_C713_$pdb-$n_three-ns.xvg' u (column(1)):(column(7)*10) w d ls 6 lw 3 t "", \
	'' u (column(1)):(column(7)*10) w l ls 6 lw 3 smooth bezier t 'AF'

#####
reset
set terminal pngcairo  background "#ffffff" enhanced font "arial-Bold,18" fontscale 1.0 size 1080, 768 
set key on b c inside horizontal
set output 'Distance_V456-Y556-$pdb-$n_three.png'
set title "Distance : V456-Y556  ($n_three ns)\n{/*0.5 $TITLE + $subTITLE}"
set xlabel "Time (ns)"
set ylabel "Distance (\305)"
set grid
set style function linespoints
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 6 dt 1 pi 0 ps 1
set style line 5  lt 7 dt 1 pi 0 ps 1
set style line 6  lt 8 dt 1 pi 0 ps 1
set style line 7  lt 9 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'V456_Y556_$pdb-$n_three-ns.xvg' u 1:(column(2)*10) name "A"
stats 'V456_Y556_$pdb-$n_three-ns.xvg' u 1:(column(3)*10) name "B"
stats 'V456_Y556_$pdb-$n_three-ns.xvg' u 1:(column(4)*10) name "C"
stats 'V456_Y556_$pdb-$n_three-ns.xvg' u 1:(column(5)*10) name "D"
stats 'V456_Y556_$pdb-$n_three-ns.xvg' u 1:(column(6)*10) name "E"
stats 'V456_Y556_$pdb-$n_three-ns.xvg' u 1:(column(7)*10) name "F"
set bmargin 5
set label 10 sprintf("%.4f", A_min_y) center at graph 0.14,-0.17  point pt 7 ps 0  tc lt "1"
set label 11 sprintf("%.4f", A_max_y) center at graph 0.14,-0.21  point pt 7 ps 0  tc lt "1"
set label 12 sprintf("%.4f", B_min_y) center at graph 0.28,-0.17  point pt 7 ps 0  tc lt "2"
set label 13 sprintf("%.4f", B_max_y) center at graph 0.28,-0.21  point pt 7 ps 0  tc lt "2"
set label 14 sprintf("%.4f", C_min_y) center at graph 0.42,-0.17  point pt 7 ps 0  tc lt "4"
set label 15 sprintf("%.4f", C_max_y) center at graph 0.42,-0.21  point pt 7 ps 0  tc lt "4"
set label 16 sprintf("%.4f", D_min_y) center at graph 0.56,-0.17  point pt 7 ps 0  tc lt "6"
set label 17 sprintf("%.4f", D_max_y) center at graph 0.56,-0.21  point pt 7 ps 0  tc lt "6"
set label 18 sprintf("%.4f", E_min_y) center at graph 0.70,-0.17  point pt 7 ps 0  tc lt "7"
set label 19 sprintf("%.4f", E_max_y) center at graph 0.70,-0.21  point pt 7 ps 0  tc lt "7"
set label 20 sprintf("%.4f", F_min_y) center at graph 0.84,-0.17  point pt 7 ps 0  tc lt "8"
set label 21 sprintf("%.4f", F_max_y) center at graph 0.84,-0.21  point pt 7 ps 0  tc lt "8"
set label 22 "Min" c at graph 0,-0.17 point pt 7 ps 0 
set label 23 "Max" c at graph 0,-0.21 point pt 7 ps 0

p 	[0:][:] \
	'V456_Y556_$pdb-$n_three-ns.xvg' u (column(1)):(column(2)*10) w d ls 1 lw 2 t "", \
	'' u (column(1)):(column(2)*10) w l ls 1 lw 3 smooth bezier t 'A',\
	'V456_Y556_$pdb-$n_three-ns.xvg' u (column(1)):(column(3)*10) w d ls 2 lw 2 t "", \
	'' u (column(1)):(column(3)*10) w l ls 2 lw 3 smooth bezier t 'B',\
	'V456_Y556_$pdb-$n_three-ns.xvg' u (column(1)):(column(4)*10) w d ls 3 lw 2 t "", \
	'' u (column(1)):(column(4)*10) w l ls 3 lw 3 smooth bezier t 'C',\
	'V456_Y556_$pdb-$n_three-ns.xvg' u (column(1)):(column(5)*10) w d ls 4 lw 2 t "", \
	'' u (column(1)):(column(5)*10) w l ls 4 lw 3 smooth bezier t 'D',\
	'V456_Y556_$pdb-$n_three-ns.xvg' u (column(1)):(column(6)*10) w d ls 5 lw 2 t "", \
	'' u (column(1)):(column(6)*10) w l ls 5 lw 3 smooth bezier t 'E',\
	'V456_Y556_$pdb-$n_three-ns.xvg' u (column(1)):(column(7)*10) w d ls 6 lw 2 t "", \
	'' u (column(1)):(column(7)*10) w l ls 6 lw 3 smooth bezier t 'F'
######
reset
set terminal pngcairo  background "#ffffff" enhanced font "arial-Bold,18" fontscale 1.0 size 1080, 768 
set key on b c inside horizontal
set output 'Distance_L512-Y556-$pdb-$n_three.png'
set title "Distance : L512-Y556  ($n_three ns)\n{/*0.5 $TITLE + $subTITLE}"
set xlabel "Time (ns)"
set ylabel "Distance (\305)"
set grid
set style function linespoints
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 6 dt 1 pi 0 ps 1
set style line 5  lt 7 dt 1 pi 0 ps 1
set style line 6  lt 8 dt 1 pi 0 ps 1
set style line 7  lt 9 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'L512_Y556_$pdb-$n_three-ns.xvg' u 1:(column(2)*10) name "A"
stats 'L512_Y556_$pdb-$n_three-ns.xvg' u 1:(column(3)*10) name "B"
stats 'L512_Y556_$pdb-$n_three-ns.xvg' u 1:(column(4)*10) name "C"
stats 'L512_Y556_$pdb-$n_three-ns.xvg' u 1:(column(5)*10) name "D"
stats 'L512_Y556_$pdb-$n_three-ns.xvg' u 1:(column(6)*10) name "E"
stats 'L512_Y556_$pdb-$n_three-ns.xvg' u 1:(column(7)*10) name "F"
set bmargin 5
set label 10 sprintf("%.4f", A_min_y) center at graph 0.14,-0.17  point pt 7 ps 0  tc lt "1"
set label 11 sprintf("%.4f", A_max_y) center at graph 0.14,-0.21  point pt 7 ps 0  tc lt "1"
set label 12 sprintf("%.4f", B_min_y) center at graph 0.28,-0.17  point pt 7 ps 0  tc lt "2"
set label 13 sprintf("%.4f", B_max_y) center at graph 0.28,-0.21  point pt 7 ps 0  tc lt "2"
set label 14 sprintf("%.4f", C_min_y) center at graph 0.42,-0.17  point pt 7 ps 0  tc lt "4"
set label 15 sprintf("%.4f", C_max_y) center at graph 0.42,-0.21  point pt 7 ps 0  tc lt "4"
set label 16 sprintf("%.4f", D_min_y) center at graph 0.56,-0.17  point pt 7 ps 0  tc lt "6"
set label 17 sprintf("%.4f", D_max_y) center at graph 0.56,-0.21  point pt 7 ps 0  tc lt "6"
set label 18 sprintf("%.4f", E_min_y) center at graph 0.70,-0.17  point pt 7 ps 0  tc lt "7"
set label 19 sprintf("%.4f", E_max_y) center at graph 0.70,-0.21  point pt 7 ps 0  tc lt "7"
set label 20 sprintf("%.4f", F_min_y) center at graph 0.84,-0.17  point pt 7 ps 0  tc lt "8"
set label 21 sprintf("%.4f", F_max_y) center at graph 0.84,-0.21  point pt 7 ps 0  tc lt "8"
set label 22 "Min" c at graph 0,-0.17 point pt 7 ps 0 
set label 23 "Max" c at graph 0,-0.21 point pt 7 ps 0

p 	[0:][:] \
	'L512_Y556_$pdb-$n_three-ns.xvg' u (column(1)):(column(2)*10) w d ls 1 lw 2 t "", \
	'' u (column(1)):(column(2)*10) w l ls 1 lw 3 smooth bezier t 'A',\
	'L512_Y556_$pdb-$n_three-ns.xvg' u (column(1)):(column(3)*10) w d ls 2 lw 2 t "", \
	'' u (column(1)):(column(3)*10) w l ls 2 lw 3 smooth bezier t 'B',\
	'L512_Y556_$pdb-$n_three-ns.xvg' u (column(1)):(column(4)*10) w d ls 3 lw 2 t "", \
	'' u (column(1)):(column(4)*10) w l ls 3 lw 3 smooth bezier t 'C', \
	'L512_Y556_$pdb-$n_three-ns.xvg' u (column(1)):(column(5)*10) w d ls 4 lw 2 t "", \
	'' u (column(1)):(column(5)*10) w l ls 4 lw 3 smooth bezier t 'D',\
	'L512_Y556_$pdb-$n_three-ns.xvg' u (column(1)):(column(6)*10) w d ls 5 lw 2 t "", \
	'' u (column(1)):(column(6)*10) w l ls 5 lw 3 smooth bezier t 'E',\
	'L512_Y556_$pdb-$n_three-ns.xvg' u (column(1)):(column(7)*10) w d ls 6 lw 2 t "", \
	'' u (column(1)):(column(7)*10) w l ls 6 lw 3 smooth bezier t 'F'
#####@@@@@@@@@@@@
reset
set terminal pngcairo  background "#ffffff" enhanced font "arial-Bold,18" fontscale 1.0 size 1080, 768 
set key on b c inside horizontal
set output 'Distance_H596-H596_dgnl-$pdb-$n_three.png'
set title "Distance : H596-H596 Diagonal ($n_three ns)\n{/*0.5 $TITLE + $subTITLE}"
set xlabel "Time (ns)"
set ylabel "Distance (\305)"
set grid
set style function linespoints
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 6 dt 1 pi 0 ps 1
set style line 5  lt 7 dt 1 pi 0 ps 1
set style line 6  lt 8 dt 1 pi 0 ps 1
set style line 7  lt 9 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'Y556_H596_dgnl_corrl_$pdb-$n_three-ns.xvg' u 1:(column(5)*10) name "AD"
stats 'Y556_H596_dgnl_corrl_$pdb-$n_three-ns.xvg' u 1:(column(6)*10) name "BE"
stats 'Y556_H596_dgnl_corrl_$pdb-$n_three-ns.xvg' u 1:(column(7)*10) name "CF"
set bmargin 5
set label 10 sprintf("%.4f", AD_min_y) center at graph 0.25,-0.17  point pt 7 ps 0  tc lt "1"
set label 11 sprintf("%.4f", AD_max_y) center at graph 0.25,-0.21  point pt 7 ps 0  tc lt "1"
set label 12 sprintf("%.4f", BE_min_y) center at graph 0.50,-0.17  point pt 7 ps 0  tc lt "2"
set label 13 sprintf("%.4f", BE_max_y) center at graph 0.50,-0.21  point pt 7 ps 0  tc lt "2"
set label 14 sprintf("%.4f", CF_min_y) center at graph 0.75,-0.17  point pt 7 ps 0  tc lt "4"
set label 15 sprintf("%.4f", CF_max_y) center at graph 0.75,-0.21  point pt 7 ps 0  tc lt "4"
set label 22 "Min" c at graph 0,-0.17 point pt 7 ps 0 
set label 23 "Max" c at graph 0,-0.21 point pt 7 ps 0

p 	[0:][] \
'Y556_H596_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(1)):(column(5)*10) w d ls 1 lw 2 t "", \
'' u (column(1)):(column(5)*10) w l ls 1 lw 3 smooth bezier t 'AD',\
'Y556_H596_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(1)):(column(6)*10) w d ls 2 lw 2 t "", \
'' u (column(1)):(column(6)*10) w l ls 2 lw 3 smooth bezier t 'BE',\
'Y556_H596_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(1)):(column(7)*10) w d ls 3 lw 2 t "", \
'' u (column(1)):(column(7)*10) w l ls 3 lw 3 smooth bezier t 'CF'
######
reset
set terminal pngcairo  background "#ffffff" enhanced font "arial-Bold,18" fontscale 1.0 size 1080, 768 
set key on b c inside horizontal
set output 'Distance_A718-A718_dgnl-$pdb-$n_three.png'
set title "Distance : A718-A718 Diagonal ($n_three ns)\n{/*0.5 $TITLE + $subTITLE}"
set xlabel "Time (ns)"
set ylabel "Distance (\305)"
set grid
set style function linespoints
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 6 dt 1 pi 0 ps 1
set style line 5  lt 7 dt 1 pi 0 ps 1
set style line 6  lt 8 dt 1 pi 0 ps 1
set style line 7  lt 9 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'A718_A718_dgnl_$pdb-$n_three-ns.xvg' u 1:(column(2)*10) name "AD"
stats 'A718_A718_dgnl_$pdb-$n_three-ns.xvg' u 1:(column(3)*10) name "BE"
stats 'A718_A718_dgnl_$pdb-$n_three-ns.xvg' u 1:(column(4)*10) name "CF"
set bmargin 5
set label 10 sprintf("%.4f", AD_min_y) center at graph 0.25,-0.17  point pt 7 ps 0  tc lt "1"
set label 11 sprintf("%.4f", AD_max_y) center at graph 0.25,-0.21  point pt 7 ps 0  tc lt "1"
set label 12 sprintf("%.4f", BE_min_y) center at graph 0.50,-0.17  point pt 7 ps 0  tc lt "2"
set label 13 sprintf("%.4f", BE_max_y) center at graph 0.50,-0.21  point pt 7 ps 0  tc lt "2"
set label 14 sprintf("%.4f", CF_min_y) center at graph 0.75,-0.17  point pt 7 ps 0  tc lt "4"
set label 15 sprintf("%.4f", CF_max_y) center at graph 0.75,-0.21  point pt 7 ps 0  tc lt "4"
set label 22 "Min" c at graph 0,-0.17 point pt 7 ps 0 
set label 23 "Max" c at graph 0,-0.21 point pt 7 ps 0

p 	[0:][] \
'A718_A718_dgnl_$pdb-$n_three-ns.xvg' u (column(1)):(column(2)*10) w d ls 1 lw 2 t "", \
'' u (column(1)):(column(2)*10) w l ls 1 lw 3 smooth bezier t 'AD',\
'A718_A718_dgnl_$pdb-$n_three-ns.xvg' u (column(1)):(column(3)*10) w d ls 2 lw 2 t "", \
'' u (column(1)):(column(3)*10) w l ls 2 lw 3 smooth bezier t 'BE',\
'A718_A718_dgnl_$pdb-$n_three-ns.xvg' u (column(1)):(column(4)*10) w d ls 3 lw 2 t "", \
'' u (column(1)):(column(4)*10) w l ls 3 lw 3 smooth bezier t 'CF'

######

reset
set terminal pngcairo  background "#ffffff" enhanced font "arial-Bold,18" fontscale 1.0 size 1080, 768 
set key on b c inside horizontal
set output 'Distance_Y556-R591-$pdb-$n_three.png'
set title "Distance : Y556-R591  ($n_three ns)\n{/*0.5 $TITLE + $subTITLE}"
set xlabel "Time (ns)"
set ylabel "Distance (\305)"
set grid
set style function linespoints
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 6 dt 1 pi 0 ps 1
set style line 5  lt 7 dt 1 pi 0 ps 1
set style line 6  lt 8 dt 1 pi 0 ps 1
set style line 7  lt 9 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'Y556-R591_$pdb-$n_three-ns.xvg' u 1:(column(2)*10) name "A"
stats 'Y556-R591_$pdb-$n_three-ns.xvg' u 1:(column(3)*10) name "B"
stats 'Y556-R591_$pdb-$n_three-ns.xvg' u 1:(column(4)*10) name "C"
stats 'Y556-R591_$pdb-$n_three-ns.xvg' u 1:(column(5)*10) name "D"
stats 'Y556-R591_$pdb-$n_three-ns.xvg' u 1:(column(6)*10) name "E"
stats 'Y556-R591_$pdb-$n_three-ns.xvg' u 1:(column(7)*10) name "F"
set bmargin 5
set label 10 sprintf("%.4f", A_min_y) center at graph 0.14,-0.17  point pt 7 ps 0  tc lt "1"
set label 11 sprintf("%.4f", A_max_y) center at graph 0.14,-0.21  point pt 7 ps 0  tc lt "1"
set label 12 sprintf("%.4f", B_min_y) center at graph 0.28,-0.17  point pt 7 ps 0  tc lt "2"
set label 13 sprintf("%.4f", B_max_y) center at graph 0.28,-0.21  point pt 7 ps 0  tc lt "2"
set label 14 sprintf("%.4f", C_min_y) center at graph 0.42,-0.17  point pt 7 ps 0  tc lt "4"
set label 15 sprintf("%.4f", C_max_y) center at graph 0.42,-0.21  point pt 7 ps 0  tc lt "4"
set label 16 sprintf("%.4f", D_min_y) center at graph 0.56,-0.17  point pt 7 ps 0  tc lt "6"
set label 17 sprintf("%.4f", D_max_y) center at graph 0.56,-0.21  point pt 7 ps 0  tc lt "6"
set label 18 sprintf("%.4f", E_min_y) center at graph 0.70,-0.17  point pt 7 ps 0  tc lt "7"
set label 19 sprintf("%.4f", E_max_y) center at graph 0.70,-0.21  point pt 7 ps 0  tc lt "7"
set label 20 sprintf("%.4f", F_min_y) center at graph 0.84,-0.17  point pt 7 ps 0  tc lt "8"
set label 21 sprintf("%.4f", F_max_y) center at graph 0.84,-0.21  point pt 7 ps 0  tc lt "8"
set label 22 "Min" c at graph 0,-0.17 point pt 7 ps 0 
set label 23 "Max" c at graph 0,-0.21 point pt 7 ps 0

p 	[0:][:] \
	'Y556-R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(2)*10) w d ls 1 lw 2 t "", \
	'' u (column(1)):(column(2)*10) w l ls 1 lw 3 smooth bezier t 'A',\
	'Y556-R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(3)*10) w d ls 2 lw 2 t "", \
	'' u (column(1)):(column(3)*10) w l ls 2 lw 3 smooth bezier t 'B',\
	'Y556-R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(4)*10) w d ls 3 lw 2 t "", \
	'' u (column(1)):(column(4)*10) w l ls 3 lw 3 smooth bezier t 'C', \
	'Y556-R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(5)*10) w d ls 4 lw 2 t "", \
	'' u (column(1)):(column(5)*10) w l ls 4 lw 3 smooth bezier t 'D',\
	'Y556-R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(6)*10) w d ls 5 lw 2 t "", \
	'' u (column(1)):(column(6)*10) w l ls 5 lw 3 smooth bezier t 'E',\
	'Y556-R591_$pdb-$n_three-ns.xvg' u (column(1)):(column(7)*10) w d ls 6 lw 2 t "", \
	'' u (column(1)):(column(7)*10) w l ls 6 lw 3 smooth bezier t 'F'

######
reset

set terminal pngcairo  background "#ffffff" enhanced font "arial-Bold,18" fontscale 1.0 size 768, 1080 
set key on b c inside horizontal
set output 'Distance_Y556-A718_dgnl_corrl-$pdb-$n_three.png'

set grid
set style function linespoints
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 6 dt 1 pi 0 ps 1
set style line 5  lt 7 dt 1 pi 0 ps 1
set style line 6  lt 8 dt 1 pi 0 ps 1
set style line 7  lt 9 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'Y556_A718_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(2)*10):(column(5)*10) name "AD_556_718"
stats 'Y556_A718_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(3)*10):(column(6)*10) name "BE_556_718"
stats 'Y556_A718_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(4)*10):(column(7)*10) name "CF_556_718"

set multiplot layout 3,1
set title "Distance : Y556-Y556 Vs A718-A718 ($n_three ns)\n{/*0.5 $TITLE + $subTITLE}"
set ylabel " "
set size 1,0.37
set label 1 sprintf("%.4f", AD_556_718_correlation) center at graph 0.20,0.18
set label 2 "r = " c at graph 0.10, 0.18
set origin 0.0,0.60
linear(start,slope,x) = start + slope*x
fit linear(avgstart,avgslope,x) "Y556_A718_dgnl_corrl_$pdb-$n_three-ns.xvg" u (column(2)*10):(column(5)*10) via avgstart,avgslope
set key left reverse Left
print avgstart, avgslope
p 'Y556_A718_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(2)*10):(column(5)*10) w d ls 1 lw 2 t "", avgstart + avgslope*x t "AD" w l ls 1 lw 2

unset title
set ylabel "A718-A718: Distance (\305)"
set size 1,0.3
set origin 0.0,0.31
set label 1 sprintf("%.4f", BE_556_718_correlation) center at graph 0.20,0.18
set label 2 "r = " c at graph 0.10, 0.18
linear(start,slope,x) = start + slope*x
fit linear(avgstart,avgslope,x) "Y556_A718_dgnl_corrl_$pdb-$n_three-ns.xvg" u (column(3)*10):(column(6)*10) via avgstart,avgslope
set key left reverse Left
print avgstart, avgslope
p 'Y556_A718_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(3)*10):(column(6)*10) w d ls 2 lw 2 t "", avgstart + avgslope*x t "BE" w l ls 2 lw 2

set xlabel "Y556-Y556: Distance (\305)"
set ylabel " "
set size 1,0.33
set origin 0.0,0.0
set label 1 sprintf("%.4f", CF_556_718_correlation) center at graph 0.20,0.18
set label 2 "r = " c at graph 0.10, 0.18
linear(start,slope,x) = start + slope*x
fit linear(avgstart,avgslope,x) "Y556_A718_dgnl_corrl_$pdb-$n_three-ns.xvg" u (column(4)*10):(column(7)*10) via avgstart,avgslope
set key left reverse Left
print avgstart, avgslope
p 'Y556_A718_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(4)*10):(column(7)*10) w d ls 3 lw 2 t "", avgstart + avgslope*x t "CF" w l ls 3 lw 2 
unset multiplot

######
reset

set terminal pngcairo  background "#ffffff" enhanced font "arial-Bold,18" fontscale 1.0 size 768, 1080 
set key on b c inside horizontal
set output 'Distance_Y556-R591_dgnl_corrl-$pdb-$n_three.png'

set grid
set style function linespoints
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 6 dt 1 pi 0 ps 1
set style line 5  lt 7 dt 1 pi 0 ps 1
set style line 6  lt 8 dt 1 pi 0 ps 1
set style line 7  lt 9 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(2)*10):(column(5)*10) name "AD_556_591"
stats 'Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(3)*10):(column(6)*10) name "BE_556_591"
stats 'Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(4)*10):(column(7)*10) name "CF_556_591"

set multiplot layout 3,1
set title "Distance : Y556-Y556 Vs R591-R591 ($n_three ns)\n{/*0.5 $TITLE + $subTITLE}"
set ylabel " "
set size 1,0.37
set label 1 sprintf("%.4f", AD_556_591_correlation) center at graph 0.20,0.18
set label 2 "r = " c at graph 0.10, 0.18
set origin 0.0,0.60
linear(start,slope,x) = start + slope*x
fit linear(avgstart,avgslope,x) "Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg" u (column(2)*10):(column(5)*10) via avgstart,avgslope
set key left reverse Left
print avgstart, avgslope
p 'Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(2)*10):(column(5)*10) w d ls 1 lw 2 t "", avgstart + avgslope*x t "AD" w l ls 1 lw 2

unset title
set ylabel "R591-R591: Distance (\305)"
set size 1,0.3
set label 1 sprintf("%.4f", BE_556_591_correlation) center at graph 0.20,0.18
set label 2 "r = " c at graph 0.10, 0.18
set origin 0.0,0.31
linear(start,slope,x) = start + slope*x
fit linear(avgstart,avgslope,x) "Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg" u (column(3)*10):(column(6)*10) via avgstart,avgslope
set key left reverse Left
print avgstart, avgslope
p 'Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(3)*10):(column(6)*10) w d ls 2 lw 2 t "", avgstart + avgslope*x t "BE" w l ls 2 lw 2

set xlabel "Y556-Y556: Distance (\305)"
set ylabel " "
set size 1,0.33
set label 1 sprintf("%.4f", CF_556_591_correlation) center at graph 0.20,0.18
set label 2 "r = " c at graph 0.10, 0.18
set origin 0.0,0.0
linear(start,slope,x) = start + slope*x
fit linear(avgstart,avgslope,x) "Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg" u (column(4)*10):(column(7)*10) via avgstart,avgslope
set key left reverse Left
print avgstart, avgslope
p 'Y556-R591_dgnl_corrl_$pdb-$n_three-ns.xvg' u (column(4)*10):(column(7)*10) w d ls 3 lw 2 t "", avgstart + avgslope*x t "CF" w l ls 3 lw 2 
unset multiplot
######
reset

set terminal pngcairo  background "#ffffff" enhanced font "arial-Bold,10" fontscale 1.0 size 768, 1080 
set key on b c inside horizontal
set output 'Distance_Y556_Y556-R591_R591_corrl-$pdb-$n_three.png'

set grid
set style function linespoints
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 6 dt 1 pi 0 ps 1
set style line 5  lt 7 dt 1 pi 0 ps 1
set style line 6  lt 8 dt 1 pi 0 ps 1
set style line 7  lt 9 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(2)*10):(column(8)*10) name "AB_PL1_PL2"
stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(3)*10):(column(9)*10) name "BC_PL1_PL2"
stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(4)*10):(column(10)*10) name "CD_PL1_PL2"
stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(5)*10):(column(11)*10) name "DE_PL1_PL2"
stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(6)*10):(column(12)*10) name "EF_PL1_PL2"
stats 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(7)*10):(column(13)*10) name "AF_PL1_PL2"

set title "Distance : Y556-Y556 Vs R591-R591 ($n_three ns)"
set multiplot layout 3,2
set ylabel "R591-R591: Distance (\305)"
set size 0.5,0.33
set label 1 sprintf("%.4f", AB_PL1_PL2_correlation) center at graph 0.20,0.18
set label 2 "r = " c at graph 0.10, 0.18
set origin 0.0,0.66
linear(start,slope,x) = start + slope*x
fit linear(avgstart,avgslope,x) "Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg" u (column(2)*10):(column(8)*10) via avgstart,avgslope
set key left reverse Left
print avgstart, avgslope
p 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(2)*10):(column(8)*10) w d ls 1 lw 2 t "", avgstart + avgslope*x t "AB" w l ls 1 lw 2

unset title
set ylabel "R591-R591: Distance (\305)"
set size 0.5,0.33
set label 1 sprintf("%.4f", BC_PL1_PL2_correlation) center at graph 0.20,0.18
set label 2 "r = " c at graph 0.10, 0.18
set origin 0.0,0.33
linear(start,slope,x) = start + slope*x
fit linear(avgstart,avgslope,x) "Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg" u (column(3)*10):(column(9)*10) via avgstart,avgslope
set key left reverse Left
print avgstart, avgslope
p 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(3)*10):(column(9)*10) w d ls 2 lw 2 t "", avgstart + avgslope*x t "BC" w l ls 2 lw 2

set xlabel "Y556-Y556: Distance (\305)"
set ylabel "R591-R591: Distance (\305)"
set size 0.5,0.33
set label 1 sprintf("%.4f", CD_PL1_PL2_correlation) center at graph 0.20,0.18
set label 2 "r = " c at graph 0.10, 0.18
set origin 0.0,0.0
linear(start,slope,x) = start + slope*x
fit linear(avgstart,avgslope,x) "Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg" u (column(4)*10):(column(10)*10) via avgstart,avgslope
set key left reverse Left
print avgstart, avgslope
p 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(4)*10):(column(10)*10) w d ls 3 lw 2 t "", avgstart + avgslope*x t "CD" w l ls 3 lw 2 

set title "$TITLE + $subTITLE"
set ylabel " "
unset xlabel
set size 0.5,0.33
set label 1 sprintf("%.4f", DE_PL1_PL2_correlation) center at graph 0.20,0.18
set label 2 "r = " c at graph 0.10, 0.18
set origin 0.5,0.66
linear(start,slope,x) = start + slope*x
fit linear(avgstart,avgslope,x) "Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg" u (column(5)*10):(column(11)*10) via avgstart,avgslope
set key left reverse Left
print avgstart, avgslope
p 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(5)*10):(column(11)*10) w d ls 4 lw 2 t "", avgstart + avgslope*x t "DE" w l ls 4 lw 2 

unset title
set ylabel " "
set size 0.5,0.33
set label 1 sprintf("%.4f", EF_PL1_PL2_correlation) center at graph 0.20,0.18
set label 2 "r = " c at graph 0.10, 0.18
set origin 0.5,0.33
linear(start,slope,x) = start + slope*x
fit linear(avgstart,avgslope,x) "Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg" u (column(6)*10):(column(12)*10) via avgstart,avgslope
set key left reverse Left
print avgstart, avgslope
p 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(6)*10):(column(12)*10) w d ls 5 lw 2 t "", avgstart + avgslope*x t "EF" w l ls 5 lw 2 

set xlabel "Y556-Y556: Distance (\305)"
set ylabel " "
set size 0.5,0.33
set label 1 sprintf("%.4f", AF_PL1_PL2_correlation) center at graph 0.20,0.18
set label 2 "r = " c at graph 0.10, 0.18
set origin 0.5,0.0
linear(start,slope,x) = start + slope*x
fit linear(avgstart,avgslope,x) "Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg" u (column(7)*10):(column(13)*10) via avgstart,avgslope
set key left reverse Left
print avgstart, avgslope
p 'Y556_Y556-R591_R591_$pdb-$n_three-ns.xvg' u (column(7)*10):(column(13)*10) w d ls 6 lw 2 t "", avgstart + avgslope*x t "AF" w l ls 6 lw 2 
unset multiplot
EOL
#++++++++++++++++++++++++++ Angle calculations ++++++++++++++++++++++++++++++
mkdir ../Angle
cd ../Angle		#path=MD_Traj_Protein/Angle
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-A.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-A.xvg not found!"
gmx angle -f ../$MD-complete$n_three-protein.xtc -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-A.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-A.xvg <<EOL
$angleone
EOL
fi
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-A-npt.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-A-npt.xvg not found!"
gmx angle -f ../$xtc_npt -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-A-npt.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-A-npt.xvg <<EOL
$angleone
EOL
fi
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-A-nvt.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-A-nvt.xvg not found!"
gmx angle -f ../$xtc_nvt -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-A-nvt.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-A-nvt.xvg <<EOL
$angleone
EOL
fi
##########
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-B.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-B.xvg not found!"
gmx angle -f ../$MD-complete$n_three-protein.xtc -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-B.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-B.xvg <<EOL
$angletwo
EOL
fi
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-B-npt.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-B-npt.xvg not found!"
gmx angle -f ../$xtc_npt -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-B-npt.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-B-npt.xvg <<EOL
$angletwo
EOL
fi
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-B-nvt.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-B-nvt.xvg not found!"
gmx angle -f ../$xtc_nvt -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-B-nvt.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-B-nvt.xvg <<EOL
$angletwo
EOL
fi
##########
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-C.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-C.xvg not found!"
gmx angle -f ../$MD-complete$n_three-protein.xtc -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-C.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-C.xvg <<EOL
$anglethree
EOL
fi
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-C-npt.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-C-npt.xvg not found!"
gmx angle -f ../$xtc_npt -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-C-npt.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-C-npt.xvg <<EOL
$anglethree
EOL
fi
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-C-nvt.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-C-nvt.xvg not found!"
gmx angle -f ../$xtc_nvt -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-C-nvt.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-C-nvt.xvg <<EOL
$anglethree
EOL
fi
##########
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-D.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-D.xvg not found!"
gmx angle -f ../$MD-complete$n_three-protein.xtc -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-D.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-D.xvg <<EOL
$anglefour
EOL
fi
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-D-npt.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-D-npt.xvg not found!"
gmx angle -f ../$xtc_npt -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-D-npt.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-D-npt.xvg <<EOL
$anglefour
EOL
fi
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-D-nvt.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-D-nvt.xvg not found!"
gmx angle -f ../$xtc_nvt -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-D-nvt.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-D-nvt.xvg <<EOL
$anglefour
EOL
fi
##########
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-E.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-E.xvg not found!"
gmx angle -f ../$MD-complete$n_three-protein.xtc -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-E.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-E.xvg <<EOL
$anglefive
EOL
fi
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-E-npt.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-E-npt.xvg not found!"
gmx angle -f ../$xtc_npt -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-E-npt.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-E-npt.xvg <<EOL
$anglefive
EOL
fi
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-E-nvt.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-E-nvt.xvg not found!"
gmx angle -f ../$xtc_nvt -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-E-nvt.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-E-nvt.xvg <<EOL
$anglefive
EOL
fi
##########
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-F.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-F.xvg not found!"
gmx angle -f ../$MD-complete$n_three-protein.xtc -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-F.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-F.xvg <<EOL
$anglesix
EOL
fi
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-F-npt.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-F-npt.xvg not found!"
gmx angle -f ../$xtc_npt -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-F-npt.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-F-npt.xvg <<EOL
$anglesix
EOL
fi
if [ ! -f angaver_M719_A533_L567_$pdb-$n_three-ns-F-nvt.xvg ]; then
    echo "File M719_A533_L567_$pdb-$n_three-ns-F-nvt.xvg not found!"
gmx angle -f ../$xtc_nvt -n ../$ndx -od angdist_M719_A533_L567_$pdb-$n_three-ns-F-nvt.xvg -ov angaver_M719_A533_L567_$pdb-$n_three-ns-F-nvt.xvg <<EOL
$anglesix
EOL
fi
########################################################
toilet -f mono12 -F metal ANGLES
########################################################
#++++++++++++++++++++++++++ Plot Angles +++++++++++++++++++++++++++
gnuplot <<EOL
reset
set terminal pngcairo  background "#ffffff" noenhanced font "arial-Bold,18" fontscale 1.0 size 1080, 768 
set key on b c inside horizontal
set output 'Angle_M719_A533_L567-$pdb-$n_three.png'
set title "Angle : M719(a14)_A533(a4)_L567(a6)  ($n_three ns)"
set xlabel "Time (ns)"
set ylabel "Angle (\260)"
set grid
set style function linespoints
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 6 dt 1 pi 0 ps 1
set style line 5  lt 7 dt 1 pi 0 ps 1
set style line 6  lt 8 dt 1 pi 0 ps 1
set style line 7  lt 9 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'angaver_M719_A533_L567_$pdb-$n_three-ns-A.xvg' u 1:(column(2)*1) name "A"
stats 'angaver_M719_A533_L567_$pdb-$n_three-ns-B.xvg' u 1:(column(2)*1) name "B"
stats 'angaver_M719_A533_L567_$pdb-$n_three-ns-C.xvg' u 1:(column(2)*1) name "C"
stats 'angaver_M719_A533_L567_$pdb-$n_three-ns-D.xvg' u 1:(column(2)*1) name "D"
stats 'angaver_M719_A533_L567_$pdb-$n_three-ns-E.xvg' u 1:(column(2)*1) name "E"
stats 'angaver_M719_A533_L567_$pdb-$n_three-ns-F.xvg' u 1:(column(2)*1) name "F"
set bmargin 5
set label 10 sprintf("%.4f", A_min_y) center at graph 0.14,-0.17  point pt 7 ps 0  tc lt "1"
set label 11 sprintf("%.4f", A_max_y) center at graph 0.14,-0.21  point pt 7 ps 0  tc lt "1"
set label 12 sprintf("%.4f", B_min_y) center at graph 0.28,-0.17  point pt 7 ps 0  tc lt "2"
set label 13 sprintf("%.4f", B_max_y) center at graph 0.28,-0.21  point pt 7 ps 0  tc lt "2"
set label 14 sprintf("%.4f", C_min_y) center at graph 0.42,-0.17  point pt 7 ps 0  tc lt "4"
set label 15 sprintf("%.4f", C_max_y) center at graph 0.42,-0.21  point pt 7 ps 0  tc lt "4"
set label 16 sprintf("%.4f", D_min_y) center at graph 0.56,-0.17  point pt 7 ps 0  tc lt "6"
set label 17 sprintf("%.4f", D_max_y) center at graph 0.56,-0.21  point pt 7 ps 0  tc lt "6"
set label 18 sprintf("%.4f", E_min_y) center at graph 0.70,-0.17  point pt 7 ps 0  tc lt "7"
set label 19 sprintf("%.4f", E_max_y) center at graph 0.70,-0.21  point pt 7 ps 0  tc lt "7"
set label 20 sprintf("%.4f", F_min_y) center at graph 0.84,-0.17  point pt 7 ps 0  tc lt "8"
set label 21 sprintf("%.4f", F_max_y) center at graph 0.84,-0.21  point pt 7 ps 0  tc lt "8"
set label 22 "Min" c at graph 0,-0.17 point pt 7 ps 0 
set label 23 "Max" c at graph 0,-0.21 point pt 7 ps 0

p 	[0:$n_three][90:180] \
	'angaver_M719_A533_L567_$pdb-$n_three-ns-A-nvt.xvg' u (column(1)/1000):(column(2)*1) w d ls 1 lw 2 t "", \
	'' u (column(1)/1000):(column(2)*1) w l ls 1 lw 3 smooth bezier t '',\
	'angaver_M719_A533_L567_$pdb-$n_three-ns-A-npt.xvg' u ((column(1)/1000)+0.5):(column(2)*1) w d ls 1 lw 2 t "", \
	'' u ((column(1)/1000)+0.5):(column(2)*1) w l ls 1 lw 3 smooth bezier t '',\
	'angaver_M719_A533_L567_$pdb-$n_three-ns-A.xvg' u ((column(1)/1000)+1):(column(2)*1) w d ls 1 lw 2 t "", \
	'' u ((column(1)/1000)+1):(column(2)*1) w l ls 1 lw 3 smooth bezier t 'A',\
	'angaver_M719_A533_L567_$pdb-$n_three-ns-B-nvt.xvg' u (column(1)/1000):(column(2)*1) w d ls 2 lw 2 t "", \
	'' u (column(1)/1000):(column(2)*1) w l ls 2 lw 3 smooth bezier t '',\
	'angaver_M719_A533_L567_$pdb-$n_three-ns-B-npt.xvg' u ((column(1)/1000)+0.5):(column(2)*1) w d ls 2 lw 2 t "", \
	'' u ((column(1)/1000)+0.5):(column(2)*1) w l ls 2 lw 3 smooth bezier t '',\
	'angaver_M719_A533_L567_$pdb-$n_three-ns-B.xvg' u ((column(1)/1000)+1):(column(2)*1) w d ls 2 lw 2 t "", \
	'' u ((column(1)/1000)+1):(column(2)*1) w l ls 2 lw 3 smooth bezier t 'B',\
	'angaver_M719_A533_L567_$pdb-$n_three-ns-C-nvt.xvg' u (column(1)/1000):(column(2)*1) w d ls 3 lw 2 t "", \
	'' u (column(1)/1000):(column(2)*1) w l ls 3 lw 3 smooth bezier t '',\
	'angaver_M719_A533_L567_$pdb-$n_three-ns-C-npt.xvg' u ((column(1)/1000)+0.5):(column(2)*1) w d ls 3 lw 2 t "", \
	'' u ((column(1)/1000)+0.5):(column(2)*1) w l ls 3 lw 3 smooth bezier t '',\
	'angaver_M719_A533_L567_$pdb-$n_three-ns-C.xvg' u ((column(1)/1000)+1):(column(2)*1) w d ls 3 lw 2 t "", \
	'' u ((column(1)/1000)+1):(column(2)*1) w l ls 3 lw 3 smooth bezier t 'C', \
	'angaver_M719_A533_L567_$pdb-$n_three-ns-D-nvt.xvg' u (column(1)/1000):(column(2)*1) w d ls 4 lw 2 t "", \
	'' u (column(1)/1000):(column(2)*1) w l ls 4 lw 3 smooth bezier t '',\
	'angaver_M719_A533_L567_$pdb-$n_three-ns-D-npt.xvg' u ((column(1)/1000)+0.5):(column(2)*1) w d ls 4 lw 2 t "", \
	'' u ((column(1)/1000)+0.5):(column(2)*1) w l ls 4 lw 3 smooth bezier t '',\
	'angaver_M719_A533_L567_$pdb-$n_three-ns-D.xvg' u ((column(1)/1000)+1):(column(2)*1) w d ls 4 lw 2 t "", \
	'' u ((column(1)/1000)+1):(column(2)*1) w l ls 4 lw 3 smooth bezier t 'D',\
	'angaver_M719_A533_L567_$pdb-$n_three-ns-E-nvt.xvg' u (column(1)/1000):(column(2)*1) w d ls 5 lw 2 t "", \
	'' u (column(1)/1000):(column(2)*1) w l ls 5 lw 3 smooth bezier t '',\
	'angaver_M719_A533_L567_$pdb-$n_three-ns-E-npt.xvg' u ((column(1)/1000)+0.5):(column(2)*1) w d ls 5 lw 2 t "", \
	'' u ((column(1)/1000)+0.5):(column(2)*1) w l ls 5 lw 3 smooth bezier t '',\
	'angaver_M719_A533_L567_$pdb-$n_three-ns-E.xvg' u ((column(1)/1000)+1):(column(2)*1) w d ls 5 lw 2 t "", \
	'' u ((column(1)/1000)+1):(column(2)*1) w l ls 5 lw 3 smooth bezier t 'E',\
	'angaver_M719_A533_L567_$pdb-$n_three-ns-F-nvt.xvg' u (column(1)/1000):(column(2)*1) w d ls 6 lw 2 t "", \
	'' u (column(1)/1000):(column(2)*1) w l ls 6 lw 3 smooth bezier t '',\
	'angaver_M719_A533_L567_$pdb-$n_three-ns-F-npt.xvg' u ((column(1)/1000)+0.5):(column(2)*1) w d ls 6 lw 2 t "", \
	'' u ((column(1)/1000)+0.5):(column(2)*1) w l ls 6 lw 3 smooth bezier t '',\
	'angaver_M719_A533_L567_$pdb-$n_three-ns-F.xvg' u ((column(1)/1000)+1):(column(2)*1) w d ls 6 lw 2 t "", \
	'' u ((column(1)/1000)+1):(column(2)*1) w l ls 6 lw 3 smooth bezier t 'F'
EOL
##########################################################################
mkdir ../Gyrate
cd ../Gyrate		#path=MD_Traj_Protein/Gyrate
#+++++++++++++++++++++++++++ Calculate Radius of Gyration ++++++++++++++++ 
if [ ! -f gyrate-$MD-tot$n_three-ns.xvg ]; then
echo 1 | gmx gyrate -s ../$gro -f ../$MD-complete$n_three-protein.xtc -o gyrate-$MD-tot$n_three-ns.xvg
fi
####################### Gyration Plots ######################################
gnuplot <<EOL
reset
set terminal pngcairo  background "#ffffff" enhanced font "arial-Bold,18" fontscale 1.0 size 1080, 768 
set key on b c inside horizontal
set output 'Gyrate-$pdb-$n_three.png'
set title "Radius of Gyration ($n_three ns)\n{/*0.5 $TITLE + $subTITLE}"
set xlabel "Time (ns)"
set ylabel "Rg (\305)"
set grid
set style function linespoints
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 6 dt 1 pi 0 ps 1
set style line 5  lt 7 dt 1 pi 0 ps 1
set style line 6  lt 8 dt 1 pi 0 ps 1
set style line 7  lt 9 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'gyrate-$MD-tot$n_three-ns.xvg' u 1:(column(2)*10) name "Rg"
stats 'gyrate-$MD-tot$n_three-ns.xvg' u 1:(column(3)*10) name "Rgx"
stats 'gyrate-$MD-tot$n_three-ns.xvg' u 1:(column(4)*10) name "Rgy"
stats 'gyrate-$MD-tot$n_three-ns.xvg' u 1:(column(5)*10) name "Rgz"

set bmargin 5
set label 10 sprintf("%.4f", Rg_min_y) center at graph 0.14,-0.17  point pt 7 ps 0  tc lt "1"
set label 11 sprintf("%.4f", Rg_max_y) center at graph 0.14,-0.21  point pt 7 ps 0  tc lt "1"
set label 12 sprintf("%.4f", Rgx_min_y) center at graph 0.28,-0.17  point pt 7 ps 0  tc lt "2"
set label 13 sprintf("%.4f", Rgx_max_y) center at graph 0.28,-0.21  point pt 7 ps 0  tc lt "2"
set label 14 sprintf("%.4f", Rgy_min_y) center at graph 0.42,-0.17  point pt 7 ps 0  tc lt "4"
set label 15 sprintf("%.4f", Rgy_max_y) center at graph 0.42,-0.21  point pt 7 ps 0  tc lt "4"
set label 16 sprintf("%.4f", Rgz_min_y) center at graph 0.56,-0.17  point pt 7 ps 0  tc lt "6"
set label 17 sprintf("%.4f", Rgz_max_y) center at graph 0.56,-0.21  point pt 7 ps 0  tc lt "6"

set label 22 "Min" c at graph 0,-0.17 point pt 7 ps 0 
set label 23 "Max" c at graph 0,-0.21 point pt 7 ps 0

p 	[0:][] \
'gyrate-$MD-tot$n_three-ns.xvg' u (column(1)):(column(2)*10) w d ls 1 lw 2 t "", \
'' u (column(1)):(column(2)*10) w l ls 1 lw 3 smooth bezier t 'Rg',\
'gyrate-$MD-tot$n_three-ns.xvg' u (column(1)):(column(3)*10) w d ls 2 lw 2 t "", \
'' u (column(1)):(column(3)*10) w l ls 2 lw 3 smooth bezier t 'Rg_X',\
'gyrate-$MD-tot$n_three-ns.xvg' u (column(1)):(column(4)*10) w d ls 3 lw 2 t "", \
'' u (column(1)):(column(4)*10) w l ls 3 lw 3 smooth bezier t 'Rg_Y', \
'gyrate-$MD-tot$n_three-ns.xvg' u (column(1)):(column(5)*10) w d ls 4 lw 2 t "", \
'' u (column(1)):(column(5)*10) w l ls 4 lw 3 smooth bezier t 'Rg_Z'
EOL
#####


#+++++++++++++++++++++++++++ Calculate RMSF +++++++++++++++++++++++++++++++++
mkdir ../RMSD
cd ../RMSD		##path=MD_Traj_Protein/RMSD
if [ ! -f rmsd-$MD-$n_three.xvg ]; then
echo 4 |  gmx rmsf -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsf-$MD-$n_three.xvg -res
fi
#+++++++++++++++++++++++++++ Calculate RMSD +++++++++++++++++++++++++++++++++
if [ ! -f rmsd-$MD-$n_three.xvg ]; then
echo 4 4 | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$n_three.xvg -tu ns
fi
#+++++++++++++++++++++++++++ Calculate RMSD wrt average PDB ++++++++++++++++ 
if [ ! -f $MD-average.pdb ]; then
echo 4 | gmx rmsf -f ../$MD-complete$n_three-protein.xtc -s ../$gro -ox $MD-average.pdb -res
fi

if [ ! -f md_rmsd_vs_average.xvg ]; then
echo 4 4 | gmx rms -f ../$MD-complete$n_three-protein.xtc -s $MD-average.pdb -o md_rmsd_vs_average.xvg
fi

for x in {A..F}
do
    echo "$x"
	if [ $x == A ]; then
	   	head -n 17 rmsf-$MD-$n_three.xvg > rmsf-$MD-$n_three-$x.xvg
		sed -n '18,321p' rmsf-$MD-$n_three.xvg >> rmsf-$MD-$n_three-$x.xvg
	elif [ $x == B ]; then
		head -n 17 rmsf-$MD-$n_three.xvg > rmsf-$MD-$n_three-$x.xvg
		sed -n '322,625p' rmsf-$MD-$n_three.xvg >> rmsf-$MD-$n_three-$x.xvg
	elif [ $x == C ]; then
		head -n 17 rmsf-$MD-$n_three.xvg > rmsf-$MD-$n_three-$x.xvg
		sed -n '626,929p' rmsf-$MD-$n_three.xvg >> rmsf-$MD-$n_three-$x.xvg
	elif [ $x == D ]; then
		head -n 17 rmsf-$MD-$n_three.xvg > rmsf-$MD-$n_three-$x.xvg
		sed -n '930,1233p' rmsf-$MD-$n_three.xvg >> rmsf-$MD-$n_three-$x.xvg
	elif [ $x == E ]; then
		head -n 17 rmsf-$MD-$n_three.xvg > rmsf-$MD-$n_three-$x.xvg
		sed -n '1234,1537p' rmsf-$MD-$n_three.xvg >> rmsf-$MD-$n_three-$x.xvg
	else [ $x == F ]
		head -n 17 rmsf-$MD-$n_three.xvg > rmsf-$MD-$n_three-$x.xvg
		sed -n '1538,1841p' rmsf-$MD-$n_three.xvg >> rmsf-$MD-$n_three-$x.xvg
	fi
done
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
########################################################
toilet -f mono12 -F metal FEL
########################################################
#+++++++++++++++++++++++++++ Calculate FEL  +++++++++++++++++++++++++++++++++
mkdir ../FEL
cd ../FEL		#path=MD_Traj_Protein/FEL
if [ ! -f xpm2txt.py ]; then
cp /home/varikord/data_2tb/spastin/MD-Analysis/xpm2txt.py .
cp /home/varikord/data_2tb/spastin/MD-Analysis/sham.pl .
sham=sham.pl
xpm2txt=xpm2txt.py

File1=../RMSD/md_rmsd_vs_average.xvg #R406_K369_K461.dat	#rmsd-md-5WC0_HEX_ATP.xvg		#Average RMSD; Distance; Angle; Dih. Angle; Temperature; Pressure
File2=../DISTANCE/Y556_C713_$pdb-$n_three-ns.xvg #gyrate-$MD-tot$n-ns.xvg 		#Average RMSD; Distance; Angle; Dih. Angle; Temperature; Pressure
#File2=../Y556_Y556_AtoF_16-ns.xvg
#File2=../V456_Y556_AtoF_16-ns.xvg
############
# Set SHAM GRID
# Set SHAM GRID
x1=50
y1=50
z1=50
# Set GNUPLOT GRID
d1=50
d2=50
#+++++++++++ Calculations for Free Energy Landscape ++++++++++++
#######################++++++++++ CHAIN A ++++++++++######################################
rm gsham_input_A.xvg free-energy-landscape_A.xpm

perl $sham -i1 $File1 -i2 $File2 -data1 1 -data2 1 -o gsham_input_A.xvg

gmx sham -f gsham_input_A.xvg -ls free-energy-landscape_A.xpm -ngrid $x1 $y1 $z1

rm \#ener.xvg.1# \#bindex.ndx.1# \#shamlog.log.1# \#prob.xpm.1# \#free-energy-landscape.xpm.1# \#enthalpy.xpm.1# \#entropy.xpm.1#

#xpm2txt -f free-energy-landscape.xpm -o free-energy-landscape.dat
python2.7 $xpm2txt -f free-energy-landscape_A.xpm -o free-energy-landscape_A.dat


####################### Free Energy Landscape Plots ######################################
gnuplot <<EOL
reset
set terminal pngcairo  background "#ffffff" enhanced font "Times-New-Roman-Bold,20" fontscale 1.0 size 1280, 720 
set key on b c outside horizontal
set output 'FEL_A.png'
set title "$TITLE + $subTITLE: Free Energy Landscape (A)"
set xlabel "RMSD vs Average PDB (\305)" rotate parallel
set ylabel "Distance Y556-C713 (\305)" rotate parallel
set zlabel "Gibbs Free Energy" rotate parallel
set grid
unset key

set pm3d implicit at b
#set palette rgbformulae 21,22,23
set view map scale 1
unset surface

#set contour base
set dgrid3d $d1,$d2
set hidden3d
sp 'free-energy-landscape_A.dat' u 1:2:3 w l

EOL

#######################++++++++++ CHAIN B ++++++++++######################################

rm gsham_input_B.xvg free-energy-landscape_B.xpm

perl $sham -i1 $File1 -i2 $File2 -data1 1 -data2 2 -o gsham_input_B.xvg

gmx sham -f gsham_input_B.xvg -ls free-energy-landscape_B.xpm -ngrid $x1 $y1 $z1

rm \#ener.xvg.1# \#bindex.ndx.1# \#shamlog.log.1# \#prob.xpm.1# \#free-energy-landscape.xpm.1# \#enthalpy.xpm.1# \#entropy.xpm.1#

#xpm2txt -f free-energy-landscape.xpm -o free-energy-landscape.dat
python2.7 $xpm2txt -f free-energy-landscape_B.xpm -o free-energy-landscape_B.dat


####################### Free Energy Landscape Plots ######################################
gnuplot <<EOL
reset
set terminal pngcairo  background "#ffffff" enhanced font "Times-New-Roman-Bold,20" fontscale 1.0 size 1280, 720 
set key on b c outside horizontal
set output 'FEL_B.png'
set title "$TITLE + $subTITLE: Free Energy Landscape (B)"
set xlabel "RMSD vs Average PDB (\305)" rotate parallel
set ylabel "Distance Y556-C713 (\305)" rotate parallel
set zlabel "Gibbs Free Energy" rotate parallel
set grid
unset key

set pm3d implicit at b
set view map scale 1
unset surface

#set contour base
set dgrid3d $d1,$d2
set hidden3d
sp 'free-energy-landscape_B.dat' u 1:2:3 w l

EOL

#######################++++++++++  CHAIN C  +++++++++++######################################

rm gsham_input_C.xvg free-energy-landscape_C.xpm

perl $sham -i1 $File1 -i2 $File2 -data1 1 -data2 3 -o gsham_input_C.xvg

gmx sham -f gsham_input_C.xvg -ls free-energy-landscape_C.xpm -ngrid $x1 $y1 $z1

rm \#ener.xvg.1# \#bindex.ndx.1# \#shamlog.log.1# \#prob.xpm.1# \#free-energy-landscape.xpm.1# \#enthalpy.xpm.1# \#entropy.xpm.1#

#xpm2txt -f free-energy-landscape.xpm -o free-energy-landscape.dat
python2.7 $xpm2txt -f free-energy-landscape_C.xpm -o free-energy-landscape_C.dat


####################### Free Energy Landscape Plots ######################################
gnuplot <<EOL
reset
set terminal pngcairo  background "#ffffff" enhanced font "Times-New-Roman-Bold,20" fontscale 1.0 size 1280, 720 
set key on b c outside horizontal
set output 'FEL_C.png'
set title "$TITLE + $subTITLE: Free Energy Landscape (C)"
set xlabel "RMSD vs Average PDB (\305)" rotate parallel
set ylabel "Distance Y556-C713 (\305)" rotate parallel
set zlabel "Gibbs Free Energy" rotate parallel
set grid
unset key

set pm3d implicit at b
set view map scale 1
unset surface

#set contour base
set dgrid3d $d1,$d2
set hidden3d
sp 'free-energy-landscape_C.dat' u 1:2:3 w l

EOL
#######################++++++++++  CHAIN D  +++++++++++###################################

rm gsham_input_D.xvg free-energy-landscape_D.xpm

perl $sham -i1 $File1 -i2 $File2 -data1 1 -data2 4 -o gsham_input_D.xvg

gmx sham -f gsham_input_D.xvg -ls free-energy-landscape_D.xpm -ngrid $x1 $y1 $z1

rm \#ener.xvg.1# \#bindex.ndx.1# \#shamlog.log.1# \#prob.xpm.1# \#free-energy-landscape.xpm.1# \#enthalpy.xpm.1# \#entropy.xpm.1#

#xpm2txt -f free-energy-landscape.xpm -o free-energy-landscape.dat
python2.7 $xpm2txt -f free-energy-landscape_D.xpm -o free-energy-landscape_D.dat


####################### Free Energy Landscape Plots ######################################
gnuplot <<EOL
reset
set terminal pngcairo  background "#ffffff" noenhanced font "Times-New-Roman-Bold,20" fontscale 1.0 size 1280, 720 
set key on b c outside horizontal
set output 'FEL_D.png'
set title "$TITLE + $subTITLE: Free Energy Landscape (D)"
set xlabel "RMSD vs Average PDB (\305)" rotate parallel
set ylabel "Distance Y556-C713 (\305)" rotate parallel
set zlabel "Gibbs Free Energy" rotate parallel
set grid
unset key

set pm3d implicit at b
set view map scale 1
unset surface

#set contour base
set dgrid3d $d1,$d2
set hidden3d
sp 'free-energy-landscape_D.dat' u 1:2:3 w l

EOL
#######################++++++++++  CHAIN E  +++++++++++######################################

rm gsham_input_E.xvg free-energy-landscape_E.xpm

perl $sham -i1 $File1 -i2 $File2 -data1 1 -data2 5 -o gsham_input_E.xvg

gmx sham -f gsham_input_E.xvg -ls free-energy-landscape_E.xpm -ngrid $x1 $y1 $z1

rm \#ener.xvg.1# \#bindex.ndx.1# \#shamlog.log.1# \#prob.xpm.1# \#free-energy-landscape.xpm.1# \#enthalpy.xpm.1# \#entropy.xpm.1#

#xpm2txt -f free-energy-landscape.xpm -o free-energy-landscape.dat
python2.7 $xpm2txt -f free-energy-landscape_E.xpm -o free-energy-landscape_E.dat


####################### Free Energy Landscape Plots ######################################
gnuplot <<EOL
reset
set terminal pngcairo  background "#ffffff" enhanced font "Times-New-Roman-Bold,20" fontscale 1.0 size 1280, 720 
set key on b c outside horizontal
set output 'FEL_E.png'
set title "$TITLE + $subTITLE: Free Energy Landscape (E)"
set xlabel "RMSD vs Average PDB (\305)" rotate parallel
set ylabel "Distance Y556-C713 (\305)" rotate parallel
set zlabel "Gibbs Free Energy" rotate parallel
set grid
unset key

set pm3d implicit at b
set view map scale 1
unset surface

#set contour base
set dgrid3d $d1,$d2
set hidden3d
sp 'free-energy-landscape_E.dat' u 1:2:3 w l

EOL
#######################++++++++++  CHAIN F  +++++++++++######################################

rm gsham_input_F.xvg free-energy-landscape_F.xpm

perl $sham -i1 $File1 -i2 $File2 -data1 1 -data2 6 -o gsham_input_F.xvg

gmx sham -f gsham_input_F.xvg -ls free-energy-landscape_F.xpm -ngrid $x1 $y1 $z1

rm \#ener.xvg.1# \#bindex.ndx.1# \#shamlog.log.1# \#prob.xpm.1# \#free-energy-landscape.xpm.1# \#enthalpy.xpm.1# \#entropy.xpm.1#

#xpm2txt -f free-energy-landscape.xpm -o free-energy-landscape.dat
python2.7 $xpm2txt -f free-energy-landscape_F.xpm -o free-energy-landscape_F.dat


####################### Free Energy Landscape Plots ######################################
gnuplot <<EOL
reset
set terminal pngcairo  background "#ffffff" enhanced font "Times-New-Roman-Bold,20" fontscale 1.0 size 1280, 720 
set key on b c outside horizontal
set output 'FEL_F.png'
set title "$TITLE + $subTITLE: Free Energy Landscape (F)"
set xlabel "RMSD vs Average PDB (\305)" rotate parallel
set ylabel "Distance Y556-C713 (\305)" rotate parallel
set zlabel "Gibbs Free Energy" rotate parallel
set grid
unset key

set pm3d implicit at b
set view map scale 1
unset surface

#set contour base
set dgrid3d $d1,$d2
set hidden3d
sp 'free-energy-landscape_F.dat' u 1:2:3 w l

EOL
#######################++++++++++++ END ++++++++++++######################################
cd ../RMSD		#path=MD_Traj_Protein/RMSD
#+++++++++++++++++++++++++++++++++ Calculate domain (PQR) RMSD ++++++++++++++++++++++++++++++++++
if [ ! -f rmsd-$MD-$p-$n_three-A.xvg ]; then
    echo "File rmsd-$MD-$p-$n_three-A.xvg not found!"
echo Protein $aone | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$p-$n_three-A.xvg -tu ns -n ../$ndx
fi

if [ ! -f rmsd-$MD-$p-$n_three-B.xvg ]; then
    echo "File rmsd-$MD-$p-$n_three-B.xvg not found!"
echo Protein $bone | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$p-$n_three-B.xvg -tu ns -n ../$ndx
fi

if [ ! -f rmsd-$MD-$p-$n_three-C.xvg ]; then
    echo "File rmsd-$MD-$p-$n_three-C.xvg not found!"
echo Protein $cone | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$p-$n_three-C.xvg -tu ns -n ../$ndx
fi
#**************************
if [ ! -f rmsd-$MD-$p-$n_three-D.xvg ]; then
    echo "File rmsd-$MD-$p-$n_three-D.xvg not found!"
echo Protein $done | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$p-$n_three-D.xvg -tu ns -n ../$ndx
fi

if [ ! -f rmsd-$MD-$p-$n_three-E.xvg ]; then
    echo "File rmsd-$MD-$p-$n_three-E.xvg not found!"
echo Protein $eone | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$p-$n_three-E.xvg -tu ns -n ../$ndx
fi

if [ ! -f rmsd-$MD-$p-$n_three-F.xvg ]; then
    echo "File rmsd-$MD-$p-$n_three-F.xvg not found!"
echo Protein $fone | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$p-$n_three-F.xvg -tu ns -n ../$ndx
fi

################################################
if [ ! -f rmsd-$MD-$q-$n_three-A.xvg ]; then
    echo "File rmsd-$MD-$q-$n_three-A.xvg not found!"
echo Protein $atwo | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$q-$n_three-A.xvg -tu ns -n ../$ndx
fi

if [ ! -f rmsd-$MD-$q-$n_three-B.xvg ]; then
    echo "File rmsd-$MD-$q-$n_three-B.xvg not found!"
echo Protein $btwo | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$q-$n_three-B.xvg -tu ns -n ../$ndx
fi

if [ ! -f rmsd-$MD-$q-$n_three-C.xvg ]; then
    echo "File rmsd-$MD-$q-$n_three-C.xvg not found!"
echo Protein $ctwo | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$q-$n_three-C.xvg -tu ns -n ../$ndx
fi
#**************************
if [ ! -f rmsd-$MD-$q-$n_three-D.xvg ]; then
    echo "File rmsd-$MD-$q-$n_three-D.xvg not found!"
echo Protein $dtwo | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$q-$n_three-D.xvg -tu ns -n ../$ndx
fi

if [ ! -f rmsd-$MD-$q-$n_three-E.xvg ]; then
    echo "File rmsd-$MD-$q-$n_three-E.xvg not found!"
echo Protein $etwo | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$q-$n_three-E.xvg -tu ns -n ../$ndx
fi

if [ ! -f rmsd-$MD-$q-$n_three-F.xvg ]; then
    echo "File rmsd-$MD-$q-$n_three-F.xvg not found!"
echo Protein $ftwo | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$q-$n_three-F.xvg -tu ns -n ../$ndx
fi
#**************************

#################################################
if [ ! -f rmsd-$MD-$r-$n_three-A.xvg ]; then
    echo "File rmsd-$MD-$r-$n_three-A.xvg not found!"
echo Protein $athree | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$r-$n_three-A.xvg -tu ns -n ../$ndx
fi

if [ ! -f rmsd-$MD-$r-$n_three-B.xvg ]; then
    echo "File rmsd-$MD-$r-$n_three-B.xvg not found!"
echo Protein $bthree | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$r-$n_three-B.xvg -tu ns -n ../$ndx
fi

if [ ! -f rmsd-$MD-$r-$n_three-C.xvg ]; then
    echo "File rmsd-$MD-$r-$n_three-C.xvg not found!"
echo Protein $cthree | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$r-$n_three-C.xvg -tu ns -n ../$ndx
fi
#**************************
if [ ! -f rmsd-$MD-$r-$n_three-D.xvg ]; then
    echo "File rmsd-$MD-$r-$n_three-D.xvg not found!"
echo Protein $dthree | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$r-$n_three-D.xvg -tu ns -n ../$ndx
fi

if [ ! -f rmsd-$MD-$r-$n_three-E.xvg ]; then
    echo "File rmsd-$MD-$r-$n_three-E.xvg not found!"
echo Protein $ethree | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$r-$n_three-E.xvg -tu ns -n ../$ndx
fi

if [ ! -f rmsd-$MD-$r-$n_three-F.xvg ]; then
    echo "File rmsd-$MD-$r-$n_three-F.xvg not found!"
echo Protein $fthree | gmx rms -s ../$tpr -f ../$MD-complete$n_three-protein.xtc -o rmsd-$MD-$r-$n_three-F.xvg -tu ns -n ../$ndx
fi
#**************************
########################################################
toilet -f mono12 -F metal RMSD
########################################################
####################### RMSD Plots ######################################
gnuplot <<EOL
reset
set terminal pngcairo  background "#ffffff" enhanced font "Times-New-Roman-Bold,20" fontscale 1.0 size 1280, 720 
set key on b c inside horizontal top
set output 'rmsd-$MD-$p-$n_three.png'
set title "$TITLE + $subTITLE: RMSD $p ($n_three ns)"
set xlabel "Time (ns)"
set ylabel "RMSD (nm)"
set grid
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 5 dt 1 pi 0 ps 1
set style line 5  lt 6 dt 1 pi 0 ps 1
set style line 6  lt 7 dt 1 pi 0 ps 1
set style line 7  lt 8 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'rmsd-$MD-$p-$n_three-A.xvg' u 1:2 name "A"
stats 'rmsd-$MD-$p-$n_three-B.xvg' u 1:2 name "B"
stats 'rmsd-$MD-$p-$n_three-C.xvg' u 1:2 name "C"
stats 'rmsd-$MD-$p-$n_three-D.xvg' u 1:2 name "D"
stats 'rmsd-$MD-$p-$n_three-E.xvg' u 1:2 name "E"
stats 'rmsd-$MD-$p-$n_three-F.xvg' u 1:2 name "F"
stats 'rmsd-$MD-$n_three.xvg' u 1:2 name "Glob"
set bmargin 5
set label 10 sprintf("%.4f", A_min_y) center at graph 0.12,-0.21 point pt 7 ps 0  tc lt "1"
set label 11 sprintf("%.4f", A_max_y) center at graph 0.12,-0.26 point pt 7 ps 0  tc lt "1"
set label 12 sprintf("%.4f", B_min_y) center at graph 0.24,-0.21 point pt 7 ps 0  tc lt "2"
set label 13 sprintf("%.4f", B_max_y) center at graph 0.24,-0.26 point pt 7 ps 0  tc lt "2"
set label 14 sprintf("%.4f", C_min_y) center at graph 0.36,-0.21 point pt 7 ps 0  tc lt "4"
set label 15 sprintf("%.4f", C_max_y) center at graph 0.36,-0.26 point pt 7 ps 0  tc lt "4"
set label 16 sprintf("%.4f", D_min_y) center at graph 0.48,-0.21  point pt 7 ps 0  tc lt "5"
set label 17 sprintf("%.4f", D_max_y) center at graph 0.48,-0.26  point pt 7 ps 0  tc lt "5"
set label 18 sprintf("%.4f", E_min_y) center at graph 0.60,-0.21  point pt 7 ps 0  tc lt "6"
set label 19 sprintf("%.4f", E_max_y) center at graph 0.60,-0.26  point pt 7 ps 0  tc lt "6"
set label 20 sprintf("%.4f", F_min_y) center at graph 0.72,-0.21  point pt 7 ps 0  tc lt "7"
set label 21 sprintf("%.4f", F_max_y) center at graph 0.72,-0.26  point pt 7 ps 0  tc lt "7"
set label 22 sprintf("%.4f", Glob_min_y) center at graph 0.84,-0.21 point pt 7 ps 0  tc lt "8"
set label 23 sprintf("%.4f", Glob_max_y) center at graph 0.84,-0.26 point pt 7 ps 0  tc lt "8"
set label 24 "Min" c at graph 0,-0.21 point pt 7 ps 0 
set label 25 "Max" c at graph 0,-0.26 point pt 7 ps 0

p [0:$n_three][0:2.5]	\
'rmsd-$MD-$p-$n_three-A.xvg'	u 1:2 w d ls 1 lw 3 t "",		'' u 1:2 w l ls 1 lw 3 smooth bezier t 'A',\
'rmsd-$MD-$p-$n_three-B.xvg'	u 1:2 w d ls 2 lw 3 t "",		'' u 1:2 w l ls 2 lw 3 smooth bezier t 'B',\
'rmsd-$MD-$p-$n_three-C.xvg'	u 1:2 w d ls 3 lw 3 t "",		'' u 1:2 w l ls 3 lw 3 smooth bezier t 'C',\
'rmsd-$MD-$p-$n_three-D.xvg'	u 1:2 w d ls 4 lw 3 t "",		'' u 1:2 w l ls 4 lw 3 smooth bezier t 'D',\
'rmsd-$MD-$p-$n_three-E.xvg'	u 1:2 w d ls 5 lw 3 t "",		'' u 1:2 w l ls 5 lw 3 smooth bezier t 'E',\
'rmsd-$MD-$p-$n_three-F.xvg'	u 1:2 w d ls 6 lw 3 t "",		'' u 1:2 w l ls 6 lw 3 smooth bezier t 'F',\
'rmsd-$MD-$n_three.xvg'		u 1:2 w d ls 7 lw 3 t "",		'' u 1:2 w l ls 7 lw 3 smooth bezier t 'Global-RMSD'

#####
reset
set terminal pngcairo  background "#ffffff" enhanced font "Times-New-Roman-Bold,20" fontscale 1.0 size 1280, 720 
set key on b c inside horizontal top
set output 'rmsd-$MD-$q-$n_three.png'
set title "$TITLE + $subTITLE: RMSD $q ($n_three ns)"
set xlabel "Time (ns)"
set ylabel "RMSD (nm)"
set grid
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 5 dt 1 pi 0 ps 1
set style line 5  lt 6 dt 1 pi 0 ps 1
set style line 6  lt 7 dt 1 pi 0 ps 1
set style line 7  lt 8 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'rmsd-$MD-$q-$n_three-A.xvg' u 1:2 name "A"
stats 'rmsd-$MD-$q-$n_three-B.xvg' u 1:2 name "B"
stats 'rmsd-$MD-$q-$n_three-C.xvg' u 1:2 name "C"
stats 'rmsd-$MD-$q-$n_three-D.xvg' u 1:2 name "D"
stats 'rmsd-$MD-$q-$n_three-E.xvg' u 1:2 name "E"
stats 'rmsd-$MD-$q-$n_three-F.xvg' u 1:2 name "F"
stats 'rmsd-$MD-$n_three.xvg' u 1:2 name "Glob"
set bmargin 5
set label 10 sprintf("%.4f", A_min_y) center at graph 0.12,-0.21 point pt 7 ps 0  tc lt "1"
set label 11 sprintf("%.4f", A_max_y) center at graph 0.12,-0.26 point pt 7 ps 0  tc lt "1"
set label 12 sprintf("%.4f", B_min_y) center at graph 0.24,-0.21 point pt 7 ps 0  tc lt "2"
set label 13 sprintf("%.4f", B_max_y) center at graph 0.24,-0.26 point pt 7 ps 0  tc lt "2"
set label 14 sprintf("%.4f", C_min_y) center at graph 0.36,-0.21 point pt 7 ps 0  tc lt "4"
set label 15 sprintf("%.4f", C_max_y) center at graph 0.36,-0.26 point pt 7 ps 0  tc lt "4"
set label 16 sprintf("%.4f", D_min_y) center at graph 0.48,-0.21  point pt 7 ps 0  tc lt "5"
set label 17 sprintf("%.4f", D_max_y) center at graph 0.48,-0.26  point pt 7 ps 0  tc lt "5"
set label 18 sprintf("%.4f", E_min_y) center at graph 0.60,-0.21  point pt 7 ps 0  tc lt "6"
set label 19 sprintf("%.4f", E_max_y) center at graph 0.60,-0.26  point pt 7 ps 0  tc lt "6"
set label 20 sprintf("%.4f", F_min_y) center at graph 0.72,-0.21  point pt 7 ps 0  tc lt "7"
set label 21 sprintf("%.4f", F_max_y) center at graph 0.72,-0.26  point pt 7 ps 0  tc lt "7"
set label 22 sprintf("%.4f", Glob_min_y) center at graph 0.84,-0.21 point pt 7 ps 0  tc lt "8"
set label 23 sprintf("%.4f", Glob_max_y) center at graph 0.84,-0.26 point pt 7 ps 0  tc lt "8"
set label 24 "Min" c at graph 0,-0.21 point pt 7 ps 0 
set label 25 "Max" c at graph 0,-0.26 point pt 7 ps 0

p [0:$n_three][0:2.5]	\
'rmsd-$MD-$q-$n_three-A.xvg'	u 1:2 w d ls 1 lw 3 t "",		'' u 1:2 w l ls 1 lw 3 smooth bezier t 'A',\
'rmsd-$MD-$q-$n_three-B.xvg'	u 1:2 w d ls 2 lw 3 t "",		'' u 1:2 w l ls 2 lw 3 smooth bezier t 'B',\
'rmsd-$MD-$q-$n_three-C.xvg'	u 1:2 w d ls 3 lw 3 t "",		'' u 1:2 w l ls 3 lw 3 smooth bezier t 'C',\
'rmsd-$MD-$q-$n_three-D.xvg'	u 1:2 w d ls 4 lw 3 t "",		'' u 1:2 w l ls 4 lw 3 smooth bezier t 'D',\
'rmsd-$MD-$q-$n_three-E.xvg'	u 1:2 w d ls 5 lw 3 t "",		'' u 1:2 w l ls 5 lw 3 smooth bezier t 'E',\
'rmsd-$MD-$q-$n_three-F.xvg'	u 1:2 w d ls 6 lw 3 t "",		'' u 1:2 w l ls 6 lw 3 smooth bezier t 'F',\
'rmsd-$MD-$n_three.xvg'		u 1:2 w d ls 7 lw 3 t "",		'' u 1:2 w l ls 7 lw 3 smooth bezier t 'Global-RMSD'

#####
reset
set terminal pngcairo  background "#ffffff" enhanced font "Times-New-Roman-Bold,20" fontscale 1.0 size 1280, 720 
set key on t c inside horizontal top
set output 'rmsd-$MD-$r-$n_three.png'
set title "$TITLE + $subTITLE: RMSD $r ($n_three ns)"
set xlabel "Time (ns)"
set ylabel "RMSD (nm)"
set grid
set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 5 dt 1 pi 0 ps 1
set style line 5  lt 6 dt 1 pi 0 ps 1
set style line 6  lt 7 dt 1 pi 0 ps 1
set style line 7  lt 8 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

stats 'rmsd-$MD-$r-$n_three-A.xvg' u 1:2 name "A"
stats 'rmsd-$MD-$r-$n_three-B.xvg' u 1:2 name "B"
stats 'rmsd-$MD-$r-$n_three-C.xvg' u 1:2 name "C"
stats 'rmsd-$MD-$r-$n_three-D.xvg' u 1:2 name "D"
stats 'rmsd-$MD-$r-$n_three-E.xvg' u 1:2 name "E"
stats 'rmsd-$MD-$r-$n_three-F.xvg' u 1:2 name "F"
stats 'rmsd-$MD-$n_three.xvg' u 1:2 name "Glob"
set bmargin 5
set label 10 sprintf("%.4f", A_min_y) center at graph 0.12,-0.21 point pt 7 ps 0  tc lt "1"
set label 11 sprintf("%.4f", A_max_y) center at graph 0.12,-0.26 point pt 7 ps 0  tc lt "1"
set label 12 sprintf("%.4f", B_min_y) center at graph 0.24,-0.21 point pt 7 ps 0  tc lt "2"
set label 13 sprintf("%.4f", B_max_y) center at graph 0.24,-0.26 point pt 7 ps 0  tc lt "2"
set label 14 sprintf("%.4f", C_min_y) center at graph 0.36,-0.21 point pt 7 ps 0  tc lt "4"
set label 15 sprintf("%.4f", C_max_y) center at graph 0.36,-0.26 point pt 7 ps 0  tc lt "4"
set label 16 sprintf("%.4f", D_min_y) center at graph 0.48,-0.21  point pt 7 ps 0  tc lt "5"
set label 17 sprintf("%.4f", D_max_y) center at graph 0.48,-0.26  point pt 7 ps 0  tc lt "5"
set label 18 sprintf("%.4f", E_min_y) center at graph 0.60,-0.21  point pt 7 ps 0  tc lt "6"
set label 19 sprintf("%.4f", E_max_y) center at graph 0.60,-0.26  point pt 7 ps 0  tc lt "6"
set label 20 sprintf("%.4f", F_min_y) center at graph 0.72,-0.21  point pt 7 ps 0  tc lt "7"
set label 21 sprintf("%.4f", F_max_y) center at graph 0.72,-0.26  point pt 7 ps 0  tc lt "7"
set label 22 sprintf("%.4f", Glob_min_y) center at graph 0.84,-0.21 point pt 7 ps 0  tc lt "8"
set label 23 sprintf("%.4f", Glob_max_y) center at graph 0.84,-0.26 point pt 7 ps 0  tc lt "8"
set label 24 "Min" c at graph 0,-0.21 point pt 7 ps 0 
set label 25 "Max" c at graph 0,-0.26 point pt 7 ps 0

p [0:$n_three][0:2.5]	\
'rmsd-$MD-$r-$n_three-A.xvg'	u 1:2 w d ls 1 lw 3 t "",		'' u 1:2 w l ls 1 lw 3 smooth bezier t 'A',\
'rmsd-$MD-$r-$n_three-B.xvg'	u 1:2 w d ls 2 lw 3 t "",		'' u 1:2 w l ls 2 lw 3 smooth bezier t 'B',\
'rmsd-$MD-$r-$n_three-C.xvg'	u 1:2 w d ls 3 lw 3 t "",		'' u 1:2 w l ls 3 lw 3 smooth bezier t 'C',\
'rmsd-$MD-$r-$n_three-D.xvg'	u 1:2 w d ls 4 lw 3 t "",		'' u 1:2 w l ls 4 lw 3 smooth bezier t 'D',\
'rmsd-$MD-$r-$n_three-E.xvg'	u 1:2 w d ls 5 lw 3 t "",		'' u 1:2 w l ls 5 lw 3 smooth bezier t 'E',\
'rmsd-$MD-$r-$n_three-F.xvg'	u 1:2 w d ls 6 lw 3 t "",		'' u 1:2 w l ls 6 lw 3 smooth bezier t 'F',\
'rmsd-$MD-$n_three.xvg'		u 1:2 w d ls 7 lw 3 t "",		'' u 1:2 w l ls 7 lw 3 smooth bezier t 'Global-RMSD'
EOL
########################################################
toilet -f mono12 -F metal RMSF
########################################################
sed -n '18,321p' rmsf-$MD-$n_three-A.xvg > outA.xvg
sed -n '18,321p' rmsf-$MD-$n_three-B.xvg > outB.xvg
sed -n '18,321p' rmsf-$MD-$n_three-C.xvg > outC.xvg
sed -n '18,321p' rmsf-$MD-$n_three-D.xvg > outD.xvg
sed -n '18,321p' rmsf-$MD-$n_three-E.xvg > outE.xvg
sed -n '18,321p' rmsf-$MD-$n_three-F.xvg > outF.xvg

awk '{print $2'} outA.xvg > outAA.xvg
awk '{print $2'} outB.xvg > outBB.xvg
awk '{print $2'} outC.xvg > outCC.xvg
awk '{print $2'} outD.xvg > outDD.xvg
awk '{print $2'} outE.xvg > outEE.xvg
awk '{print $2'} outF.xvg > outFF.xvg

paste outA.xvg outBB.xvg outCC.xvg outDD.xvg outEE.xvg outFF.xvg > rmsf_AtoF_$pdb-$n_three.xvg
rm out*
############### RMSF Plot ##########################################
gnuplot <<EOL
reset
set terminal pngcairo  background "#ffffff" enhanced font "arial-Bold,18" fontscale 1.0 size 1080, 768 
set output 'rmsf-$MD-$n_three.png'
set title "RMSF : $TITLE + $subTITLE ($n_three ns)"
set xlabel "Residue"
set ylabel "(\305)"
set style rect fc lt -1 fs solid 0.15 noborder
set grid
set style function linespoints
set style line 1  lt 1  pi 0 ps 0 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2  pi 0 ps 0
set style line 3  lt 4  pi 0 ps 0
set style line 4  lt 6  pi 0 ps 0
set style line 5  lt 7  pi 0 ps 0
set style line 6  lt 8  pi 0 ps 0

set obj rect from 551, graph 0 to 558, graph 1 fc rgb "cyan"
set label 1 "(551-558 PL1)" at 554.5, 8, 0.00000 center norotate back nopoint rot 90
set obj rect from 706, graph 0 to 717, graph 1 
set label 2 "(706-717)" at 711.5, 8.5, 0.00000 center norotate back nopoint rot 90 front
set obj rect from 505, graph 0 to 518, graph 1 fc rgb "blue"
set label 3 "(505-518)" at 511.5, 8, 0.00000 center norotate back nopoint rot 90
set obj rect from 665, graph 0 to 674, graph 1
set label 4 "(665-674)" at 669.5, 8, 0.00000 center norotate back nopoint rot 90
set obj rect from 586, graph 0 to 593, graph 1
set label 5 "(586-593 PL2)" at 589.5, 8, 0.00000 center norotate back nopoint rot 90
set obj rect from 523, graph 0 to 530, graph 1
set label 6 "(523-530 WA)" at 526.5, 8, 0.00000 center norotate back nopoint rot 90
set obj rect from 580, graph 0 to 583, graph 1
set label 7 "(580-583 WB)" at 581.5, 8, 0.00000 center norotate back nopoint rot 90
set obj rect from 630, graph 0 to 635, graph 1
set label 8 "(630-635 PL3)" at 632.5, 8, 0.00000 center norotate back nopoint rot 90
set obj rect from 612, graph 0 to 619, graph 1
set label 9 "(612-619)" at 615.5, 8, 0.00000 center norotate back nopoint rot 90

set style rect fc lt -1 fs solid 0.6 noborder
set obj rect from 455, graph 0.00 to 463, graph 0.03, graph 1 fc rgb "green" 
set obj rect from 463, graph 0.00 to 472, graph 0.03, graph 1 fc rgb "red"
set obj rect from 472, graph 0.00 to 481, graph 0.03, graph 1 fc rgb "green"
set obj rect from 481, graph 0.00 to 484, graph 0.03, graph 1 fc rgb "red"
set obj rect from 484, graph 0.00 to 488, graph 0.03, graph 1 fc rgb "green"
set obj rect from 488, graph 0.00 to 504, graph 0.03, graph 1 fc rgb "yellow"
set obj rect from 504, graph 0.00 to 517, graph 0.03, graph 1 fc rgb "green"
set obj rect from 517, graph 0.00 to 522, graph 0.03, graph 1 fc rgb "yellow"
set obj rect from 522, graph 0.00 to 528, graph 0.03, graph 1 fc rgb "green"
set obj rect from 528, graph 0.00 to 538, graph 0.03, graph 1 fc rgb "red"
set obj rect from 538, graph 0.00 to 542, graph 0.03, graph 1 fc rgb "green"
set obj rect from 542, graph 0.00 to 547, graph 0.03, graph 1 fc rgb "yellow"
set obj rect from 547, graph 0.00 to 558, graph 0.03, graph 1 fc rgb "green"
set obj rect from 558, graph 0.00 to 573, graph 0.03, graph 1 fc rgb "red"
set obj rect from 573, graph 0.00 to 576, graph 0.03, graph 1 fc rgb "green"
set obj rect from 576, graph 0.00 to 583, graph 0.03, graph 1 fc rgb "yellow"
set obj rect from 583, graph 0.00 to 588, graph 0.03, graph 1 fc rgb "red"
set obj rect from 588, graph 0.00 to 596, graph 0.03, graph 1 fc rgb "green"
set obj rect from 596, graph 0.00 to 611, graph 0.03, graph 1 fc rgb "red"
set obj rect from 611, graph 0.00 to 620, graph 0.03, graph 1 fc rgb "green"
set obj rect from 620, graph 0.00 to 628, graph 0.03, graph 1 fc rgb "yellow"
set obj rect from 628, graph 0.00 to 630, graph 0.03, graph 1 fc rgb "green"
set obj rect from 630, graph 0.00 to 633, graph 0.03, graph 1 fc rgb "red"
set obj rect from 633, graph 0.00 to 635, graph 0.03, graph 1 fc rgb "green"
set obj rect from 635, graph 0.00 to 640, graph 0.03, graph 1 fc rgb "red"
set obj rect from 640, graph 0.00 to 643, graph 0.03, graph 1 fc rgb "green"
set obj rect from 643, graph 0.00 to 648, graph 0.03, graph 1 fc rgb "yellow"
set obj rect from 648, graph 0.00 to 652, graph 0.03, graph 1 fc rgb "green"
set obj rect from 652, graph 0.00 to 667, graph 0.03, graph 1 fc rgb "red"
set obj rect from 667, graph 0.00 to 672, graph 0.03, graph 1 fc rgb "green"
set obj rect from 672, graph 0.00 to 682, graph 0.03, graph 1 fc rgb "red"
set obj rect from 681, graph 0.00 to 687, graph 0.03, graph 1 fc rgb "green"
set obj rect from 687, graph 0.00 to 705, graph 0.03, graph 1 fc rgb "red"
set obj rect from 705, graph 0.00 to 707, graph 0.03, graph 1 fc rgb "green"
set obj rect from 707, graph 0.00 to 713, graph 0.03, graph 1 fc rgb "red"
set obj rect from 713, graph 0.00 to 723, graph 0.03, graph 1 fc rgb "green"
set obj rect from 723, graph 0.00 to 733, graph 0.03, graph 1 fc rgb "red"
set obj rect from 733, graph 0.00 to 739, graph 0.03, graph 1 fc rgb "green"
set obj rect from 739, graph 0.00 to 752, graph 0.03, graph 1 fc rgb "red"
set obj rect from 752, graph 0.00 to 758, graph 0.03, graph 1 fc rgb "green"

set grid
#Stattistics
stats 'rmsf-$MD-$n_three-A.xvg' u 1:(column(2)*10) name "A"
stats 'rmsf-$MD-$n_three-B.xvg' u 1:(column(2)*10) name "B"
stats 'rmsf-$MD-$n_three-C.xvg' u 1:(column(2)*10) name "C"
stats 'rmsf-$MD-$n_three-D.xvg' u 1:(column(2)*10) name "D"
stats 'rmsf-$MD-$n_three-E.xvg' u 1:(column(2)*10) name "E"
stats 'rmsf-$MD-$n_three-F.xvg' u 1:(column(2)*10) name "F"

#set label 10 sprintf("%.4f", A_min_y) center at first A_pos_min_y,A_min_y point pt 7 ps 1 offset 0,14 tc lt "1" ; for example format
#set label 11 sprintf("%.4f", A_max_y) center at first A_pos_max_y,A_max_y point pt 7 ps 1 offset 0,13 tc lt "1" ; for example format

set label 10 sprintf("%.4f", A_min_y) center at first 500,14 point pt 7 ps 0  tc lt "1"
set label 11 sprintf("%.4f", A_max_y) center at first 500,13 point pt 7 ps 0  tc lt "1"
set label 12 sprintf("%.4f", B_min_y) center at first 530,14 point pt 7 ps 0  tc lt "2"
set label 13 sprintf("%.4f", B_max_y) center at first 530,13 point pt 7 ps 0  tc lt "2"
set label 14 sprintf("%.4f", C_min_y) center at first 570,14 point pt 7 ps 0  tc lt "4"
set label 15 sprintf("%.4f", C_max_y) center at first 570,13 point pt 7 ps 0  tc lt "4"
set label 16 sprintf("%.4f", D_min_y) center at first 610,14  point pt 7 ps 0  tc lt "6"
set label 17 sprintf("%.4f", D_max_y) center at first 610,13  point pt 7 ps 0  tc lt "6"
set label 18 sprintf("%.4f", E_min_y) center at first 650,14  point pt 7 ps 0  tc lt "7"
set label 19 sprintf("%.4f", E_max_y) center at first 650,13  point pt 7 ps 0  tc lt "7"
set label 20 sprintf("%.4f", F_min_y) center at first 690,14  point pt 7 ps 0  tc lt "8"
set label 21 sprintf("%.4f", F_max_y) center at first 690,13  point pt 7 ps 0  tc lt "8"

set label 22 "Min" c at 470,14 point pt 7 ps 0 
set label 23 "Max" c at 470,13 point pt 7 ps 0 

p [455:758][0:16] \
'rmsf-$MD-$n_three-A.xvg' u 1:(column(2)*10) w l ls 1 lw 3 t "A", \
'rmsf-$MD-$n_three-B.xvg' u 1:(column(2)*10) w l ls 2 lw 3 t "B", \
'rmsf-$MD-$n_three-C.xvg' u 1:(column(2)*10) w l ls 3 lw 3 t "C", \
'rmsf-$MD-$n_three-D.xvg' u 1:(column(2)*10) w l ls 4 lw 3 t "D", \
'rmsf-$MD-$n_three-E.xvg' u 1:(column(2)*10) w l ls 5 lw 3 t "E", \
'rmsf-$MD-$n_three-F.xvg' u 1:(column(2)*10) w l ls 6 lw 3 t "F"
EOL
########################################################
toilet -f mono12 -F metal BIO3D
########################################################
cd ../
mkdir bio3d
cd bio3d

if [ ! -f $MDtpr-protein.gro ]; then
gmx trjconv -f ../../$MDtpr.gro -o $MD-protein.gro -s ../../$MDtpr.tpr <<EOL
C-alpha
EOL
fi

rm index.ndx
gmx make_ndx -f ../../$MDtpr.gro -o index.ndx << EOL
3 & a 1-8949
3 & a 2984-11932
3 & a 5967-14915
3 & a 8950-17898
3 & a 1-17898
q
EOL

abc="C-alpha_&_a_1-8949";
bcd="C-alpha_&_a_2984-11932";
cde="C-alpha_&_a_5967-14915";
def="C-alpha_&_a_8950-17898";
atof="C-alpha_&_a_1-17898";

if [ ! -f $MD-protein.pdb ]; then
gmx editconf -f $MD-protein.gro -o $MD-protein.pdb
fi

if [ ! -f $MD-protein_abc.gro ]; then
gmx trjconv -f ../../$MDtpr.gro -o $MD-protein_abc.gro -s ../../$MDtpr.tpr -n index.ndx <<EOL
$abc
EOL
fi

if [ ! -f $MD-protein_bcd.gro ]; then
gmx trjconv -f ../../$MDtpr.gro -o $MD-protein_bcd.gro -s ../../$MDtpr.tpr -n index.ndx <<EOL
$bcd
EOL
fi

if [ ! -f $MD-protein_cde.gro ]; then
gmx trjconv -f ../../$MDtpr.gro -o $MD-protein_cde.gro -s ../../$MDtpr.tpr -n index.ndx <<EOL
$cde
EOL
fi

if [ ! -f $MD-protein_def.gro ]; then
gmx trjconv -f ../../$MDtpr.gro -o $MD-protein_def.gro -s ../../$MDtpr.tpr -n index.ndx <<EOL
$def
EOL
fi

if [ ! -f $MD-protein_atof.gro ]; then
gmx trjconv -f ../../$MDtpr.gro -o $MD-protein_atof.gro -s ../../$MDtpr.tpr -n index.ndx <<EOL
$atof
EOL
fi

if [ ! -f $MD-protein_abc.pdb ]; then
gmx editconf -f $MD-protein_abc.gro -o $MD-protein_abc.pdb
fi

if [ ! -f $MD-protein_bcd.pdb ]; then
gmx editconf -f $MD-protein_bcd.gro -o $MD-protein_bcd.pdb
fi

if [ ! -f $MD-protein_cde.pdb ]; then
gmx editconf -f $MD-protein_cde.gro -o $MD-protein_cde.pdb
fi

if [ ! -f $MD-protein_def.pdb ]; then
gmx editconf -f $MD-protein_def.gro -o $MD-protein_def.pdb
fi

if [ ! -f $MD-protein_atof.pdb ]; then
gmx editconf -f $MD-protein_atof.gro -o $MD-protein_atof.pdb
fi

if [ ! -f $MD-protein_abc.xtc ]; then
gmx trjconv -f ../$MD-complete$n_three-protein.xtc -o $MD-protein_abc.xtc -s ../../$MD.tpr -skip 100 -n index.ndx <<EOL
$abc
EOL
fi
if [ ! -f $MD-protein_bcd.xtc ]; then
gmx trjconv -f ../$MD-complete$n_three-protein.xtc -o $MD-protein_bcd.xtc -s ../../$MD.tpr -skip 100 -n index.ndx <<EOL
$bcd
EOL
fi
if [ ! -f $MD-protein_cde.xtc ]; then
gmx trjconv -f ../$MD-complete$n_three-protein.xtc -o $MD-protein_cde.xtc -s ../../$MD.tpr -skip 100 -n index.ndx <<EOL
$cde
EOL
fi
if [ ! -f $MD-protein_def.xtc ]; then
gmx trjconv -f ../$MD-complete$n_three-protein.xtc -o $MD-protein_def.xtc -s ../../$MD.tpr -skip 100 -n index.ndx <<EOL
$def
EOL
fi
if [ ! -f $MD-protein_atof.xtc ]; then
gmx trjconv -f ../$MD-complete$n_three-protein.xtc -o $MD-protein_atof.xtc -s ../../$MD.tpr -skip 100 -n index.ndx <<EOL
$atof
EOL
fi

if [ ! -f $MD-protein_abc.dcd ]; then
mdconvert $MD-protein_abc.xtc -o $MD-protein_abc.dcd
fi
if [ ! -f $MD-protein_bcd.dcd ]; then
mdconvert $MD-protein_bcd.xtc -o $MD-protein_bcd.dcd
fi
if [ ! -f $MD-protein_cde.dcd ]; then
mdconvert $MD-protein_cde.xtc -o $MD-protein_cde.dcd
fi
if [ ! -f $MD-protein_def.dcd ]; then
mdconvert $MD-protein_def.xtc -o $MD-protein_def.dcd
fi
if [ ! -f $MD-protein_atof.dcd ]; then
mdconvert $MD-protein_atof.xtc -o $MD-protein_atof.dcd
fi

########################################################################
# Following commands are for R package
########################################################################
echo "$subTITLE!"
if [[ $subTITLE == "{/Symbol b}CTT" ]]; then
      subTITLE="beta,'CTT'"
      echo "$subTITLE"
fi
if [[ $subTITLE == "{/Symbol b}CTT + ATP" ]]; then
      subTITLE="beta,'CTT + ATP'"
      echo "$subTITLE"
fi
if [[ $subTITLE == "{/Symbol a}CTT" ]]; then
      subTITLE="alpha,'CTT'" 
      echo "$subTITLE"
fi
if [[ $subTITLE == "{/Symbol a}CTT + ATP" ]]; then
      subTITLE="alpha,'CTT + ATP'"
      echo "$subTITLE"
fi
rm bio3d_abc.R
cat >> bio3d_abc.R <<EOL 
library(bio3d)
library(grid)
require(grid)
dcd <- read.dcd("$MD-protein_abc.dcd")
pdb <- read.pdb("$MD-protein_abc.pdb")
EOL
echo '
print(pdb)
print(pdb$xyz)
print(dcd)
ca.inds <- atom.select(pdb, elety="CA")
xyz <- fit.xyz(fixed = pdb$xyz, 
	mobile = dcd, 
	fixed.inds=ca.inds$xyz, 
	mobile.inds=ca.inds$xyz)
dim(xyz) == dim(dcd)
rd <- rmsd(xyz[1,ca.inds$xyz], xyz[,ca.inds$xyz])
jpeg("'rmsd_abc.jpg'")
plot(rd, typ="l", ylab="RMSD", xlab="Frame No.", main=expression(paste("'RMSD ABC: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
points(lowess(rd), typ="l", col="red", lty=2, lwd=2)
dev.off()

jpeg("'rmsd_density_abc.jpg'")
hist(rd, breaks=40, freq=FALSE, xlab="RMSD", main=expression(paste("'RMSD histogram ABC: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
lines(density(rd), col="gray", lwd=3)
dev.off()

summary(rd)
rf <- rmsf(xyz[,ca.inds$xyz])
jpeg("'rmsf_abc.jpg'", res=300, height=4, width=16, units="'in'")
plot(rf, ylab="RMSF", xlab="Residue Position", typ="l", main=expression(paste("'RMSF ABC: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
dev.off()

pc <- pca.xyz(xyz[,ca.inds$xyz])
jpeg("'pca_abc.jpg'")
plot(pc, col=bwr.colors(nrow(xyz)), main=expression(paste("'PCA ABC $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
dev.off()

hc <- hclust(dist(pc$z[,1:2]))
grps <- cutree(hc, k=4)
jpeg("'pca_k4_abc.jpg'")
plot(pc, col=grps, main=expression(paste("'PCA ABC: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
dev.off()

jpeg("'rmsf-pc1_abc.jpg'", res=300, height=4, width=16, units="'in'")
plot.bio3d(pc$au[,1], ylab="PC1 (A)", xlab="Residue Position", typ="l", main=expression(paste("'RMSF-PC1 ABC: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
points(pc$au[,2], typ="l", col="blue")
dev.off()

p1 <- mktrj.pca(pc, pc=1, b=pc$au[,1], file="pc1_abc.pdb")
p2 <- mktrj.pca(pc, pc=2, b=pc$au[,2], file="pc2_abc.pdb")
write.ncdf(p1, "trj_pc1_abc.nc")
cij<-dccm(xyz[,ca.inds$xyz])
jpeg("'cross_corl_abc.jpg'", res=300, height=10, width=10, units="'in'")
plot(cij, col.regions=bwr.colors(200), contour=FALSE, at=seq(-1,1,by=0.4), main=expression(paste("'Residue Cross Correlation ABC: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
vp <- viewport(x=0.49, y=0.505, width=0.82, height=0.82)
pushViewport(vp)
grid.rect(gp=gpar(lty="dashed", fill = "black", alpha = 0))
#grid.circle(x=0.5, y=0.5, r=0.3)
grid.lines()
     # Using id.lengths
     grid.polyline(x=outer(c(1, 1, 1, 1), 1:1/3),
                  y=outer(c(1, 1, 1, 0), 1:1),
                  #id.lengths=rep(3, 4),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 0, 0), 1/1),
                  y=outer(c(1, 1, 1, 1), 1:1/3),
                  #id.lengths=rep(3, 4),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 1, 1), 2:2/3),
                  y=outer(c(1, 1, 1, 0), 1:1),
                  #id.lengths=rep(3, 4),
                  gp=gpar(col=1:3, lwd=1, fill = "black", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 0, 0), 1/1),
                  y=outer(c(1, 1, 1, 1), 2:2/3),
                  #id.lengths=rep(3, 4),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

dev.off()

# pymol.dccm(cij, pdb, type="launch")
library(rmarkdown)
sessionInfo()' >> bio3d_abc.R
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
while :;do echo -n "=";sleep 1;done &
trap "kill $!" EXIT  #Die with parent if we die prematurely
echo "bio3d_abc.R is running..."
R CMD BATCH bio3d_abc.R; # or any other command here
echo "bio3d_abc.R run is finished."
echo "#####                         |  20%  finished."

###################
rm bio3d_bcd.R
cat >> bio3d_bcd.R <<EOL 
library(bio3d)
library(grid)
require(grid)
dcd <- read.dcd("$MD-protein_bcd.dcd")
pdb <- read.pdb("$MD-protein_bcd.pdb")
EOL
echo '
print(pdb)
print(pdb$xyz)
print(dcd)
ca.inds <- atom.select(pdb, elety="CA")
xyz <- fit.xyz(fixed = pdb$xyz, 
	mobile = dcd, 
	fixed.inds=ca.inds$xyz, 
	mobile.inds=ca.inds$xyz)
dim(xyz) == dim(dcd)
rd <- rmsd(xyz[1,ca.inds$xyz], xyz[,ca.inds$xyz])
jpeg("'rmsd_bcd.jpg'")
plot(rd, typ="l", ylab="RMSD", xlab="Frame No.", main=expression(paste("'RMSD BCD: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
points(lowess(rd), typ="l", col="red", lty=2, lwd=2)
dev.off()

jpeg("'rmsd_density_bcd.jpg'")
hist(rd, breaks=40, freq=FALSE, xlab="RMSD", main=expression(paste("'RMSD histogram BCD: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
lines(density(rd), col="gray", lwd=3)
dev.off()

summary(rd)
rf <- rmsf(xyz[,ca.inds$xyz])
jpeg("'rmsf_bcd.jpg'", res=300, height=4, width=16, units="'in'")
plot(rf, ylab="RMSF", xlab="Residue Position", typ="l", main=expression(paste("'RMSF BCD: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
dev.off()

pc <- pca.xyz(xyz[,ca.inds$xyz])
jpeg("'pca_bcd.jpg'")
plot(pc, col=bwr.colors(nrow(xyz)), main=expression(paste("'PCA BCD: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
dev.off()

hc <- hclust(dist(pc$z[,1:2]))
grps <- cutree(hc, k=4)
jpeg("'pca_k4_bcd.jpg'")
plot(pc, col=grps, main=expression(paste("'PCA BCD: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
dev.off()

jpeg("'rmsf-pc1_bcd.jpg'", res=300, height=4, width=16, units="'in'")
plot.bio3d(pc$au[,1], ylab="PC1 (A)", xlab="Residue Position", typ="l", main=expression(paste("'RMSF-PC1 BCD: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
points(pc$au[,2], typ="l", col="blue")
dev.off()

p1 <- mktrj.pca(pc, pc=1, b=pc$au[,1], file="pc1_bcd.pdb")
p2 <- mktrj.pca(pc, pc=2, b=pc$au[,2], file="pc2_bcd.pdb")
write.ncdf(p1, "trj_pc1_bcd.nc")
cij<-dccm(xyz[,ca.inds$xyz])
jpeg("'cross_corl_bcd.jpg'", res=300, height=10, width=10, units="'in'")
plot(cij, col.regions=bwr.colors(200), contour=FALSE, at=seq(-1,1,by=0.4), main=expression(paste("'Residue Cross Correlation BCD: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
vp <- viewport(x=0.49, y=0.505, width=0.82, height=0.82)
pushViewport(vp)
grid.rect(gp=gpar(lty="dashed", fill = "black", alpha = 0))
#grid.circle(x=0.5, y=0.5, r=0.3)
grid.lines()
     # Using id.lengths
     grid.polyline(x=outer(c(1, 1, 1, 1), 1:1/3),
                  y=outer(c(1, 1, 1, 0), 1:1),
                  #id.lengths=rep(3, 4),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 0, 0), 1/1),
                  y=outer(c(1, 1, 1, 1), 1:1/3),
                  #id.lengths=rep(3, 4),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 1, 1), 2:2/3),
                  y=outer(c(1, 1, 1, 0), 1:1),
                  #id.lengths=rep(3, 4),
                  gp=gpar(col=1:3, lwd=1, fill = "black", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 0, 0), 1/1),
                  y=outer(c(1, 1, 1, 1), 2:2/3),
                  #id.lengths=rep(3, 4),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

dev.off()

# pymol.dccm(cij, pdb, type="launch")
library(rmarkdown)
sessionInfo()' >> bio3d_bcd.R
echo "bio3d_bcd.R is running..."
R CMD BATCH bio3d_bcd.R
echo "bio3d_bcd.R run is finished."
echo "##### #####                   |  40%  finished."
###################
rm bio3d_cde.R
cat >> bio3d_cde.R <<EOL 
library(bio3d)
library(grid)
require(grid)
dcd <- read.dcd("$MD-protein_cde.dcd")
pdb <- read.pdb("$MD-protein_cde.pdb")
EOL
echo '
print(pdb)
print(pdb$xyz)
print(dcd)
ca.inds <- atom.select(pdb, elety="CA")
xyz <- fit.xyz(fixed = pdb$xyz, 
	mobile = dcd, 
	fixed.inds=ca.inds$xyz, 
	mobile.inds=ca.inds$xyz)
dim(xyz) == dim(dcd)
rd <- rmsd(xyz[1,ca.inds$xyz], xyz[,ca.inds$xyz])
jpeg("'rmsd_cde.jpg'")
plot(rd, typ="l", ylab="RMSD", xlab="Frame No.", main=expression(paste("'RMSD CDE: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
points(lowess(rd), typ="l", col="red", lty=2, lwd=2)
dev.off()

jpeg("'rmsd_density_cde.jpg'")
hist(rd, breaks=40, freq=FALSE, xlab="RMSD", main=expression(paste("'RMSD histogram CDE: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
lines(density(rd), col="gray", lwd=3)
dev.off()

summary(rd)
rf <- rmsf(xyz[,ca.inds$xyz])
jpeg("'rmsf_cde.jpg'", res=300, height=4, width=16, units="'in'")
plot(rf, ylab="RMSF", xlab="Residue Position", typ="l", main=expression(paste("'RMSF CDE: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
dev.off()

pc <- pca.xyz(xyz[,ca.inds$xyz])
jpeg("'pca_cde.jpg'")
plot(pc, col=bwr.colors(nrow(xyz)), main=expression(paste("'PCA CDE: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
dev.off()

hc <- hclust(dist(pc$z[,1:2]))
grps <- cutree(hc, k=4)
jpeg("'pca_k4_cde.jpg'")
plot(pc, col=grps, main=expression(paste("'PCA CDE: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
dev.off()

jpeg("'rmsf-pc1_cde.jpg'", res=300, height=4, width=16, units="'in'")
plot.bio3d(pc$au[,1], ylab="PC1 (A)", xlab="Residue Position", typ="l", main=expression(paste("'RMSF-PC1 CDE: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
points(pc$au[,2], typ="l", col="blue")
dev.off()

p1 <- mktrj.pca(pc, pc=1, b=pc$au[,1], file="pc1_cde.pdb")
p2 <- mktrj.pca(pc, pc=2, b=pc$au[,2], file="pc2_cde.pdb")
write.ncdf(p1, "trj_pc1_cde.nc")
cij<-dccm(xyz[,ca.inds$xyz])
jpeg("'cross_corl_cde.jpg'", res=300, height=10, width=10, units="'in'")
plot(cij, col.regions=bwr.colors(200), contour=FALSE, at=seq(-1,1,by=0.4), main=expression(paste("'Residue Cross Correlation CDE: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
vp <- viewport(x=0.49, y=0.505, width=0.82, height=0.82)
pushViewport(vp)
grid.rect(gp=gpar(lty="dashed", fill = "black", alpha = 0))
#grid.circle(x=0.5, y=0.5, r=0.3)
grid.lines()
     # Using id.lengths
     grid.polyline(x=outer(c(1, 1, 1, 1), 1:1/3),
                  y=outer(c(1, 1, 1, 0), 1:1),
                  #id.lengths=rep(3, 4),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 0, 0), 1/1),
                  y=outer(c(1, 1, 1, 1), 1:1/3),
                  #id.lengths=rep(3, 4),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 1, 1), 2:2/3),
                  y=outer(c(1, 1, 1, 0), 1:1),
                  #id.lengths=rep(3, 4),
                  gp=gpar(col=1:3, lwd=1, fill = "black", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 0, 0), 1/1),
                  y=outer(c(1, 1, 1, 1), 2:2/3),
                  #id.lengths=rep(3, 4),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

dev.off()

# pymol.dccm(cij, pdb, type="launch")
library(rmarkdown)
sessionInfo()' >> bio3d_cde.R
echo "bio3d_cde.R is running..."
R CMD BATCH bio3d_cde.R
echo "bio3d_cde.R run is finished."
echo "##### ##### #####             |  60%  finished."
###################
rm bio3d_def.R
cat >> bio3d_def.R <<EOL 
library(bio3d)
library(grid)
require(grid)
dcd <- read.dcd("$MD-protein_def.dcd")
pdb <- read.pdb("$MD-protein_def.pdb")
EOL
echo '
print(pdb)
print(pdb$xyz)
print(dcd)
ca.inds <- atom.select(pdb, elety="CA")
xyz <- fit.xyz(fixed = pdb$xyz, 
	mobile = dcd, 
	fixed.inds=ca.inds$xyz, 
	mobile.inds=ca.inds$xyz)
dim(xyz) == dim(dcd)
rd <- rmsd(xyz[1,ca.inds$xyz], xyz[,ca.inds$xyz])
jpeg("'rmsd_def.jpg'")
plot(rd, typ="l", ylab="RMSD", xlab="Frame No.", main=expression(paste("'RMSD DEF: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
points(lowess(rd), typ="l", col="red", lty=2, lwd=2)
dev.off()

jpeg("'rmsd_density_def.jpg'")
hist(rd, breaks=40, freq=FALSE, xlab="RMSD", main=expression(paste("'RMSD histogram DEF: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
lines(density(rd), col="gray", lwd=3)
dev.off()

summary(rd)
rf <- rmsf(xyz[,ca.inds$xyz])
jpeg("'rmsf_def.jpg'", res=300, height=4, width=16, units="'in'")
plot(rf, ylab="RMSF", xlab="Residue Position", typ="l", main=expression(paste("'RMSF DEF: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
dev.off()

pc <- pca.xyz(xyz[,ca.inds$xyz])
jpeg("'pca_def.jpg'")
plot(pc, col=bwr.colors(nrow(xyz)), main=expression(paste("'PCA DEF: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
dev.off()

hc <- hclust(dist(pc$z[,1:2]))
grps <- cutree(hc, k=4)
jpeg("'pca_k4_def.jpg'")
plot(pc, col=grps, main=expression(paste("'PCA DEF: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
dev.off()

jpeg("'rmsf-pc1_def.jpg'", res=300, height=4, width=16, units="'in'")
plot.bio3d(pc$au[,1], ylab="PC1 (A)", xlab="Residue Position", typ="l", main=expression(paste("'RMSF-PC1 DEF: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
points(pc$au[,2], typ="l", col="blue")
dev.off()

p1 <- mktrj.pca(pc, pc=1, b=pc$au[,1], file="pc1_def.pdb")
p2 <- mktrj.pca(pc, pc=2, b=pc$au[,2], file="pc2_def.pdb")
write.ncdf(p1, "trj_pc1_def.nc")
cij<-dccm(xyz[,ca.inds$xyz])
jpeg("'cross_corl_def.jpg'", res=300, height=10, width=10, units="'in'")
plot(cij, col.regions=bwr.colors(200), contour=FALSE, at=seq(-1,1,by=0.4), main=expression(paste("'Residue Cross Correlation DEF: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
vp <- viewport(x=0.49, y=0.505, width=0.82, height=0.82)
pushViewport(vp)
grid.rect(gp=gpar(lty="dashed", fill = "black", alpha = 0))
#grid.circle(x=0.5, y=0.5, r=0.3)
grid.lines()
     # Using id.lengths
     grid.polyline(x=outer(c(1, 1, 1, 1), 1:1/3),
                  y=outer(c(1, 1, 1, 0), 1:1),
                  #id.lengths=rep(3, 4),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 0, 0), 1/1),
                  y=outer(c(1, 1, 1, 1), 1:1/3),
                  #id.lengths=rep(3, 4),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 1, 1), 2:2/3),
                  y=outer(c(1, 1, 1, 0), 1:1),
                  #id.lengths=rep(3, 4),
                  gp=gpar(col=1:3, lwd=1, fill = "black", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 0, 0), 1/1),
                  y=outer(c(1, 1, 1, 1), 2:2/3),
                  #id.lengths=rep(3, 4),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

dev.off()

# pymol.dccm(cij, pdb, type="launch")
library(rmarkdown)
sessionInfo()' >> bio3d_def.R
echo "bio3d_def.R is running..."
R CMD BATCH bio3d_def.R
echo "bio3d_def.R run is finished."
echo "##### ##### ##### #####       |  80%  finished."
###################
rm bio3d_atof.R
cat >> bio3d_atof.R <<EOL 
library(bio3d)
library(grid)
require(grid)
dcd <- read.dcd("$MD-protein_atof.dcd")
pdb <- read.pdb("$MD-protein_atof.pdb")
EOL
echo '
print(pdb)
print(pdb$xyz)
print(dcd)
ca.inds <- atom.select(pdb, elety="CA")
xyz <- fit.xyz(fixed = pdb$xyz, 
	mobile = dcd, 
	fixed.inds=ca.inds$xyz, 
	mobile.inds=ca.inds$xyz)
dim(xyz) == dim(dcd)
rd <- rmsd(xyz[1,ca.inds$xyz], xyz[,ca.inds$xyz])
jpeg("'rmsd_atof.jpg'")
plot(rd, typ="l", ylab="RMSD", xlab="Frame No.", main=expression(paste("'RMSD AtoF: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
points(lowess(rd), typ="l", col="red", lty=2, lwd=2)
dev.off()

jpeg("'rmsd_density_atof.jpg'")
hist(rd, breaks=40, freq=FALSE, xlab="RMSD", main=expression(paste("'RMSD histogram AtoF: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
lines(density(rd), col="gray", lwd=3)
dev.off()

summary(rd)
rf <- rmsf(xyz[,ca.inds$xyz])
jpeg("'rmsf_atof.jpg'", res=300, height=4, width=16, units="'in'")
plot(rf, ylab="RMSF", xlab="Residue Position", typ="l", main=expression(paste("'RMSF AtoF: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
dev.off()

pc <- pca.xyz(xyz[,ca.inds$xyz])
jpeg("'pca_atof.jpg'")
plot(pc, col=bwr.colors(nrow(xyz)), main=expression(paste("'PCA AtoF: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
dev.off()

hc <- hclust(dist(pc$z[,1:2]))
grps <- cutree(hc, k=4)
jpeg("'pca_k4_atof.jpg'")
plot(pc, col=grps, main=expression(paste("'PCA AtoF: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
dev.off()

grps <- cutree(hc, k=2)
jpeg("'pc1_atof.jpg'")
plot(pc, pc.axes=1:2, col=grps, mar = c(5, 5, 2, 1), font.main=2, cex.main=2, font.lab=2, cex.lab=2, main=expression(paste("'PCA AtoF: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
dev.off()

jpeg("'pc_contribution_atof.jpg'", res=300, height=10, width=20, units="'in'")
par(mfrow = c(3, 1), cex = 0.75, mar = c(5, 5, 1, 1))
plot.bio3d(pc$au[,1], ylab="PC1", font.lab=2, cex.lab=2)
plot.bio3d(pc$au[,2], ylab="PC2", font.lab=2, cex.lab=2)
plot.bio3d(pc$au[,3], ylab="PC3", font.lab=2, cex.lab=2)
dev.off()

jpeg("'rmsf-pc1_atof.jpg'", res=300, height=4, width=16, units="'in'")
plot.bio3d(pc$au[,1], ylab="PC1 (A)", xlab="Residue Position", typ="l")
points(pc$au[,2], typ="l", col="blue")
dev.off()

p1 <- mktrj.pca(pc, pc=1, b=pc$au[,1], file="pc1_atof.pdb")
p2 <- mktrj.pca(pc, pc=2, b=pc$au[,2], file="pc2_atof.pdb")
write.ncdf(p1, "trj_pc1_atof.nc")
cij<-dccm(xyz[,ca.inds$xyz])
jpeg("'cross_corl_atof.jpg'", res=300, height=10, width=10, units="'in'")
plot(cij, col.regions=bwr.colors(200), contour=FALSE, at=seq(-1,1,by=0.4), main=expression(paste("'Residue Cross Correlation AtoF: $TITLE + '", '$subTITLE', "' [$n_three ns]'")))
vp <- viewport(x=0.491, y=0.503, width=0.82, height=0.82)
pushViewport(vp)
grid.rect(gp=gpar(lty="dashed", fill = "black", alpha = 0))
#grid.circle(x=0.5, y=0.5, r=0.3)
grid.lines()
     # Using id.lengths
     grid.polyline(x=outer(c(1, 1, 1, 1), 1:1/6),
                  y=outer(c(1, 1, 1, 0), 1:1),
                  #id.lengths=rep(6, 7),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 0, 0), 1/1),
                  y=outer(c(1, 1, 1, 1), 1:1/6),
                  #id.lengths=rep(6, 7),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 1, 1), 2:2/6),
                  y=outer(c(1, 1, 1, 0), 1:1),
                  #id.lengths=rep(6, 7),
                  gp=gpar(col=1:3, lwd=1, fill = "black", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 0, 0), 1/1),
                  y=outer(c(1, 1, 1, 1), 2:2/6),
                  #id.lengths=rep(6, 7),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 1, 1), 3:3/6),
                  y=outer(c(1, 1, 1, 0), 1:1),
                  #id.lengths=rep(6, 7),
                  gp=gpar(col=1:3, lwd=1, fill = "black", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 0, 0), 1/1),
                  y=outer(c(1, 1, 1, 1), 3:3/6),
                  #id.lengths=rep(6, 7),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 1, 1), 4:4/6),
                  y=outer(c(1, 1, 1, 0), 1:1),
                  #id.lengths=rep(6, 7),
                  gp=gpar(col=1:3, lwd=1, fill = "black", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 0, 0), 1/1),
                  y=outer(c(1, 1, 1, 1), 4:4/6),
                  #id.lengths=rep(6, 7),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 1, 1), 5:5/6),
                  y=outer(c(1, 1, 1, 0), 1:1),
                  #id.lengths=rep(6, 7),
                  gp=gpar(col=1:3, lwd=1, fill = "black", alpha = 1.0))

     grid.polyline(x=outer(c(1, 1, 0, 0), 1/1),
                  y=outer(c(1, 1, 1, 1), 5:5/6),
                  #id.lengths=rep(6, 7),
                  gp=gpar(col=1:3, lwd=1, fill = "white", alpha = 1.0))

dev.off()

# pymol.dccm(cij, pdb, type="launch")
library(rmarkdown)
sessionInfo()' >> bio3d_atof.R
echo "bio3d_atof.R is running..."
R CMD BATCH bio3d_atof.R
echo "bio3d_atof.R run is finished."
echo "##### ##### ##### ##### ##### | 100%  finished."
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
kill $! && trap " " EXIT #Kill the loop and unset the trap or else the pid might get reassigned and we might end up killing a completely different process
########################################################
#!/bin/bash
toilet -f mono12 -F metal END
