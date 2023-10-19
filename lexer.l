%{
#include "mi_parser.tab.h"
#include <stdlib.h>
#include <stdio.h>
%}

%option noyywrap

%%

"<AUTOMATA_AFN>"        { yylval.stravl = strdup(yytext); return AUTOMATA_AFN;}
"<ALFABETO>"            { yylval.stravl = strdup(yytext); return ALFABETO;}
"</ALFABETO>"           { yylval.stravl = strdup(yytext); return ALFABETO_FIN;}
"<ESTADO>"              { yylval.stravl = strdup(yytext); return ESTADO;}
"</ESTADO>"             { yylval.stravl = strdup(yytext); return ESTADO_FIN;}
"<INICIAL>"             { yylval.stravl = strdup(yytext); return INICIAL;}
"</INICIAL>"            { yylval.stravl = strdup(yytext); return INICIAL_FIN;}
"<FINAL>"               { yylval.stravl = strdup(yytext); return FINAL;}
"</FINAL>"              { yylval.stravl = strdup(yytext); return FINAL_FIN;}
"<TRANSICIONES>"        { yylval.stravl = strdup(yytext); return TRANSICIONES;}
"</TRANSICIONES>"       { yylval.stravl = strdup(yytext); return TRANSICIONES_FIN;}
"</AUTOMATA_AFN>"       { yylval.stravl = strdup(yytext); return AUTOMATA_AFN_FIN;}
[0-9]+                  { yylval.valInt = atoi(yytext); return T_DIGITOS;}
[a-zA-Z]                { yylval.stravl = strdup(yytext); return T_LETRA;}
[^&]                    { yylval.charval = yytext[0]; return T_CARACTER;} // Reconocer caracteres del alfabeto excepto '&'
&                       { return T_TRANSICION_VACIA;} // Reconocer el símbolo '&' como transición vacía
[ \t\n]                 { /* Ignorar espacios en blanco, tabulaciones y saltos de línea */ }
\t                      { return T_TAB; }
\n                      { return T_SALTO_DE_LINEA; }
.                       { printf("Error léxico en la línea %d: caracter desconocido '%s'\n", yylineno, yytext); }

%%