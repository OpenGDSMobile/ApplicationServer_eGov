#!/bin/bash

if [ -d ./webapp ]
then
	echo "Directory Exists"
	mv ./public/bower_components/korGovMobileRuntime/css/egovframework ./webapp/css
	mv ./public/bower_components/korGovMobileRuntime/js/egovframework ./webapp/js
	mv ./public/bower_components/korGovMobileRuntime/images/egovframework ./webapp/images
	rm -rf public	
	rm glyphicons-halflings-regular.woff
else 
	echo "Directory Not Exists"
fi

