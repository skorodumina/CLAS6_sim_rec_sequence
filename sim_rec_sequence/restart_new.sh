#!/bin/tcsh -f

#set j=0
#foreach i (`seq 1 1000`)

#if (!(-e /cache/mss/home/gleb/e1e/sim2014/recsis_sim${i}.bos)) then
#if (!(-e /cache/mss/home/gleb/e1e/sim2014/ceb/out_ceb${i}.hbook)) then

#echo $i
#sed -e "s/test1/sim${i}/g" jsub_test > jsub${i}

#jsub jsub${i}

#rm jsub${i}

#@ j++

#endif

#end

#echo $j

setenv k 0

foreach i (`seq 110000 120000`)

#foreach file ( /cache/mss/home/gleb/e1e/sim2014_w_1675_1825/goa/goa_out*.hbook )

setenv size 0

#if ((-e /mss/clas/e1e/production/simulation_2pi/sim_skorodum_Aug2016/nt10_cont/nt10_Aug16_newFrad_${i}.root)) then
#setenv size `cat /mss/clas/e1e/production/simulation_2pi/sim_skorodum_Aug2016/nt10_cont/nt10_Aug16_newFrad_${i}.root  | grep size | sed -e 's/size=//g'`
#echo $size" "$i
#endif

#if  ($size < 120000000) then
#@ k++
#echo $size" "$i"  "$k
#endif
#if ($size > 200000000) then
#echo /cache/mss/home/gleb/e1e/sim2014_w_1675_1825/goa/goa_out${i}.hbook
#endif
#if (($size < 200000000)||(!(-e /cache/mss/home/gleb/e1e/sim2014_w_1675_1825/goa/goa_out${i}.hbook))) then
#setenv filenew `echo $file | sed -e 's$/cache/mss/home/gleb/e1e/sim2014/recsis_sim$$g'  | sed  -e 's$.bos$$g'`

#echo $filenew
#echo $file >> qqq
#echo $i
#jcache remove /cache/mss/home/gleb/e1e/sim2014_w_1675_1825/goa/goa_out${i}.hbook


#jremove /mss/home/skorodum/e1e/simulation/sim_w_1275_1525_gleb_Sep2015/ceb/ceb_out${i}.hbook
#jremove /mss/home/skorodum/e1e/simulation/sim_w_1275_1525_gleb_Sep2015/goa/goa_out${i}.hbook
#jremove /mss/home/skorodum/e1e/simulation/sim_w_1275_1525_gleb_Sep2015/gpp/gpp${i}.bos
#jremove /mss/home/skorodum/e1e/simulation/sim_w_1275_1525_gleb_Sep2015/gsim/gsim${i}.bos
#jremove /mss/home/skorodum/e1e/simulation/sim_w_1275_1525_gleb_Sep2015/nt10/nt10_${i}.root
#jremove /mss/home/skorodum/e1e/simulation/sim_w_1275_1525_gleb_Sep2015/recsis/recsis${i}.bos



echo "PROJECT: e1e" > jsub_new
echo "TRACK: simulation" >>jsub_new
echo "JOBNAME: sim_new_gen${i}" >>jsub_new
echo "MAIL: skorodum@jlab.org" >>jsub_new
echo "SINGLE_JOB: TRUE" >>jsub_new
echo "OS:  centos65" >>jsub_new
echo "MEMORY:  1000 MB" >>jsub_new
echo "INPUT_FILES:/volatile/clas/clase1-6/skorodum/genev_clas12_new_fermirad/try_to_rec/ffread_markov.inp /volatile/clas/clase1-6/skorodum/genev_clas12_new_fermirad/try_to_rec/genev_clas12 /volatile/clas/clase1-6/skorodum/genev_clas12_new_fermirad/try_to_rec/inp1_fermirad /volatile/clas/clase1-6/skorodum/genev_clas12_new_fermirad/try_to_rec/inp_recsis_dont_change.tcl /volatile/clas/clase1-6/skorodum/genev_clas12_new_fermirad/try_to_rec/nt10maker_mctk_new /volatile/clas/clase1-6/skorodum/genev_clas12_new_fermirad/try_to_rec/user_ana_evan /volatile/clas/clase1-6/skorodum/genev_clas12_new_fermirad/try_to_rec/branch_add_pfermi.C" >>jsub_new
echo "COMMAND:/volatile/clas/clase1-6/skorodum/genev_clas12_new_fermirad/try_to_rec/evan_shell.csh" >>jsub_new

echo "OUTPUT_DATA: test.root" >>jsub_new
echo "OUTPUT_TEMPLATE:  /mss/clas/e1e/production/simulation_2pi/sim_skorodum_Aug2016/nt10_cont2/nt10_Aug16_newFrad_${i}.root" >>jsub_new



#if ($size < 120000000) then
#echo $i
#echo $size"   "$i
#jremove /mss/clas/e1e/production/simulation_2pi/sim_skorodum_Aug2016/nt10_cont/nt10_Aug16_newFrad_${i}.root
#rm -f /cache/mss/clas/e1e/production/simulation_2pi/sim_skorodum_Aug2016/nt10_cont/nt10_Aug16_newFrad_${i}.root

if (!((-e /mss/clas/e1e/production/simulation_2pi/sim_skorodum_Aug2016/nt10_cont2/nt10_Aug16_newFrad_${i}.root))) then
#echo $i
#jremove /mss/clas/e1e/production/simulation_2pi/sim_skorodum_Aug2016/nt10_cont/nt10_Aug16_newFrad_${i}.root
#rm -f /cache/mss/clas/e1e/production/simulation_2pi/sim_skorodum_Aug2016/nt10_cont/nt10_Aug16_newFrad_${i}.root
/site/bin/jsub jsub_new
@ k++
endif
rm jsub_new


#endif

#jcache remove /cache/mss/home/gleb/e1e/sim2014/sim{$filenew}.root

#jremove /mss/home/gleb/e1e/sim2014/sim{$filenew}.root

#jcache remove /cache/mss/home/gleb/e1e/sim2014/recsis_sim{$filenew}.bos

#jremove /mss/home/gleb/e1e/sim2014/recsis_sim{$filenew}.bos

#sed -e "s/test1/sim$filenew/g" jsub_test > jsub$filenew

#jsub jsub$filenew

#rm jsub$filenew

#endif


end

echo $k
