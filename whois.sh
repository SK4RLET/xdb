#!/bin/system/bash
#Powerfull engine whois lookup
#IANA database
function main() {
while IFS= read -e -p $'xdb = \e[1;32menum whois\e[0m > ' menu; do
history -s "$menu"

  #//Default Commands//
  
  if [[ $menu == "clear" ]]; then
	 clear
    elif [[ $menu == "back" ]]; then
    exit
    
    elif [[ $menu == "help"* ]] ||
    	 [[ $menu == "show"* ]] ||
		 [[ $menu == "about"* ]]; then
    	 msg
    
    elif [[ $menu == "set domain"* ]]; then
    set_domain
    elif [[ $menu == "run" ]]; then
    init
    elif [[ $menu == "pwd" ]]; then
    pwd
    
    else
    main
  fi
done
}


function init() {


		printf " \n"
		
		TARGETBAR="$(domain)"
		
		BAR="$(echo $TARGETBAR | sed 's/./-/g')"
		
		printf " ---------$BAR\n"
		printf " [+] URL: $(domain)\n"
		printf " ---------$BAR\n"
		printf " \n"

	

 if [[ $(printf "$(domain)" | grep '.id') ]]; then
 
   
   whois --server=whois.id $(domain) >| whois.txt
   cat whois.txt | awk '{print "\033[34m [+]\033[0m", $0}'
   
   done_init
   
      else
      com
      fi
}


function com() {

      if [[ $(cat target.txt | grep ".com") ]]; then
      printf "\e[1;32m[+] \e[0mWhois server: whois.verisign-grs.com\n"
      whois --server=whois.verisign-grs.com $(domain) | grep "Domain Name" | awk '{print "\033[1;32m[+]\033[0m Domain Name:", $3,$4}'
      whois --server=whois.verisign-grs.com $(domain) | grep "Domain ID" | awk '{print "\033[1;32m[+]\033[0m Registrar Domain ID:", $4}'
      whois --server=whois.verisign-grs.com $(domain) | grep "Registrar Whois Server" | awk '{print "\033[1;32m[+]\033[0m Reagistrar Whois Server:", $4}'
      whois --server=whois.verisign-grs.com $(domain) | grep "Registrar URL" | awk '{print "\033[1;32m[+]\033[0m Registrar URL:", $3}'
      whois --server=whois.verisign-grs.com $(domain) | grep "Updated Date" | awk '{print "\033[1;32m[+]\033[0m Updated Date:", $3}'
      whois --server=whois.verisign-grs.com $(domain) | grep "Creation Date" | awk '{print "\033[1;32m[+]\033[0m Creation Date:", $3}'
      whois --server=whois.verisign-grs.com $(domain) | grep "Registry Expiry Date" | awk '{print "\033[1;32m[+]\033[0m Registry Expiry Date:", $4}'
      whois --server=whois.verisign-grs.com $(domain) | grep "Registrar IANA ID" | awk '{print "\033[1;32m[+]\033[0m Registrar IANA ID:", $4}'
      whois --server=whois.verisign-grs.com $(domain) | grep "Contact Email" | awk '{print "\033[1;32m[+]\033[0m Registrar Contact Email:", $5}'
      whois --server=whois.verisign-grs.com $(domain) | grep "Contact Phone" | awk '{print "\033[1;32m[+]\033[0m Registrar Contact Phone:", $5}'
      whois --server=whois.verisign-grs.com $(domain) | grep "Name Server" | awk '{print "\033[1;32m[+]\033[0m Name Server:", $3}'
      whois --server=whois.verisign-grs.com $(domain) | grep "Domain Status" | awk '{print "\033[1;32m[+]\033[0m Domain Status:", $3}'
      whois --server=whois.verisign-grs.com $(domain) | grep "DNSSEC" | awk '{print "\033[1;32m[+]\033[0m DNSSEC:", $2}'
      else
      printf "not found"
      
fi



      if [[ $(cat target.txt | grep ".net") ]]; then
      whois $(domain) | awk '{print "\033[0;34m[+]\033[0m",$0}'
      fi




      if [[ $(cat target.txt | grep ".edu") ]]; then
      whois $(domain) | awk '{print "\033[0;34m[+]\033[0m",$0}'
      printf "\n"
      fi

}

function done_init() {

		printf " \n"
		printf " --------------------\n"
		printf " [+] Server: whois.id\n"
		printf " --------------------\n"
		printf " \n"
		exit
}

function domain() {
cat config.db | grep 'Domain' | awk '{print $2}'
}

function opt() {
	
			printf "\n"
			printf " -------------------\n"
			printf " [+] Current options\n"
			printf " -------------------\n\n"
			printf " - Domain        : $(domain)\n"
			printf " - Source        : IANA.org\n"
			printf "\n"
}

opt
main
