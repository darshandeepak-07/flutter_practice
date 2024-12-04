import 'package:flutter/material.dart';
import 'package:flutter_app_1/user/User.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.user});
  final User user;

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<Dashboard> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Dashboard"),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_car), label: "Car"),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_bike), label: "Bike"),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_boat), label: "Boat")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      body: <Widget>[
        // Car Screen
        Card(
          shadowColor: Colors.transparent,
          margin: EdgeInsets.all(2.0),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Welcome, ${widget.user.userName}"),
                    const Text("Hello, this is a Car booking page")
                  ],
                )),
          ),
        ),

        // Bike Page
        const Column(
          children: [
            Text("This is a bike booking page"),
            Text("Continue booking your bike....")
          ],
        ),

        // Boat page
        const Column(
          children: [
            Text("This is a bost booking page"),
            Text("Continue booking your boats....")
          ],
        )
      ][_selectedIndex],
    );
  }
}

class ItemCard extends StatefulWidget {
  const ItemCard({super.key, navItem, required this.navitem,required this.userName});
  final String navitem;
  final String userName;

  @override
  _ItemCard createState() => _ItemCard();
}

class _ItemCard extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      margin: EdgeInsets.all(2.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Welcome ${widget.userName}"),
                const Text("Hello, this is a Car booking page")
              ],
            )),
      ),
    );
  }
}
