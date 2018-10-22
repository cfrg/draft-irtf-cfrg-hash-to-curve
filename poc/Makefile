%.py: %.sage
	sage -preparse $<
	mv $<.py $@

all: hash_to_base.py
