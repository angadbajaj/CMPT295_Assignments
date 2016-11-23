
all:	x

x:	main.o rank.o
	gcc -o x main.o rank.o

y:	main.o rank1.o
	gcc -o y main.o rank1.o


main.o:	main.s
	gcc -c main.s

main.s:	main.c
	gcc -S -O2 main.c

rank.o:	rank.s
	gcc -c rank.s

rank.s:	rank.c
	gcc -S -O2 rank.c

rank1.o: rank1.s
	gcc -c rank1.s

rank1.s: rank1.c
	gcc -S -O2 rank1.c

clean:
	rm -f *.o *.s x y
