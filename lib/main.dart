import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Este es el título global de la aplicación Flutter.
      //Aparece en la barra de título de la aplicación en el sistema operativo y en el administrador de tareas
      title: 'Flutter ListView',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 0, 13)),
        useMaterial3: true,
      ),
      //nombre de la pantalla principal de la app
      home: ListViewApp(title: 'Lista de Usuarios'),
    );
  }
}

class ListViewApp extends StatelessWidget {
  final List<String> nombres = [
    'Juan', 
    'María', 
    'Pedro', 
    'Luis', 
    'Ana'
    ];

  ListViewApp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: nombres.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(nombres[index]),
            //leading Representa el widget que se muestra a la izquierda del contenido
            leading: CircleAvatar(
              // Agrega una imagen de perfil al inicio del ListTile
              child: Text(nombres[index][
                  0]), // Utiliza la primera letra del nombre como imagen de perfil
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                // Muestra un SnackBar con el nombre seleccionado
                content: Text('Seleccionaste: ${nombres[index]}'),
              ));
            },
          );
        },
      ),
    );
  }
}
