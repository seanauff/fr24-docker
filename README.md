# fr24-docker
FlightRadar24 feeder that connects to an exisiting dump1090 instance that outputs BEAST format messages on port 30005

Pull the image: ```docker pull seanauff/fr24```

Signup your receiver (skip if you already have a sharing key): ```docker run -it --rm seanauff/fr24-docker --signup```
The important parameters are your email address, and latitude, longitude, and elevation of your antenna. The other parameters are overridden when starting the docker image in the next step.

Start the image: ```docker run -d -e FR24_KEY=<your_sharing_key> seanauff/fr24-docker```
