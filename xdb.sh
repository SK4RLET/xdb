#!/bin/system/bash

#//SKARLET bgsprtm//
#//Coded by 000000//
#//!Please dont recode this script//

#// Main Menu @(Home) //
function main() { 

 while IFS= read -e -p $'xdb > ' menu; do
 history -s "$menu"
 
    #// Default Commands //
    
    if [[ $menu == "clear" ]]; then
    clear
    
	elif [[ $menu == "help"* ]] ||
	     [[ $menu == "show"* ]]; then
   	  msg
   
	elif [[ $menu == "exit" ]]; then
	exit
	elif [[ $menu == "pwd" ]]; then
	pwd
	
	
    #// Direct Commands //
    
    elif [[ $menu == "ifconfig" ]]; then
    ifconfig
    
    
    #// Sources Commands //
    
    elif [[ $menu == "use db/admin/panel" ]] ||
		 [[ $menu == "use scanners/db/admin/panel" ]]; then
     	bash src/modules/scanners/db_admin_panel.sh
    
    elif [[ $menu == "web admin" ]] ||
    	 [[ $menu == "use web admin" ]]; then
    bash src/modules/web_admins.sh
    
    elif [[ $menu == "enum whois" ]]; then
    bash src/modules/whois.sh
    
    elif [[ $menu == "web content" ]]; then
    bash src/us000/web_content.sh
    
    elif [[ $menu == "web page" ]]; then
    bash src/us000/web_page.sh
    
    elif [[ $menu == "set domain"* ]]; then
    set_domain
    
    
    else
    main

    fi
 done
}





function msg() {

	if [[ $menu == "help" ]]; then

		printf "\n"
		printf " --------------------\n"
		printf " [+] Default commands\n"
		printf " --------------------\n\n"
		printf " - clear               Clear the terminal\n"
		printf " - help                Show a help message\n"
		printf " - exit                Exit the framework\n"
		printf "\n"
		printf " --------------------\n"
		printf " [+] Modules commands\n"
		printf " --------------------\n\n"
		printf " - show modules        Display all available modules\n"
		printf " - use <module>        Use the selected module\n"
		printf " - set <opt>           Set the option of module\n"
		printf " - show options        Display the module's options\n"
		printf " - run                 Execute the module\n"
		printf " - back                Exit from the module\n"
		printf "\n"
		printf " --------------------\n"
		printf " [+] Options commands\n"
		printf " --------------------\n\n"
		printf " - install             Install script from source\n"
		printf " - about               Display about this framework\n"
		printf "\n"

	   elif [[ $menu == "show modules" ]]; then
	
			printf "\n"
			printf " --------------------\n"
			printf " [+] Modules database\n"
			printf " --------------------\n\n"
			printf " - enum whois          Whois lookup\n"
			printf " \n"
			printf " - web admin           Brute-scan admin panel\n"
			printf " - web content         Dump to find content manager system\n"
			printf " - web page            Print all links from target\n"
			printf " - web privacy         High rate database plugin\n"
			printf " \n"
			printf " - net user/proxy      Config your proxy\n"
			printf " - net user/port       Advanced proxy configurating\n"
			printf " - net ip/user         Print your public ip\n"
			printf " - net ip/trace        Traceroute target ip\n"
			printf " - net config          All network configuration\n"  
			printf " \n"
			printf " - act ddos            DDOS attack plugin\n"
			printf " - act bypass          DDOS attack plugin\n"
			printf " \n"
			printf " ---------------------\n"
			printf " [+] Modules total: 11\n"
			printf " ---------------------\n"
			printf " \n"
	
		elif [[ $menu == "show options" ]]; then
	
			printf "\n"
			printf " -------------------\n"
			printf " [+] Current options\n"
			printf " -------------------\n\n"
			printf " - Domain        : $(domain)\n"
			printf " - Plugin        : Default\n"
			printf "\n" 
		
	  else
	   printf "[-] $menu : Command not found\n"
	fi

}



function domain() {

	cat config.db | grep 'Domain' | awk '{print $2}'
	
}

function set_domain() {
	
    printf "$menu" | awk '{print $3}' > config.txt
    printf "Domain: $(cat config.txt)" >| config.db
    rm config.txt
    printf "[+] Domain => $(domain) \n"
    
	

}



function logo() {
printf "\n\e[1;34m"

printf "   __|  |  / | |  _ \  |     __| __ __| \n"
printf " \__ \  . < __ _|   /  |     _|     |   \n"
printf " ____/ _|\_\  _| _|_\ ____| ___|   _| \e[1;33mxDB v0.1.3\e[1;34m \n"
                                        
                                                                           
printf "\n"
}

logo
printf "\e[0m [2] Scanners - [1] Footprinting - [0] Exploit\e[0m\n"
printf " [!] Type 'help' for more information\e[0m\n\n"
main



