/* Doesnt include: */
/*    - interfaces */
/*    - multithreading */
/*    - critical section support */
/*    - `defer` block support */
/*    - channel support */

%{
#include <stdio.h>
#include "lang.tab.h"
%}

%%
"assert" {printf("assert"); return T_ASSERT;}
"break" {printf("break"); return T_BREAK;}
"const" {printf("const"); return T_CONST;}
"continue" {printf("continue"); return T_CONTINUE;}
"else" {printf("else"); return T_ELSE;}
"enum" {printf("enum"); return T_ENUM;}
"false" {printf("false"); return T_FALSE;}
"fn" {printf("fn"); return T_FN;}
"for" {printf("for"); return T_FOR;}
"goto" {printf("goto"); return T_GOTO;}
"if" {printf("if"); return T_IF;}
"import" {printf("import"); return T_IMPORT;}
"in" {printf("in"); return T_IN;}
"is" {printf("is"); return T_IS;}
"match" {printf("match"); return T_MATCH;}
"module" {printf("module"); return T_MODULE;}
"mut" {printf("mut"); return T_MUT;}
"none" {printf("none"); return T_NONE;}
"or" {printf("or"); return T_OR;}
"pub" {printf("pub"); return T_PUB;}
"return" {printf("return"); return T_RETURN;}
"select" {printf("select"); return T_SELECT;}
"sizeof" {printf("sizeof"); return T_SIZEOF;}
"struct" {printf("struct"); return T_STRUCT;}
"true" {printf("true"); return T_TRUE;}
"type" {printf("type"); return T_TYPE;}
"typeof" {printf("typeof"); return T_TYPEOF;}
"union" {printf("union"); return T_UNION;}
"unsafe" {printf("unsafe"); return T_UNSAFE;}
"__offsetof" {printf("__offsetof"); return T_OFFSETOF;}

[A-Z][a-zA-Z0-9_]* {printf("%s", yytext); return T_CAPIDENT;}
[a-zA-Z_][a-zA-Z0-9_]* {printf("%s", yytext); return T_IDENT;}
[0-9]+ {printf("%s", yytext); return T_NUMBER;}
\"([^\\\"]|\\\n|\\.)*\" { printf ("string: %s\n",yytext); return T_QUOUTES;}
\'([^\\\']|\\\n|\\.)*\' { printf ("string: %s\n",yytext); return T_QUOUTES;}
(\.)|(\^)|(\/)|(\|)|(<<)|(>>) {printf("%s", yytext); return T_OPBIN;}
(\+)|(\-) {printf("%s", yytext); return T_OPUNAR;}
(\&) {printf("%s", yytext); return T_AMPER;}
(\*) {printf("%s", yytext); return T_ASTERISK;}
(\:=) {printf("%s", yytext); return T_INIT;}
(%=)|(\/=)|(\*=)|(\+=)|(-=)|= {printf("%s", yytext); return T_ASSIGN;}
>|<|>=|<=|==|!= {printf("%s", yytext); return T_COMPARE;}
\( {printf("%s", yytext); return T_LBR;}
\) {printf("%s", yytext); return T_RBR;}
\[ {printf("%s", yytext); return T_LSQ;}
\] {printf("%s", yytext); return T_RSQ;}
\{ {printf("%s", yytext); return T_LCB;}
\} {printf("%s", yytext); return T_RCB;}
\, {printf("%s", yytext); return T_COMMA;}
(\|\|) {printf("%s", yytext); return T_CONDOR;}
(&&) {printf("%s", yytext); return T_CONDAND;}
"\/\/".* {printf("xx"); return T_COMMENT;}
"\/\*".*"\*\/" {printf("xf"); return T_LONCOMMENT;}

[ \t]+ {printf("%s", yytext);}
"\r\n"|[\n] {printf("\n"); yylineno++;}

. {printf("\e[1;31m``%s``\e[0m", yytext); return T_ERROR;}
%%

// "bool" {printf("bool"); return T_BOOL;}
// "string" {printf("string"); return T_STRING;}
// "i8" {printf("i8"); return T_I8;}
// "i16" {printf("i16"); return T_I16;}
// "i32" {printf("i32"); return T_I32;}
// "i64" {printf("i64"); return T_I64;}
// "u8" {printf("u8"); return T_U8;}
// "u16" {printf("u16"); return T_U16;}
// "u32" {printf("u32"); return T_U32;}
// "u64" {printf("u64"); return T_U64;}
// "f32" {printf("f32"); return T_F32;}
// "f64" {printf("f64"); return T_F64;}
// "isize" {printf("isize"); return T_ISIZE;}
// "usize" {printf("usize"); return T_USIZE;}
// "voidptr" {printf("voidptr"); return T_VOIDPTR;}
// "any" {printf("any"); return T_ANY;}
// "rune" {printf("rune"); return T_RUNE;}