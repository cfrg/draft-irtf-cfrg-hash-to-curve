%.py: %.sage
	@sage -preparse $<
	@mv $<.py $@

test_%: %.sage all
	@sage $<

all: common.py hash_to_base.py

test: all \
	test_hash_to_base \
	test_icart         \
	test_simple_swu    \
	test_ell2montg     \
	test_ell2edwards   \
	test_bonehfranklin \
	test_ell2supers    \
	test_fouquetibouchi

clean:
	@rm -f *.pyc *.sage.py common.py hash_to_base.py
