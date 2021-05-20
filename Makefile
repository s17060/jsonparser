all: build
build:	
	flex parser.lex
	bison -yd parser.y
	gcc y.tab.c lex.yy.c -o jsonparser
clean:
	rm lex.yy.c y.tab.c y.tab.h
cleanall:
	rm lex.yy.c y.tab.c y.tab.h jsonparser
