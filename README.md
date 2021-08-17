# dws-dev-006-bash

This is a bash script to run a command and if the result was successful the script will end with a success message and for unsuccessful cases, it will try n times in every i seconds which n and i should pass true the CLI. In case you do not pass n or i through the command line then the script will read these values from ENV variables TRY_INTERVAL and TRY_NUMBER. So even if the ENV values do not supply the script will replace the default values as TRY_INTERVAL=5 and TRY_NUMBER=12. If the user does not provide any command the script will exit with a proper message. 

Here are some example:
-------------------------------------------------------------

Input : ./try.sh -i 2 -n 3 true 

Output: Success!

-------------------------------------------------------------

Input : ./try.sh -i 2 -n 3 false

Output: Command was not successful after 3 tries in 6 seconds.

------------------------------------------------------------
Now we export TRY_NUMBER = 5

Input : ./try.sh -i 2 false

Output: Command was not successful after 5 tries in 10 seconds.

------------------------------------------------------------
Now we export TRY_NUMBER = 5 and export TRY_INTERVAL = 1

Input : ./try.sh false

Output: Command was not successful after 5 tries in 5 seconds.

--------------------------------------------------------------
If you do not pass "-i" with CLI or ENV

Input : ./try.sh -n 3 false

Output: Command was not successful after 3 tries in 15 seconds.

You see it replaced the default value of TRY_INTERVAL=5

--------------------------------------------------------------
If you do not pass "-i" and "-n" with CLI or ENV

Input: ./try.sh

Output: Command was not successful after 12 tries in 60 seconds.

---------------------------------------------------------------
In case you do not pass the command:

Input : ./try.sh -n 3

Output: No argument supplied!

--------------------------------------------------------------
