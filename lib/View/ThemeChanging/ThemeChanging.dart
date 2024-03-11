import 'package:dart_location_app/Provider/ThemeChangerProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ThemeChanging extends StatefulWidget {
  const ThemeChanging({super.key});

  @override
  State<ThemeChanging> createState() => _ThemeChangingState();
}

class _ThemeChangingState extends State<ThemeChanging> {
  @override
  Widget build(BuildContext context) {
    final themechanger = Provider.of<ThemeChanger>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:const  Text('Theme Change'),
        ),
        body: Column(
          children: [
            RadioListTile(title:const  Text('Light Theme'),value: ThemeMode.light, groupValue: themechanger.themeMode, onChanged: themechanger.setTheme),
            const SizedBox(height: 10,),
            RadioListTile(title: const Text('Dark Theme'),value: ThemeMode.dark, groupValue: themechanger.themeMode, onChanged: themechanger.setTheme),
          ],
        ),
      ),
    );
  }
}
