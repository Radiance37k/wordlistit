# Usage:
`./wordlistit.sh somedomain.com`

# About:
This script attempts to create a custom wordlist specific to the specified domain.

## Why this script exists:
I listened to Tomnomnom's nahamcon talk about wordlists and was really intrigued. This is script is based on his talk to automate tools and techniques he was talking about.

# Installation:
`git clone https://github.com/Radiance37k/wordlistit.git`

## Requirements
In order to make this script work there are a few programs that you need to have installed.\

Links to the needed programs are:
---|---
gau | GO111MODULE=on go get -u -v github.com/lc/gau
unfurl | https://github.com/tomnomnom/unfurl
tok | https://github.com/tomnomnom/hacks/tree/master/tok
fff | go get -u github.com/tomnomnom/fff
html-tool | go get -u github.com/tomnomnom/hacks/html-tool

# Thanks
Thanks to:\
Nahamcon for an awesome convention\
Tomnomnom for all his scripts and his Nahamcon talk.\
lc for creating gau.

You for taking the time to read this and possibly using my script

# TO DO
Installscript?\
Add flag to use fff, it takes quite some time to fetch that data
