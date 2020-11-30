
all: test_some.out


%.o: %.c
	gcc -c -g -Wall -fPIC -o $(@) $< 

some_cmock.c some_cmock.h: some.o
	cmock $<

test.o: some_cmock.h
some_cmock.o: some_cmock.c some_cmock.h

test_some.out: some.o some_cmock.o test.o
	strip -N main some.o
	gcc -g -Wall -o $(@) $^ -lcua -ldl \
        -Wl,-T,some_cmock.lds \
        -Wl,--unresolved-symbols=ignore-all 

clean:
	rm -rf *.o *.out *.lds *_cmock.*


.PHONY: all clean

