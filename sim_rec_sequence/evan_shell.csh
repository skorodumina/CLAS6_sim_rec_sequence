#!/bin/tcsh -f
#PREFIX=/group/clas/builds/test3
#unsetenv *
source /group/clas/builds/environment.csh

#unsetenv PATH
#unsetenv LD_LIBRARY_PATH
#unsetenv PYTHONPATH

## basic path

#CLAS_CALDB_RUNINDEX=calib.RunIndex
#CLAS_CALDB_RUNINDEX=calib_user.RunIndexe1_6
#CLAS_CALDB_RUNINDEX=calib_user.RunIndexe1f
#RUNNUMBER=36450
#CLAS_CALDB_RUNINDEX=calib_user.RunIndex
#export CLAS_CALDB_RUNINDEX

#setenv CSQL_DBHOST clasdb
#setenv CSQL_USER offline_e1
#setenv CSQL_DB e1_offline
#setenv CSQL_TABLE pass11
#setenv CSQL_DDL /home/clase1/e1e/top_dir/bankdefs/csql.ddl
#setenv CSQL_CALIB /home/clase1/e1e/top_dir/bankdefs/calb.ddl
#setenv CSQL_COMM "e1e pass1"

#export CSQL_DBHOST
#export CSQL_USER
#export CSQL_DB
#export CSQL_TABLE
#export CSQL_DDL
#export CSQL_CALIB
#export CSQL_COMM

#setenv GENEV_DATA_DIR /volatile/clas/clase1-6/skorodum/gleb_sim_Sept2015/newsim/data3

#bash -c 'echo $RANDOM > seed.dat'
#echo " "$RANDOM > seed.dat

setenv dir `pwd`
#cd /apps/root/PRO/root/
cd /apps/root/5.34.36/root/
source bin/thisroot.csh
cd $dir

cp -r /volatile/clas/clase1-6/skorodum/genev_clas12_new_fermirad/fedotov_cr_sect/ .
cp -r /volatile/clas/clase1-6/skorodum/genev_clas12_new_fermirad/fit_param/ .
cp -r /volatile/clas/clase1-6/skorodum/genev_clas12_new_fermirad/ripani_cr_sect/ .
cp -r /volatile/clas/clase1-6/skorodum/genev_clas12_new_fermirad/rip_q2_130_w_18_21/ .
cp -r /volatile/clas/clase1-6/skorodum/genev_clas12_new_fermirad/golovach_cr_sect/ .
cp -r /volatile/clas/clase1-6/skorodum/genev_clas12_new_fermirad/int_sec_new/ .

./genev_clas12 < inp1_fermirad
gsim_bat -nomcdata -ffread ffread_markov.inp -mcin out.bos -kine 1 -bosout GSIM.OUT

setenv CLAS_CALDB_RUNINDEX calib_user.RunIndexe1_6
#export CLAS_CALDB_RUNINDEX
gpp -ogpp_out.bos -a1.94 -b1.94 -c1.94 -f1.15 -P0x1b -R36450 GSIM.OUT

splitbos -runnum 10 -o gpp_out_new.bos gpp_out.bos
unsetenv CLAS_CALDB_RUNINDEX
# /home/markov/bin/LinuxRHEL5/user_ana -t inp_recsis.tcl
#/home/markov/bin/LinuxRHEL5/user_ana -t inp_recsis.tcl
./user_ana_evan -t inp_recsis_dont_change.tcl

./nt10maker_mctk_new -t3 -otest.hbook recsis_out.bos
h2root test.hbook
/apps/root/PRO/root/bin/root -l -b -q branch_add_pfermi.C



