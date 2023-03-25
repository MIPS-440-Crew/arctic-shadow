LEX = flex
YACC = bison
CC = gcc

LEX_FILE = lexer.l
YACC_FILE = parser.y
TARGET = program

all: $(TARGET)

$(TARGET): lex.yy.c y.tab.c
	$(CC) -o $(TARGET) lex.yy.c y.tab.c

lex.yy.c: $(LEX_FILE)
	$(LEX) $(LEX_FILE)

y.tab.c: $(YACC_FILE)
	$(YACC) -d $(YACC_FILE)

clean:
	rm -f lex.yy.c y.tab.c y.tab.h $(TARGET)
