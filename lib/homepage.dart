import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/categories/jacket.dart';
import 'package:test_app/categories/men.dart';
import 'package:test_app/categories/shoes.dart';
import 'package:test_app/categories/women.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ScrollController _scrollController=ScrollController();
  bool showCategories=false;

  @override
  void initState(){
    super.initState();

    _scrollController.addListener((){
      if(_scrollController.offset >10 && !showCategories){
        setState(() {
          showCategories=true;
        });
      }else if(_scrollController.offset<=10 && showCategories){
        setState(() {
          showCategories=false;
        });
      }
    });
  }
  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }
  List swapeImages=[
    'assets/s11.jpg',
    'assets/s1.jpg',
    'assets/s4.jpg',
    'assets/s6.jpg',
  ];
  List bottomImages=[
    'assets/s1.jpg',
    'assets/s2.jpg',
    'assets/s11.jpg',
    'assets/s4.jpg',
    'assets/s4.jpg',
    'assets/s6.jpg',
    'assets/s7.jpg',
    'assets/s8.jpg',
  ];
  int topTab=0;
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

     final categories= [
  {
    'cat' : 'For You', 
    'onTap':(){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
    }
  },
   {
    'cat' : 'Men' , 
    'onTap':(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Men()));
    }
  },
   {
    'cat' : 'Women' , 
    'onTap':(){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>Women()));
    }

  },
   {
    'cat' : 'Jackets' , 
    'onTap':(){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Jacket()));
    }
  },
     {
    'cat' : 'Shoes' , 
    'onTap':(){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Shoes()));
    }
  },
 ];

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height*0.05,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      topTab=0;
                    });
                  },
                  child: Column(
                    children: [
                      Text('For You',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        height: 3,
                        width: 60,
                        color: topTab==0 ? Colors.black : Colors.transparent,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width*0.25,
                ),
               GestureDetector(
                  onTap: (){
                    setState(() {
                      topTab=1;
                    });
                  },
                  child: Column(
                    children: [
                      Text('Explore',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        height: 3,
                        width: 60,
                        color: topTab==1 ? Colors.black : Colors.transparent,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              controller: _scrollController,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(135, 201, 198, 198),
                        hintText: 'Search Your Product...',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.format_list_bulleted_sharp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(65)
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.02,
                  ),
                  Visibility(
                    visible: showCategories,
                    child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                    children: List.generate(categories.length, (s){
                      final cat = categories[s];
                      return  Row(
                        children: [
                           SizedBox(
                        width: size.width*0.02,
                      ),
                          SizedBox(
                            height: size.height*0.05,
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                backgroundColor: selectedIndex==s ? Colors.blue : Colors.grey,
                              ),
                              onPressed: (){
                                setState(() {
                                  selectedIndex=s;
                                });
                                (cat['onTap'] as VoidCallback)();
                              }, child: Text(cat['cat'] as String,
                            style: TextStyle(
                              color: selectedIndex==s ? Colors.white : Colors.black,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.bold,
                              fontSize: size.height*0.02
                            ),)),
                          ),
                        ],
                      );
                    })
                                  ),
                                ),
                  ),
              SizedBox(
                height: size.height*0.01,
              ),
                  SizedBox(
                    height:size.height*0.3,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: swapeImages.length,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Container(
                                            width: size.width-20,
                                            height: size.height*0.3,
                                            decoration: BoxDecoration(
                          image: DecorationImage(image:AssetImage(swapeImages[index]), fit: BoxFit.cover),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(21)
                                            ),
                                          ),
                        );
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Text('Emerging Designers',
                    style: GoogleFonts.anton(
                      fontSize: size.height*0.05,
                      fontWeight: FontWeight.bold
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Explore small businesses and discover unique, one-of-a-',
                          style: TextStyle(
                            color: Colors.black
                          )),
                          TextSpan(
                            text: '\nkind looks.',
                          style: TextStyle(
                            color: Colors.black
                          )),
                        ]
                      )
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.02,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Material(
                        shadowColor: Colors.black,
                        elevation: 13,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          width: size.width*0.42,
                          height: size.height*0.05,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text('Shop Now', style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                              SizedBox(
                                width: size.width*0.04,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  iconColor: Colors.white,
                                ),
                                onPressed: (){}, child: Icon(Icons.arrow_forward, size: 30,))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.02,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: Text('For You: ', style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: (bottomImages.length/2).ceil(),
                    itemBuilder: (context, index){
                      int first=index*2;
                      int second=index*2+1;
                      return Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: Row(
                        children: [
                          Container(
                            width: size.width*0.45,
                            height: size.height*0.20,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(bottomImages[first]),
                                fit: BoxFit.cover
                              ),
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(16)
                            ),
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                 Container(
                              width: size.width*0.45,
                              height: size.height*0.06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                                gradient: LinearGradient(
                                   begin: Alignment.topCenter,
                                   end: Alignment.bottomCenter,
                                  colors: [
                                       Colors.black.withOpacity(0.1), // top (very transparent)
                                       Colors.black.withOpacity(0.7), // bottom (darker)
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundImage: AssetImage('assets/s11.jpg'),
                                    ),
                                    Text(' Modern Shoes', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10
                                    ),),
                                    SizedBox(
                                      width: size.width*0.06,
                                    ),
                                    Text('Rs 1999', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),)
                                  ],
                                ),
                              ),
                            ),
                              ],
                            )
                          ),
                          SizedBox(
                            width: size.width*0.04,
                          ),
                          if(second<bottomImages.length)
                           Container(
                            width: size.width*0.45,
                            height: size.height*0.20,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                image: AssetImage(bottomImages[second]),
                                fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(16)
                            ),
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                 Container(
                              width: size.width*0.45,
                              height: size.height*0.06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                                gradient: LinearGradient(
                                   begin: Alignment.topCenter,
                                   end: Alignment.bottomCenter,
                                  colors: [
                                       Colors.black.withOpacity(0.1), // top (very transparent)
                                       Colors.black.withOpacity(0.7), // bottom (darker)
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundImage: AssetImage('assets/s11.jpg'),
                                    ),
                                    Text(' Modern Shoes', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10
                                    ),),
                                    SizedBox(
                                      width: size.width*0.06,
                                    ),
                                    Text('Rs 1999', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),)
                                  ],
                                ),
                              ),
                            ),
                              ],
                            )
                          )
                        ],
                      ),
                    );
                    }
                  )
                ],
              
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.blue,
          selectedLabelStyle: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          items: [
            BottomNavigationBarItem(
              label: 'Shop',
              icon: Icon(Icons.shop)),
              BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(Icons.shopping_cart_outlined)),
              BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person_sharp)),
            
        ]),
    );
  }
}