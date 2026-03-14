import'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/all_textfields.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  int selectedIndex=0;
  TextEditingController controller=TextEditingController();
  bool isFilled=false;
 
  List<AllTextfields> field=[];

  @override
  void initState() {
    super.initState();
    controller.addListener((){
      setState(() {
        isFilled=controller.text.isNotEmpty;
      });
    });

    field=[
       AllTextfields(
        label: 'Email', 
        hint: 'shan@gmail.com', 
        icon: Icons.email_outlined, 
        controller: TextEditingController(),
        obscureText: false,
        ),
        AllTextfields(
        label: 'Username', 
        hint: 'admin786', 
        icon: Icons.account_circle_outlined, 
        controller: TextEditingController(), 
        obscureText: false,
        ),
        AllTextfields(
        label: 'Birthday', 
        hint: '13/04/2005', 
        icon: Icons.calendar_month, 
        controller: TextEditingController(), 
        obscureText: false,
        ),
        AllTextfields(
        label: 'Password', 
        hint: '************', 
        icon: Icons.lock, 
        controller: TextEditingController(), 
        obscureText: true,
        ),
  ];

  for(var f in field){
    f.controller.addListener((){
      setState(() {});
    });
   }
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  Widget fieldWidgt(AllTextfields field){
    final size=MediaQuery.of(context).size;
    bool isFilled=field.controller.text.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
                    width: size.width*0.8,
                    height: size.height*0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      border: Border.all(
                        color: isFilled ?Colors.black : Colors.grey,
                        width: 1.5
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: size.height*0.1,
                        child: Row(
                          children: [
                            Icon(field.icon, color: isFilled ?Colors.blue : Colors.grey,),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: size.height*0.03,
                              child: VerticalDivider(
                                 thickness: 1,
                                 color: isFilled ?Colors.black : Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(field.label, style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: size.height*0.018
                                  ),),
                                  TextField(
                                    keyboardType: TextInputType.text,
                                    obscureText: field.obscureText,
                                    controller: field.controller,
                                    decoration: InputDecoration(
                                      hintText: field.hint,
                                      hintStyle: TextStyle(
                                        color: isFilled ?Colors.black : Colors.grey,
                                        fontSize: size.height*0.015
                                      ),
                                      border: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
    );
  }

  bool allFieldFilled(){
    return field.every((f)=>f.controller.text.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
      bool isNextEnable=allFieldFilled();
      return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               SizedBox(
                height: size.height*0.08,
               ),
               Text('Welcome!', style: TextStyle(
                fontSize: size.height*0.04,
                fontWeight: FontWeight.bold
               ),),
               SizedBox(
                height: size.height*0.03,
               ),
               RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: size.height*0.02,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Please complete the required\ninformation, and then press the ',
                    style: TextStyle(
                      color: Colors.black54
                    )),
                    TextSpan(
                      text: 'Next\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' button',
                      style: TextStyle(
                      color: Colors.black54
                    )
                    )
                  ]
                )),
                SizedBox(
                  height: size.height*0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      setState(() {
                        selectedIndex=0;
                      });
                    }, child: Text('Email Address', style: TextStyle(
                      color: selectedIndex==0 ? Colors.black : Colors.black54,
                    ),)),
                    SizedBox(
                      width: size.width*0.04,
                    ),
                    TextButton(onPressed: (){
                      setState(() {
                        selectedIndex=1;
                      });
                    }, child: Text('Phone Number', style: TextStyle(
                      color: selectedIndex==1 ? Colors.black : Colors.black54,
                    ),)),
                  ],
                ),
                SizedBox(
                  height: size.height*0.01,
                ),
                Column(
                  children: field.map((f) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: fieldWidgt(f),
                  )).toList(),
                ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                    style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                     children: [
                       TextSpan(text: 'Password must include a number, a letter, and\n a special character.')
                     ]
                ),
                  ),
              SizedBox(
                height: size.height*0.03,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    width: size.width*0.9,
                    height: size.height*0.08,
                    decoration: BoxDecoration(
                      color: isNextEnable ?Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(45),
                      border: Border.all(
                        color: isNextEnable ?Colors.blue : Colors.grey,
                        width: 1.5
                      )
                    ),
                    child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:isNextEnable ? Colors.blue :const Color.fromARGB(255, 192, 187, 187),
                    ),
                    onPressed: isNextEnable? (){
                    context.go('/homepage');
                   } : null, 
                   child: Text('Next', style: TextStyle(
                      color: isNextEnable ?Colors.white : Colors.black87,
                    ),)),
                  ),
                ),
              SizedBox(
                height: size.height*0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(onPressed: (){}, child: Text('Signin', 
                  style: TextStyle(
                    color: Colors.black,
                  ),)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}