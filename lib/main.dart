import 'package:flutter/material.dart';
import 'package:mosh/screens/profile.dart';
import 'package:mosh/screens/search.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'V2ex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'V2ex'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  var _selectedPageIndex = 0;
  late List<Widget> _pages;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectedPageIndex = 0;
    _pages = const [Home(), Search(), Profile()];
    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("V2ex"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person))
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up), label: "trending"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile")
        ],
        showUnselectedLabels: false,
        currentIndex: _selectedPageIndex,
        onTap: (selectedPageIndex) {
          setState(() {
            _selectedPageIndex = selectedPageIndex;
            _pageController.jumpToPage(_selectedPageIndex);
          });
        },
      ),
    );
  }
}
