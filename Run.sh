#!/bin/bash
## instaling Atlantis for functionality
sudo make install -C /home/demiurgo/Documents/PhD/Atlantis_Model/trunk/atlantis/
## This Code make an aumotamic backup of the log file
## The backup is do in it at the end of the run
datIni="$(date +'%Y%m%d%H%M%S')"
dateinicio="$(date +'%Y-%m-%d %H:%M:%S')"
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ##
## ~           Running Atlantis JFRE        ~ ##
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ##
gdb --args atlantisMerged -i INIT_VMPA_Jan2015.nc 0 -o outputSETAS.nc -r VMPA_setas_run_fishing_F_Trunk.prm -f VMPA_setas_force_fish_Trunk.prm -p VMPA_setas_physics.prm -b VMPA_setas_biol_fishing_Trunk.prm -h harvest_stripped.prm -s SETasGroupsDem.csv -q SETasFisheries.csv -d SETas_Output_Folder

## Backup of the log.txt file
echo "++++++++++++++++++++++++++++++++++++++++"
echo "  A Copy of the Log file as been made  "
echo "++++++++++++++++++++++++++++++++++++++++"
datEnd="$(date +'%Y%m%d%H%M%S')"
dateend="$(date +'%Y-%m-%d %H:%M:%S')"
cp -a SETas_Output_Folder/outputSETASAnnualAgeBiomIndx.txt Calibration/BioAge$datEnd.bak
cp -a SETas_Output_Folder/outputSETASBiomIndx.txt Calibration/BioTot$datEnd.bak
cp -a SETas_Output_Folder/outputSETAS.nc Calibration/Ncout$datEnd.nc
if [ $(ls Calibration/*.nc | wc -l) -gt 4 ];
then
    rm "$(ls -t Calibration/*.nc | tail -1)"
    echo "To save HD space I removed the file created 4 simulation ago"
fi
echo "...Done"

osver=$(cat /etc/issue.net)

## Writing the information of the run in the RunTrack.org file
echo "* Run PC-Demiurgo $datIni" >> RunTrack.org
echo "  - Run start: $dateinicio">> RunTrack.org
echo "  - Run end: $dateend">> RunTrack.org
echo "  - log file : [[file:Calibration/$datEnd.bak][Backupfile]]">> RunTrack.org
echo "  - OS : $osver">> RunTrack.org
echo "  - Compiler version : gcc $(gcc -dumpversion)">> RunTrack.org
echo "  - Bash Version : $BASH_VERSION">> RunTrack.org
echo "  - Atlantis Version : $(sed -n '2p' < SETas_Output_Folder/log.txt)">> RunTrack.org
echo "  - Run used :  $(sed -n '14p' < SETas_Output_Folder/log.txt)">> RunTrack.org

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " Do you want to do a commit? (Y)ES or (N)OT and press [ENTER]"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
read answer
if [ $answer  ==  "Y" -o $answer  ==  "y" ];
then
    echo "Enter your comit and the press [ENTER]"
    read comm
    read comm2
    while [[ ! -z "${comm2}" ]]
    do
        comm="$comm\n$comm2"
        read comm2
    done
    git commit -a -m "$comm"
    echo " Done!"
else
    echo " Automatic Git commit was done "
    comm="Automatic backup $datEnd"
    git commit -a -m "$comm"
    echo "Done!"
fi
echo -e "  - Commit Githhub : $comm">> RunTrack.org

echo "** Biomasss Plot">> RunTrack.org
Rscript Figures_Save.R $datIni --save
echo "#+CAPTION: Biomass plot for the simulation $datIni" >> RunTrack.org
echo "[[file:/home/demiurgo/Documents/2017/Calibration_SETas/Model/SETas_model_Trunk_Stripped/Calibration/Figures/$datIni.png]]">> RunTrack.org
