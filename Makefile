
all:
	cargo build
	ln -fs $(PWD)/target/libpoints-*.so $(PWD)/target/libpoints.so

