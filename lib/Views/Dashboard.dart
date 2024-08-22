import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  String ptext = '';

  //Integers List
  List<int> numbers = [1, 2, 3, 4, 5];
  List<int> number1 = [5, 6, 7, 8, 9, 0];

  //Strings list
  List<String> number2 = ['one', 'two', 'three'];
  List<String> number3 = ['four', 'five', 'six'];

  //Numbers
  int one = 0;
  int two = 0;
  int three = 0;

  bool checkValue = false;

  void printNumbers(List<int> num) {
    for (var number in numbers) {
      print(number);
    }
  }

  void reversedNumbers(List<int> num) {
    num.sort((a, b) => b.compareTo(a));
    print(num);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard View'),
      ),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              //TextFields
              TextField(
                onSubmitted: (str) {
                  setState(() {
                    ptext = str;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Type here',
                  hintText: 'Type Something',
                  border: OutlineInputBorder(),
                ),
              ),

              //New texts
              Text(ptext),

              //New Buttons
              ElevatedButton(
                  onPressed: () {
                    printNumbers(numbers);
                  },
                  child: Text('Elevated Button')),

              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NextView()),
                    );
                  },
                  child: Text('Navigate to NextView')),

              ElevatedButton(
                  onPressed: () {
                    reversedNumbers(numbers);
                  },
                  child: Text('Elevated Button')),

              Checkbox(value: checkValue, onChanged: null), //Reversed Numbers

              TextButton(onPressed: null, child: Text('Text Button')),
              OutlinedButton(onPressed: null, child: Text('Outline Button')),
              IconButton(onPressed: null, icon: Icon(Icons.home))
            ],
          )),
      // bottomNavigationBar: MyTabView(),
    );
  }
}

class MyTextField extends StatefulWidget {
  const MyTextField({super.key});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your text here...',
              hintText: 'Enter text here'),
          onChanged: (text) {
            print("Text field input: $text");
          },
        ),
      ),
    );
  }
}

class SubmitButton extends StatefulWidget {
  const SubmitButton({super.key});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CustomWidget extends StatefulWidget {
  const CustomWidget({super.key});

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.pink, borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Define the NextView
class NextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next View'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NetworkCallWidget();
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SecondNext()),
            // );
          },
          child: Text('Go to Second Next View'),
        ),
      ),
    );
  }
}

class SecondNext extends StatelessWidget {
  const SecondNext({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next View'),
      ),
      body: Center(
        child: Text('Welcome to the Second View!'),
      ),
    );
  }
}

class NetworkCallWidget extends StatefulWidget {
  @override
  _NetworkCallWidgetState createState() => _NetworkCallWidgetState();
}

class _NetworkCallWidgetState extends State<NetworkCallWidget> {
  Map<String, dynamic>? _data;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/carts'));

    if (response.statusCode == 200) {
      setState(() {
        _data = json.decode(response.body);
        _isLoading = false;
      });
    } else {
      // Handle the error
      print('Failed to load data');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (_data == null) {
      return Center(child: Text('No data found'));
    }

    return ListView.builder(
      itemCount: _data?['carts']?.length ?? 0,
      itemBuilder: (context, index) {
        final cartItem = _data!['carts'][index];
        return ListTile(
          title: Text('Cart ID: ${cartItem['id']}'),
          subtitle: Text('Total: ${cartItem['total']}'),
        );
      },
    );
  }
}
