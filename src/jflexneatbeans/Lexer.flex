package jflexneatbeans;
import static jflexneatbeans.Token.*;
%%
%class Lexer
%type Token

LETRA = [a-zA-Z]
DIGITO= [0-9]

NUMERO = {DIGITO}+
LITERAL = (\")( {LETRA} | {DIGITO} | "  " )*(\")
OP_ASIGNACION="<-"
MAYOR = ">"
MENOR = "<"
MAYOR_IGUAL = ">=" 
MENOR_IGUAL = "<="
IGUALDAD = "=="
DIFERENCIA = "!="
AND = "and"
OR = "or"
MAS = "+"
MENOS = "-"
MULTIPLICACION = "*"
DIVISION = "/"
MODULO = "mod"
PARENTESIS_IZQ = "("
PARENTESIS_DER = ")"
INICIO_ALGORITMO = "Inicio_Algoritmo"
FIN_ALGORITMO = "Fin_Algoritmo"
SI = "Si"
ENTONCES = "Entonces"
SINO = "Sino"
FIN_SI = "Fin_si"
FIN_MIENTRAS = "Fin_Mientras"
MIENTRAS = "Mientras"
HACER = "Hacer"
LEER = "Leer"
ESCRIBIR = "Escribir"
VARIABLE = {LETRA} ( { LETRA} | {DIGITO} |  _ )*
WHITE = [ \t\r\n]
%{
public String lexeme;
%}
%%
{WHITE} { /* Ignore */ }
"//".* { /* Ignore */ }
{NUMERO} {return NUMERO;}
{LITERAL} { return LITERAL; }
{OP_ASIGNACION} { return OP_ASIGNACION; }
{MAYOR} {return MAYOR;}
{MENOR} {return MENOR;}
{MAYOR_IGUAL} {return MAYOR_IGUAL;}
{MENOR_IGUAL} {return MENOR_IGUAL;}
{IGUALDAD} {return IGUALDAD;}
{DIFERENCIA} {return DIFERENCIA;}
{AND} {return AND;}
{OR} {return OR;}
{MAS} {return MAS;}
{MENOS} {return MENOS;}
{MULTIPLICACION} {return MULTIPLICACION;}
{DIVISION} {return DIVISION;}
{INICIO_ALGORITMO} {return INICIO_ALGORITMO;}
{FIN_ALGORITMO} {return FIN_ALGORITMO;}
{SI} {return SI;}
{ENTONCES} {return ENTONCES;}
{SINO} {return SINO;}
{FIN_SI} {return FIN_SI;}
{FIN_MIENTRAS} {return FIN_MIENTRAS;}
{MIENTRAS} {return MIENTRAS;}
{HACER} {return HACER;}
{LEER} {return LEER;}
{ESCRIBIR} {return ESCRIBIR;}
{PARENTESIS_IZQ} {return PARENTESIS_IZQ;}
{PARENTESIS_DER} {return PARENTESIS_DER;}
{VARIABLE} { lexeme = yytext(); return VARIABLE; }
. { System.out.println ("<ERROR>"); }
