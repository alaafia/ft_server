# ft_server 
This is my 5th project of 1337 school (42 reseau)

This topic is intended to introduce you to system administration. It will make you aware
of the importance of using scripts to automate your tasks. For that, you will discover
the "docker" technology and use it to install a complete web server. This server will run
multiples services: Wordpress, phpMyAdmin, and a SQL database.


            the latest version of Docker has some issues with Mojave, so here’s how you can use Docker without having to use the one in the MSC.
            Install Virtualbox from MSC.
            Install brew.
            Move your brew directory to goinfre then symlink it.
            Install docker and docker-machine using brew.
            brew install docker and brew install docker-machine
            Create a new machine and specify the driver:
            docker-machine create --driver virtualbox default
            Run:
            docker-machine env default then eval $(docker-machine env default)
            Test with a docker run -it debian or something to make sure it works.
            
PS1 - instruction to use Docker



    To Build The Server : docker build -t ft_server . 
    To Run The Server : docker run -it -p 80:80 -p 443:443 --name ft_server ft_server
    To Stop The Server : docker stop ft_server
    To Open The Terminal of the Container : docker exec -it ft_server bash           
    
    
PS2 - I use a lot of documentation I hope that It will help you to understand my code .
