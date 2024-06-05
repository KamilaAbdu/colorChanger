import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Введите свои данные'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                  labelText: 'Заголовок', 
                  border: OutlineInputBorder()
                  ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: 'Имя',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: 'Фамилия',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                labelText: 'Возраст',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Сохранено')
                  ),);
            }, 
            child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
