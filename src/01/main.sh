 #!/bin/bash
 var=$1
 number='^\-?[0-9,.,0-9]+$'
 if [[ $# -eq 0 ]]
 then
         echo "Error: input is empty"
 elif [[ $# -gt 1 ]]
 then
	 echo "Error: more than 1 parameters"
 elif [[ $var =~ $number ]]
 then
         bash input_number.sh
 else
         echo $var
 fi
