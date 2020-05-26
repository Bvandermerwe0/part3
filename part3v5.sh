#!/bin/bash

#Author: Bianca Van Der Merwe
#ID: 10389192

echo "The aim is to be able to download ALL IN RANGE thumbnais"
 

curl -s "https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152" > rand.txt        #writting the html text into the rand.txt file
cat rand.txt | grep -Eo '(http|https)://[^"]+' | grep ".jpg" | sed 's/.*\///' | sed -e 's/^DSC0//' | sed -e 's/.jpg$//' > randlist.txt      
                                        #while looking at the rand.txt file, stip out all the html, look at everything that has the .jpg on the end
                                        #using sed - delete everything that starts with DS0 and ends with .jpg save it to randlist.txt

awk 'BEGIN {FS="^"; print "\n"}{ ORS=" "; print "\t"}{print ; if(++onr%10 == 0) print "\n"}' randlist.txt #while using the file seperate, print that on a new line
                                                                                                            # Output record separator prints a space between the output, and tab's then to the righy
                                                                                                            #in one line, if the vairables are more than 10 print it in a new line.
echo -e "\n\n"  #printed a new line for visual purposes



#grep "$minrange" | sed -e "/$minrange/d" randlist.txt > newrand.txt | awk 'BEGIN {FS="^"; print "\n"}{ ORS=" "; print "\t"}{print ; if(++onr%10 == 0) print "\n"}' newrandlist.txt
read -p "what is the minimum: " minrange | grep "^.\?[0-9]*$" #setting loer bound
read -p "whatis the maximum: " maxrange | grep "^.\?[0-9]*$"  #setting upper bound                                                                              
                                                                 #unsure how to error check? Should i do a seperate if statement for both?
   

#if [ "$minrange" -lt "$maxrange" ]; then        #anything smaller than $minrange and anything bigger than $maxrange
 #   echo "lower bound is smaller"               #delete or ignore
#else
   # echo "upper bound is bigger"                #for anything else downloand
#fi