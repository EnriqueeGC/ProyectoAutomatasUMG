%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yylineno;
extern char yytext;
void yyerror(const char* s);

//DECLARAR LAS ESTRUCTURAS Y VARIABLES NECESARIAS PARA EL ANALISIS
// DEFINE FUNCIONES PARA CONSTRUIR EL AFN Y REALIZAR LA CONVERSION A AFD 

}%

%token AUTOMATA_AFN
%token ALFABETO
%token ALFABETO_FIN
%token ESTADO
%token ESTADO_FIN
%token INICIAL
%token INICIAL_FIN
%token FINAL
%token FINAL_FIN
%token TRANSICIONES
%token TRANSICIONES_FIN
%token AUTOMATA_AFN_FIN
%token T_DIGITOS
%token T_LETRA
%token T_CARACTER
%token T_TRANSICION_VACIA
%token T_TAB
%token T_SALTO_DE_LINEA

%%



%%