/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_LANG_TAB_H_INCLUDED
# define YY_YY_LANG_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    T_ASSERT = 258,                /* T_ASSERT  */
    T_BREAK = 259,                 /* T_BREAK  */
    T_CONST = 260,                 /* T_CONST  */
    T_CONTINUE = 261,              /* T_CONTINUE  */
    T_ELSE = 262,                  /* T_ELSE  */
    T_ENUM = 263,                  /* T_ENUM  */
    T_FALSE = 264,                 /* T_FALSE  */
    T_FN = 265,                    /* T_FN  */
    T_FOR = 266,                   /* T_FOR  */
    T_GOTO = 267,                  /* T_GOTO  */
    T_IF = 268,                    /* T_IF  */
    T_IMPORT = 269,                /* T_IMPORT  */
    T_IN = 270,                    /* T_IN  */
    T_IS = 271,                    /* T_IS  */
    T_MATCH = 272,                 /* T_MATCH  */
    T_MODULE = 273,                /* T_MODULE  */
    T_MUT = 274,                   /* T_MUT  */
    T_NONE = 275,                  /* T_NONE  */
    T_OR = 276,                    /* T_OR  */
    T_PUB = 277,                   /* T_PUB  */
    T_RETURN = 278,                /* T_RETURN  */
    T_SELECT = 279,                /* T_SELECT  */
    T_SIZEOF = 280,                /* T_SIZEOF  */
    T_STRUCT = 281,                /* T_STRUCT  */
    T_TRUE = 282,                  /* T_TRUE  */
    T_TYPE = 283,                  /* T_TYPE  */
    T_TYPEOF = 284,                /* T_TYPEOF  */
    T_UNION = 285,                 /* T_UNION  */
    T_UNSAFE = 286,                /* T_UNSAFE  */
    T_OFFSETOF = 287,              /* T_OFFSETOF  */
    T_CAPIDENT = 288,              /* T_CAPIDENT  */
    T_IDENT = 289,                 /* T_IDENT  */
    T_NUMBER = 290,                /* T_NUMBER  */
    T_QUOUTES = 291,               /* T_QUOUTES  */
    T_OPBIN = 292,                 /* T_OPBIN  */
    T_OPUNAR = 293,                /* T_OPUNAR  */
    T_AMPER = 294,                 /* T_AMPER  */
    T_ASTERISK = 295,              /* T_ASTERISK  */
    T_INIT = 296,                  /* T_INIT  */
    T_ASSIGN = 297,                /* T_ASSIGN  */
    T_COMPARE = 298,               /* T_COMPARE  */
    T_LBR = 299,                   /* T_LBR  */
    T_RBR = 300,                   /* T_RBR  */
    T_LSQ = 301,                   /* T_LSQ  */
    T_RSQ = 302,                   /* T_RSQ  */
    T_LCB = 303,                   /* T_LCB  */
    T_RCB = 304,                   /* T_RCB  */
    T_COMMA = 305,                 /* T_COMMA  */
    T_CONDOR = 306,                /* T_CONDOR  */
    T_CONDAND = 307,               /* T_CONDAND  */
    T_COMMENT = 308,               /* T_COMMENT  */
    T_LONCOMMENT = 309,            /* T_LONCOMMENT  */
    T_ERROR = 310                  /* T_ERROR  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_LANG_TAB_H_INCLUDED  */
