CC = gcc
OUT = lang
SRC = \
	lex.yy.c \
	lang.tab.c

LEX = flex
SRC_LEX = lang.l

YACC = bison
YACCFLAGS = -d
SRC_YACC = lang.y

RM = rm -f

all: yacc lex
	$(CC) $(SRC) -o $(OUT)

lex:
	$(LEX) $(SRC_LEX)

yacc:
	$(YACC) $(YACCFLAGS) $(SRC_YACC)

clean:
	$(RM) $(OUT) $(SRC)