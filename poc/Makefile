%.py: %.sage
	sage -preparse $<
	mv $<.py $@

all: hash_to_base.py

test_elligator:
	sage elligator2.sage
test_icart:
	sage icart.sage
test_simple_swu:
	sage simple_swu.sage
test_swu:
	sage swu.sage
test_bonehfranklin:
	sage bonehfranklin.sage
test_fouquetibouchi:
	sage fouquetibouchi.sage
test_hash_to_base:
	sage hash_to_base.sage

test: all test_elligator \
	test_icart \
	test_swu  \
	test_simple_swu \
	test_bonehfranklin \
	test_fouquetibouchi \
	test_hash_to_base

clean:
	rm -f *.sage.py hash_to_base.py
	
