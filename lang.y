%{
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>

/* V specified */
typedef struct {
    bool isModulePresented;
    bool needReturn;
} Vinfo;

extern Vinfo g_Info;

extern FILE *yyin;
extern int yyerrc;
extern size_t yylineno;

extern void yyerror(const char *p_str);
int yylex();
%}

%start commands

// %token T_ANY T_BOOL T_VOIDPTR
// %token T_I8 T_I16 T_I32 T_I64
// %token T_U8 T_U16 T_U32 T_U64
// %token T_F32 T_F64
// %token T_ISIZE T_USIZE
// %token T_STRING T_RUNE

%token T_ASSERT
%token T_BREAK
%token T_CONST
%token T_CONTINUE
%token T_ELSE
%token T_ENUM
%token T_FALSE
%token T_FN
%token T_FOR
%token T_GOTO
%token T_IF
%token T_IMPORT
%token T_IN
%token T_IS
%token T_MATCH
%token T_MODULE
%token T_MUT
%token T_NONE
%token T_OR
%token T_PUB
%token T_RETURN
%token T_SELECT
%token T_SIZEOF
%token T_STRUCT
%token T_TRUE
%token T_TYPE
%token T_TYPEOF
%token T_UNION
%token T_UNSAFE
%token T_OFFSETOF
%token T_CAPIDENT
%token T_IDENT
%token T_NUMBER
%token T_QUOUTES
%token T_OPBIN
%token T_OPUNAR
%token T_AMPER
%token T_ASTERISK
%token T_INIT
%token T_ASSIGN
%token T_COMPARE
%token T_LBR
%token T_RBR
%token T_LSQ
%token T_RSQ
%token T_LCB
%token T_RCB
%token T_COMMA
%token T_CONDOR
%token T_CONDAND
%token T_COMMENT
%token T_LONCOMMENT
%token T_ERROR

%%
commands:
    /* empty */
    |
    commands command
    ;

command: // Add const block, module block, import block, struct, enum, union
    module
    |
    struct
    |
    union
    |
    functionBlock
    ;

functionBlock:
    T_FN T_IDENT T_LBR argsFunction T_RBR T_IDENT T_LCB body T_RCB
    |
    T_FN T_IDENT T_LBR argsFunction T_RBR T_LCB body T_RCB
    ;

argsFunction:
    arg T_COMMA arg
    |
    arg
    ;

arg:
    |
    T_MUT T_IDENT T_IDENT
    |
    T_MUT T_IDENT T_AMPER T_IDENT
    |
    T_IDENT T_IDENT
    |
    T_IDENT T_AMPER T_IDENT
    ;

module:
    T_MODULE T_IDENT
    ;

struct:
    T_STRUCT T_CAPIDENT T_LCB structBody T_RCB
    ;

union:
    T_UNION T_CAPIDENT T_LCB structBody T_RCB
    ;

structBody:
    |
    structBody structBodyPart
    ;

structBodyPart:
    T_IDENT T_IDENT
    |
    T_IDENT T_CAPIDENT
    ;

varinit:
    T_MUT T_IDENT T_INIT calc
    |
    T_MUT T_IDENT T_INIT item
    |
    T_MUT T_IDENT T_INIT statement
    |
    T_IDENT T_INIT calc
    |
    T_IDENT T_INIT item
    |
    T_IDENT T_INIT statement
    ;

body:
    |
    body bodypart
    ;

bodypart:
    unsafe
    |
    statement
    |
    condition
    |
    ret
    ;

unsafe:
    T_UNSAFE T_LCB actions T_RCB
    ;

actions:
    |
    actions action
    ;

action:
    statement
    |
    ret
    ;

statement:
    T_LBR statement T_RBR
    |
    varinit
    |
    assignation
    |
    call
    |
    ret
    ;

ret:
    T_RETURN statement
    |
    T_RETURN calc
    ;

assignation:
    T_IDENT T_ASSIGN operation
    |
    T_IDENT T_ASSIGN statement
    |
    T_IDENT T_ASSIGN item
    |
    T_IDENT T_ASSIGN stringItem
    |
    T_ASTERISK T_IDENT T_ASSIGN operation
    |
    T_ASTERISK T_IDENT T_ASSIGN statement
    |
    T_ASTERISK T_IDENT T_ASSIGN item
    |
    T_ASTERISK T_IDENT T_ASSIGN stringItem
    ;

operation: // Doesnt include functions calls
    calc T_OPBIN calc
    |
    calc T_ASTERISK calc
    |
    calc T_AMPER calc
    |
    calc
    ;

calc:
    T_LBR calc T_RBR
    |
    item T_OPBIN item
    |
    item T_ASTERISK item
    |
    item T_AMPER item
    |
    T_OPUNAR item
    |
    T_ASTERISK item
    |
    T_AMPER item
    |
    comparison
    ;

comparison:
    item T_COMPARE item
    |
    item T_COMPARE statement
    |
    statement T_COMPARE item
    ;

    // T_IDENT T_COMPARE stringItem
    // |
    // stringItem T_COMPARE T_IDENT
    // |
    // stringItem T_COMPARE statement
    // |
    // statement T_COMPARE stringItem
    // |
    // stringItem T_COMPARE stringItem

item:
    T_IDENT
    |
    T_NUMBER
    ;

stringItem:
    T_QUOUTES
    ;

condition:
    T_IF condbody T_LCB body T_RCB
    ;

condbody:
    condbody andor condpart
    |
    condpart
    ;

condpart:
    calc
    |
    statement
    ;

andor:
    T_CONDAND
    |
    T_CONDOR
    ;

call:
    T_IDENT T_LBR callArgs T_RBR

callArgs:
    |
    callArgs callArgument
    ;

callArgument:
    statement
    |
    item
    |
    stringItem
    |
    calc
    ;
%%

Vinfo g_Info = {
    .isModulePresented = false,
    .needReturn = false
};

int yyerrc = 0;
int yylex(YYSTYPE *, void *);

void yyerror(const char *p_str)
{
    fprintf(stderr, "Error: %s at %d\n", p_str, yylineno);
}

int yywrap()
{
    if (yyerrc == 0)
    {
        printf("Success!\n");
    }

    return 1;
}

int main(int argc, char **argv)
{
    memset(&g_Info, 0, sizeof(g_Info));

    yylineno = 0;
    yyin = fopen(argv[1], "r");
    if (yyin == NULL)
    {
        fprintf(stderr, "Error: file not found\n");
        return 1;
    }

    yyparse();
    fclose(yyin);
}