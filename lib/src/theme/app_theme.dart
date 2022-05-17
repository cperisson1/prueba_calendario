import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  static const Color primary = Color.fromARGB(255, 29, 35, 94);

  static final TextStyle standarText=GoogleFonts.aBeeZee(
      fontSize: 12,
      color:  const Color.fromARGB(255, 255, 255, 255),
  );


  static final ThemeData lightTheme = ThemeData.light().copyWith(
    
    // Color primario
    primaryColor: Colors.red[700],

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0
    ),

    

   //textTheme
    textTheme:  TextTheme(
      //displayLarge: TextStyle(color:Colors.yellow),
      //displayMedium: TextStyle(color:Colors.lightBlueAccent),
      //bodyLarge: TextStyle(color:Colors.lightBlueAccent),
      bodyMedium: standarText,
      //bodySmall: TextStyle(color:Colors.lightBlueAccent),
    ),



    // TextButton Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom( primary: primary )
    ),

    // FloatingActionButtons
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 5
    ),

    // ElevatedButtons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo,
        shape: const StadiumBorder(),
        elevation: 0,
        textStyle: GoogleFonts.aBeeZee(fontSize: 14),
      ),  
    ),

    inputDecorationTheme: const InputDecorationTheme(
     
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide( color: primary ),
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(10), topRight: Radius.circular(10) )
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide( color: primary ),
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(10), topRight: Radius.circular(10) )
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(10), topRight: Radius.circular(10) )
      ),

    )



  );



  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    
    // Color primario
    primaryColor: Colors.indigo,

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0
    ),

    scaffoldBackgroundColor: Colors.black
    
  );



}