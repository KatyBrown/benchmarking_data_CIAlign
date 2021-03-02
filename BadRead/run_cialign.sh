for i in {1..100};
do
    for typ in good_ medium_ bad_;
    do
	for platform in nanopore pacbio;
	do
	    ali=sim\_$i/mafft/$typ$platform\_mafft\_localpair.fasta
	    for stri in highly_stringent med_stringent low_stringent;
	    do
	
		CIAlign --inifile $stri\_config\_BadRead.ini --infile $ali --outfile_stem sim\_$i/mafft/$typ$platform\_$stri\_local_max100;
	    done
	done
    done
done

