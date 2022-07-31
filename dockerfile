
# This docker file will have apache2 and the soultion will be hosted on it

FROM ubuntu

RUN apt-get update -y
RUN apt-get install apache2 -y

LABEL author="choudharysumit150@gmail.com"
