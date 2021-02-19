import 'package:do_together/models/task.dart';
import 'package:do_together/screens/profile_page.dart';
import 'package:do_together/screens/statisticsPage.dart';
import 'package:do_together/utills/custom_delegate_for_search.dart';
import 'package:flutter/material.dart';
import 'AddTaskPage.dart';
import 'Home.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<Widget> tabPages = [
    Home(),
    StatisticsPage(),
  ];

  int pageIndex=0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: tabPages,
        controller: _pageController,
        onPageChanged: (index){
          setState(() {
            pageIndex = index;
          });
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            var result = await showSearch<String>(
              context: context,
              delegate: CustomDelegate(),
            );
          },
          icon: Icon(Icons.search,color: Colors.black87,),
        ),
        actions: [
          Container(padding:EdgeInsets.symmetric(horizontal: 10.0),child: IconButton(icon: Icon(Icons.notifications,color: Colors.grey,),onPressed: (){},)),
          Container(padding:EdgeInsets.symmetric(horizontal: 10.0),child: IconButton(icon: Icon(Icons.person,color: Colors.grey,), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfilePage()));
          },))
        ],
        backgroundColor: Colors.white70,
      ),

      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.greenAccent,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.stacked_bar_chart), label:"Statistics"),
        ],
        currentIndex: pageIndex,
        onTap: (index)=>this._pageController.animateToPage(index,duration:Duration(milliseconds: 500),curve: Curves.fastOutSlowIn),
      ),
    );
  }
}
