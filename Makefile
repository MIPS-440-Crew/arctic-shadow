SOURCES =
TARGET = arctic_shadow-ALPHA

# compilers and flags #
CC = gcc
LEX = flex
YACC = bison
CFLAGS = -g -Og -Wall -Wno-unused-variable -Wno-unused-function -std=c99
LDFLAGS = -ly -lfl
#######################

# lex & yacc sources #
LEX_SRC = main.l
YACC_SRC = main.y
######################

# generated files without the .c extension #
LEX_GEN_ = main.lex.yy
YACC_GEN_ = main.tab
############################################

all: $(TARGET)

$(TARGET): $(SOURCES) $(LEX_GEN_).c $(YACC_GEN_).c
	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(SOURCES) $(LEX_GEN_).c $(YACC_GEN_).c

$(LEX_GEN_).c: $(LEX_SRC)
	$(LEX) -o $@ $(LEX_SRC)

$(YACC_GEN_).c: $(YACC_SRC)
	$(YACC) -o $@ -dv $(YACC_SRC)

clean:
	rm -f $(TARGET) $(LEX_GEN_).c $(YACC_GEN_).c $(YACC_GEN_).h
