.PHONY: test

test:
	mocha --reporter spec --compilers coffee:coffee-script test/*
