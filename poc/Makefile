%.py: %.sage
	sage -preparse $<
	mv $<.py $@

all: hash_to_base.py

test:
	sage elligator2.sage
	sage icart.sage
	sage simple_swu.sage
	sage swu.sage