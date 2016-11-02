
all:	x

x:	main.o encode.o decode.o
	gcc -o x encode.o decode.o main.o

main.o:	main.s
	gcc -c main.s

encode.o:	encode.s
	gcc -g -c encode.s

decode.o:	decode.s
	gcc -g -c decode.s

main.s:	main.c
	gcc -O2 -S main.c

clean:	
	rm -f x *.o main.s
