# ft_server 
This is my 5th project of 1337 school (42 reseau)

This topic is intended to introduce you to system administration. It will make you aware
of the importance of using scripts to automate your tasks. For that, you will discover
the "docker" technology and use it to install a complete web server. This server will run
multiples services: Wordpress, phpMyAdmin, and a SQL database.

PS1 - instruction to use Docker
    To Build The Server : docker build -t ft_server . 
    To Run The Server : docker run -it -p 80:80 -p 443:443 --name ft_server ft_server
    To Stop The Server : docker stop ft_server
    To Open The Terminal of the Container : docker exec -it ft_server bash           
    
PS2 - I use a lot of documentation I hope that It will help you to understand my code .
