# fr24-docker
FlightRadar24 feeder that connects to an exisiting dump1090 instance that outputs BEAST format messages on port 30005

Pull the image: ```docker pull seanauff/fr24```

Signup your receiver by not specifying a feeder key (skip if you already have a sharing key): ```docker run -it --rm seanauff/fr24-docker```
The important parameters are your email address, and latitude, longitude, and elevation of your antenna. The other parameters are overridden when starting the docker image in the next step. Make a note of your sharing key!

Start the image: ```docker run -d -e PARMAM_FR24KEY=<your_sharing_key> -e TZ=<time_zone> -e --name=fr24feed seanauff/fr24-docker```
