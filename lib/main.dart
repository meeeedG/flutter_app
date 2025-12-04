<<<<<<< HEAD
import 'package:flutter/material.dart'; 
import 'package:github_api_flutter_app/pages/Contact/contact_add.dart'; 
import 'package:github_api_flutter_app/pages/Home/home_page.dart'; 

void main() { 
  runApp(const MyApp()); 
} 
=======
import 'package:flutter/material.dart'; // Importe la bibliothèque Material de Flutter
import 'package:github_api_flutter_app/pages/Contact/contact_add.dart'; // Importe la page d'ajout de contact
import 'package:github_api_flutter_app/pages/Home/home_page.dart'; // Importe la page d'accueil
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Importe la bibliothèque pour gérer les variables d'environnement
void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
 // Charge les variables d'environnement depuis le fichier .env
  runApp(const MyApp()); // Démarre l'application avec le widget racine MyApp
} // Fin de la fonction main
>>>>>>> 7390fbc77921ac4b2eef943fb384f20753eb44dd

class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 

  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      home: const HomePage(),  
      initialRoute: '/', 
      routes: { 
        "/addContact": (context) => AddContact(), 
      }, 
    ); 
  } 
} 




