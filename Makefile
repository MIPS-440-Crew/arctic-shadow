LEX = flex
YACC = bison
CC = gcc

LEX_FILE = lexer.l
YACC_FILE = parser.y
TARGET = program

all: $(TARGET)

$(TARGET): lex.yy.c parser.tab.c
	$(CC) -o $(TARGET) lex.yy.c parser.tab.c

lex.yy.c: $(LEX_FILE) parser.tab.h
	$(LEX) $(LEX_FILE)

parser.tab.c: $(YACC_FILE)
	$(YACC) -d $(YACC_FILE)

clean:
	rm -f lex.yy.c parser.tab.c parser.tab.h $(TARGET)
