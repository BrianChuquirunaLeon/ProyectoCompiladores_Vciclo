package jflexneatbeans;
import static jflexneatbeans.Token.*;
%%
%class Lexer
%type Token

LETRA = [a-zA-Z]
DIGITO = [0-9]
OPERADOR_LOGICO = "<-"| ">" | "<" | ">=" | "<=" | "==" | "!="  | "and" | "or" 
OPERADOR_ARITMETICO = "+"|"-"|"*"|"/"|"mod"
VARIABLE = {LETRA} ( { LETRA} | {DIGITO} |  _ )* 
PALABRA_RESERVADA = "si"|"sino"|"fin_si"|"fin mientras"|"mientras"|"leer"|"escribir"|"inicio"|"fin"               
WHITE = [ \t\r\n]
LITERAL = (")( {LETRA} | {DIGITO | WHITE} )*(") 

%{
public String lexeme;
%}
%%
{WHITE} { /* Ignore */ }
"//".* { /* Ignore */ }
{LETRA} { return LETRA; }
{DIGITO}+ { return NUMERO; }
{OPERADOR_LOGICO} { return OPER_LOGICO; }
{OPERADOR_ARITMETICO} { return OPER_ARITMETICO; }
{VARIABLE} { lexeme = yytext(); return VARIABLE; }
{PALABRA_RESERVADA} {return PALABRA_RESERVADA; }
{LITERAL} { return LITERAL; }
. { System.out.println ("<ERROR>"); }
