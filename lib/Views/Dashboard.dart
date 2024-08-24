import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:my_todo_list/Utils/app_color.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final List<String> items = ['One', 'Two', 'Three', 'Four', 'Five'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.redColor,
        body: Stack(
          children: [
            // Text('Buy & Sale'),

            Positioned(
              top: 200,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    //SearchBar
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightGrayColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                                filled: true,
                                fillColor: AppColors.lightGrayColor,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onChanged: (text) {
                                print('Typed $text');
                              },
                            ),
                          ),
                          SizedBox(width: 16),
                          IconButton(
                            icon: Icon(Icons.filter_list, color: Colors.white),
                            onPressed: () {
                              print('Filter Button');
                            },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

                    // Expand Buttons
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColors.redColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Spacer(),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                print('Check All Tapped');
                              },
                              child: Text(
                                'Check All',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ],
                    ),

                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            height: 150, // Set a fixed height for the Container
                            child: ListView.builder(
                              scrollDirection: Axis
                                  .horizontal, // Change scrolling direction to horizontal
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .white, // Background color for the item
                                      borderRadius: BorderRadius.circular(
                                          8), // Rounded corners
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ), // Set a fixed width for each item
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          color: AppColors.backgroundColor,
                                          child: Center(
                                            child: Icon(Icons.image,
                                                size: 50,
                                                color: Colors.grey[600]),
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                8), // Space between the image and text
                                        Text(
                                          items[index],
                                          style: TextStyle(
                                            fontSize: 20.0, // Example font size
                                            color: Colors.blue, // Example color
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ));
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  
                  
                  
                  
                  
                  
                  
                  
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
