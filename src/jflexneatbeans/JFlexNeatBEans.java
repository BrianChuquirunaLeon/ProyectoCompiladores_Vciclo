/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jflexneatbeans;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.Scanner;

/**
 *
 * @author BRIAN
 */
public class JFlexNeatBEans {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
//        String path = "C:/Users/BRIAN/Documents/progra_competitiva/automatas/JFlexNeatBEans/src/jflexneatbeans/Lexer.flex";
//        generarLexer(path);        
//        try{
//            probarLexerFile();
//        }catch(Exception e){
//            
//        }
        
    }
    public static void generarLexer(String path){
        File file = new File (path);
        jflex.Main.generate(file);
    }
    
    public static String probarLexerFile(String texto) throws IOException{
        String retornar=null;
        
        File fichero=new File("fichero.txt");
        PrintWriter writer;
       //Scanner read = new Scanner(System.in);
       //String texto = read.nextLine();
       
        try{
            writer = new PrintWriter(fichero);
            
            writer.print(texto);
            writer.close();
        }
        catch(FileNotFoundException Ex){
            System.out.println("Se bugeo  :') ");
        }
        Reader reader= new BufferedReader (new FileReader("fichero.txt"));
        Lexer lexer=new Lexer(reader);
        
        while(true){
           Token token = lexer.yylex();
           if(token==null){
               System.out.println("EOF");
               retornar = "TOKEN: "+token+"\n"+retornar;
               return retornar;
               
           }
           
           System.out.println("TOKEN: "+token);
           retornar = "TOKEN: "+token+"\n"+retornar;
           System.out.println("retonar : "+retornar);
       }
        
    }
    
}
