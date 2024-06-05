import 'package:flutter/material.dart';
import 'package:flutter_app_containers_and_buttons/buttons/color_btn.dart';
import 'package:flutter_app_containers_and_buttons/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _mainColor = Colors.white;
  final TextEditingController _controller = TextEditingController();

  void _changeColor(Color color) {
    setState(() {
      _mainColor = color;
    });
  }

  void _changeColorFromText() {
    String colorString = _controller.text.trim().toLowerCase();
    Color? newColor = _stringToColor(colorString);
    if (newColor != null) {
      setState(() {
        _mainColor = newColor;
      });
    }
  }

  Color? _stringToColor(String colorString) {
    Map<String, Color> colorMap = {
      "зеленый": Colors.green,
      "розовый": Colors.pink,
      "синий": Colors.blue,
      "оранжевый": Colors.orange,
      "фиолетовый": Colors.purple,
      "красный": Colors.red,
      "черный": Colors.black,
      "белый": Colors.white,
      "желтый": Colors.yellow,
    };
    return colorMap[colorString];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Меняем цвет'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                color: _mainColor,
              ),
            ),
          ),
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ColorButton(color: Colors.green, onTap: _changeColor),
                ColorButton(color: Colors.pink, onTap: _changeColor),
                ColorButton(color: Colors.blue, onTap: _changeColor),
                ColorButton(color: Colors.orange, onTap: _changeColor),
                ColorButton(color: Colors.purple, onTap: _changeColor),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Напишите цвет',
                border: OutlineInputBorder(),
              ),
            ),
          ),
           const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _changeColorFromText,
                  child: const Text("Применить"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}