import 'package:flutter/material.dart';
import 'package:my_todo_list/Views/Dashboard.dart';

void main() {
  runApp(new NewApplicattion());
}

class NewApplicattion extends StatefulWidget {
  const NewApplicattion({super.key});

  @override
  State<NewApplicattion> createState() => _NewApplicattionState();
}

class _NewApplicattionState extends State<NewApplicattion> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Applications',
      home: DashboardWidget(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String ttext = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void button1Pressed() {
    setState(() {
      ttext = 'button1Pressed';
    });
  }

  void button2Pressed() {
    setState(() {
      ttext = 'button2Pressed';
    });
  }

  void button3Pressed() {
    setState(() {
      ttext = 'button3Pressed';
    });
  }

  void button4Pressed() {
    setState(() {
      ttext = 'button4Pressed';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StateFull Widget',
      home: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.red,
          title: Text("Flutter Buttons"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Button on the leading side
            onPressed: () {
              print('Back button pressed'); // Action for leading button
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_forward), // Button on the trailing side
              onPressed: () {
                print(
                    'Forward button pressed'); // Action for first trailing button
              },
            ),
            IconButton(
              icon: Icon(Icons.close), // Second button on the trailing side
              onPressed: () {
                print(
                    'Close button pressed'); // Action for second trailing button
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text('Hello'),
                  SizedBox(height: 10),
                  new Text('Hello1'),
                  SizedBox(height: 10),
                  new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text('Col1'),
                        SizedBox(height: 10),
                        new Text('Col2'),
                        SizedBox(height: 10),
                        new Text('Col3'),
                        SizedBox(height: 10),
                      ]),
                  new Text('Hello2'),
                ],
              ),

              Container(
                height: 500,
                padding: EdgeInsets.all(15),
                child: DashboardWidget(),
              ),

              Container(
                height: 100,
                padding: EdgeInsets.all(10),
                child: AnotherBottomBar(),
              ),

              Container(
                height: 100,
                padding: EdgeInsets.all(10),
                child: MyBottomTabbar(),
              ),

              Container(
                height: 400,
                padding: EdgeInsets.all(10),
                child: MyTabView(),
              ),

              Container(
                height: 400,
                child: MyStackView(),
              ),

              Container(
                height: 200, // Fixed height
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text('Title1'),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                    ListTile(
                      title: Text('Title2'),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                    ListTile(
                      title: Text('Title3'),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),

              new Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: new Text(
                      "Hello Padding",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration:
                            TextDecoration.underline, // Apply text decoration
                        decorationColor: Colors.red, // Color of the decoration
                        decorationStyle: TextDecorationStyle.dashed,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  )
                ],
              ),

              //Button1
              ElevatedButton(
                onPressed: () {
                  button1Pressed();
                },
                child: Text(ttext),
              ),
              SizedBox(height: 10),

              //Button2
              ElevatedButton(
                onPressed: () {
                  button2Pressed();
                },
                child: Text(ttext),
              ),
              SizedBox(height: 10),

              //Button3
              ElevatedButton(
                onPressed: () {
                  // Button 1 action
                  button3Pressed();
                },
                child: Text(ttext),
              ),
              SizedBox(height: 10),

              //Button4
              ElevatedButton(
                onPressed: () {
                  // Button 1 action
                  button4Pressed();
                },
                child: Text(ttext),
              ),
              SizedBox(height: 10),

              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightGreen, width: 2.0),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  'Boxed Label',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.red),
                ),
              ),
              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(10),
                height: 200,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:
                      Colors.pink, // Move the color here inside BoxDecoration
                  border: Border.all(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Here is container Text',
                  style: TextStyle(
                      color: Colors.white), // Text color for better contrast
                ),
              ),
              SizedBox(height: 20),

              Container(
                child: Text('Here is container Text'),
                padding: EdgeInsets.all(10),
                height: 100,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:
                      Colors.green, // Move the color here inside BoxDecoration
                  border: Border.all(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                transform: new Matrix4.rotationZ(0.5),
              )

              // Add your buttons or other widgets here
            ],
          ),
        ),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Generate a list of items dynamically
    final List<String> items = List.generate(20, (index) => 'Item $index');

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: items.length, // Number of items in the list
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]), // Display each item
            trailing: Icon(Icons.arrow_forward),
          );
        },
      ),
    );
  }
}

class MyAnotherList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> items =
        List.generate(10, (index) => 'Hello - Item $index');

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: Icon(Icons.arrow_back),
          );
        },
      ),
    );
  }
}

class MyStackView extends StatelessWidget {
  const MyStackView({super.key});

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Card(
          color: Colors.red,
          child: new Padding(padding: EdgeInsets.all(200)),
        ),
        new Card(
          color: Colors.green,
          child: new Padding(padding: EdgeInsets.all(150)),
        ),
        new Card(
          color: Colors.blue,
          child: new Padding(padding: EdgeInsets.all(100)),
        ),
        new Card(
          color: Colors.yellow,
          child: new Padding(padding: EdgeInsets.all(50)),
        ),
        new Card(
          color: Colors.pink,
          child: new Padding(padding: EdgeInsets.all(25)),
        ),
      ],
    );
  }
}

class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns in the grid
        crossAxisSpacing: 8.0, // Horizontal space between items
        mainAxisSpacing: 8.0, // Vertical space between items
      ),
      itemCount: 30, // Number of items in the grid
      itemBuilder: (context, index) {
        return Container(
          color: Colors.primaries[
              index % Colors.primaries.length], // Different color for each item
          child: Center(
            child: Text(
              'Item $index',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Four Tabs Example'),
          bottom: TabBar(
            tabs: [
              Tab(text: "Tab 1", icon: Icon(Icons.looks_one)),
              Tab(text: "Tab 2", icon: Icon(Icons.looks_two)),
              Tab(text: "Tab 3", icon: Icon(Icons.looks_3)),
              Tab(text: "Tab 4", icon: Icon(Icons.looks_4)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Content for Tab 1")),
            Center(child: Text("Content for Tab 2")),
            Center(child: Text("Content for Tab 3")),
            Center(child: Text("Content for Tab 4")),
          ],
        ),
      ),
    );
  }
}

class MyBottomTabbar extends StatelessWidget {
  const MyBottomTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ]),
          ),
        ),
      ),
    );
  }
}

class AnotherBottomBar extends StatelessWidget {
  const AnotherBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Hello'),
          ),
          body: TabBarView(children: [
            Center(child: Text('Tab 1 Content')),
            Center(child: Text('Tab 2 Content')),
            Center(child: Text('Tab 3 Content')),
          ]),
          bottomNavigationBar: TabBar(tabs: [
            Tab(icon: Icon(Icons.cabin)),
            Tab(icon: Icon(Icons.home)),
            Tab(
              icon: Icon(Icons.settings),
            )
          ]),
        ));
  }
}
