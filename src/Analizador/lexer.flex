package Analizador;
import java.util.ArrayList;
import java_cup.runtime.*;
%%
%class Lexer
%line
%column
%cup
%{
public String errlex="";
public ArrayList<Token> ts = new ArrayList<Token>();
public Symbol symbol(int type){
return new Symbol(type,yyline,yycolumn);
}
%}

a = [a-zA-Z]
n = [0-9]
espacio = [\n\t\r ]
num = {n}+ ("."{n})?
id = {a} ({a}|{n}|"_")*
op = "+" | "-" | "*" |"/"
or = "<" |"<="| ">="|"=="|"!="|">"
ol = "|"|"&"
asig = "="
pc=";"
c=","
mientras = "Mientras"|"mientras"|"MIENTRAS"
finmientras = "FinMientras"|"finmientras"|"FINMIENTRAS"|"Fin Mientras"|"fin mientras"|"finMientras"
hacer = "hacer"|"HACER"|"Hacer"
tipo = "Entero"|"Real"
inicio = "Programa"
fin = "FinPrograma"
leer = "Leer"|"leer"
escribir = "Escribir"|"escribir"
si = "Si"
entonces = "Entonces"
sino = "Sino"|"sino"
finsi = "FinSi"|"Finsi"|"Fin si"
para = "Para"|"para"
hasta = "Hasta"|"hasta"
finpara = "FinPara"|"fin para"
paso = "Paso"|"paso"
segun = "Segun"|"segun"
finsegun = "FinSegun"|"Fin Segun"
deotromodo = "DeOtroModo"|"De Otro Modo"
comilla = "\""|"”"|"“"
puntos=":"
alfa =  {comilla} ({a}|{n}|"_"|" "|{op}|{or}|{ol}|{asig})* {comilla}
caso = "opcion_" {num} {puntos}


%%
{mientras} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.mientras);}
{inicio} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.inicio);}
{fin} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.fin);}
{hacer} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.hacer);}
{escribir} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.escribir);}
{leer} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.leer);}
{finmientras} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.finmientras);}
{tipo} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.tipo);}
{si} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.si);}
{entonces} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.entonces);}
{sino} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.sino);}
{finsi} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.finsi);}
{hasta} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.hasta);}
{para} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.para);}
{finpara} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.finpara);}
{paso} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.paso);}
{finsegun} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.finsegun);}
{deotromodo} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.deotromodo);}
{segun} {ts.add(new Token("Palabra reservada ", yytext()));return symbol(sym.segun);}
"(" {ts.add(new Token("P. Izquierdo ", yytext()));return symbol(sym.pi);}
")" {ts.add(new Token("P. Derecho ", yytext()));return symbol(sym.pd);}
{op} {ts.add(new Token("operador aritmético ", yytext()));return symbol(sym.op);}
{ol} {ts.add(new Token("operador logico ", yytext()));return symbol(sym.ol);}
{num} {ts.add(new Token("Numero ", yytext()));return symbol(sym.num);}
{id} {ts.add(new Token("Identificador ", yytext()));return symbol(sym.id);}
{alfa} {ts.add(new Token("Alfanumerico ", yytext()));return symbol(sym.alfa);}
{or} {ts.add(new Token("Op. relacional ", yytext()));return symbol(sym.or);}
{pc} {ts.add(new Token("punto y coma ", yytext()));return symbol(sym.pc);}
{c} {ts.add(new Token("coma ", yytext()));return symbol(sym.c);}
{puntos} {ts.add(new Token("puntos ", yytext()));return symbol(sym.puntos);}
{caso} {ts.add(new Token("Case ", yytext()));return symbol(sym.caso);}
{asig} {ts.add(new Token("Asignación ", yytext()));return symbol(sym.asig);}
{espacio} {}
. {errlex+="\nError lexico: " + yytext() + " caracter no valido en pos: " + (yyline+1) + "," + (yycolumn+1);}