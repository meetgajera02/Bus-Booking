import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> _pages = [
    PageOne(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar with Images'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
                width:  double.infinity,
                height:  75,
                child: Stack(
                  children: [
                    Positioned(
                      bottom:  -10,
                      left: 0,
                      child: Align(
                        child: SizedBox(
                          child: Image.asset('assets/images/Cricle3.png')
                        )
                      )
                    ),
                    Positioned(
                      left:  70,
                      bottom:  0,
                      child: Align(
                        child: SizedBox(
                          child:  TextButton(
                            onPressed: (){},
                            child: Text('Don’t have an account?',style:  TextStyle (fontSize:  14,fontWeight:  FontWeight.w400,height:  1.2125,color:  Colors.white))
                          )
                        )
                      )
                    ),
                    Positioned(
                      right:  90,
                      bottom:  0,
                      child: Align(
                        child: SizedBox(
                          child:  TextButton(
                            onPressed: (){},
                            child: Text('SIGN UP',style:  TextStyle (fontSize:  14,fontWeight:  FontWeight.w400,height:  1.2125,color:  Color(0xfffa5951)))
                          )
                        )
                      )
                    ),
                  ],
                ),
               ),
            label: '',
          ),
        ],
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page 1 Content'),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page 2 Content'),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page 3 Content'),
    );
  }
}
