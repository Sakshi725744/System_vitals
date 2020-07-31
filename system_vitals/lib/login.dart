import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:systemvitals/vitals.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _username,_password;
  String pasw="";
  String email="";
  bool passwordVisible=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child:Stack(
        children: [
          Positioned.fill(
            child: Align(
             alignment: Alignment.topCenter,
            child:ClipPath(
            clipper: MyClipper() ,
            child: Container(
              height:MediaQuery.of(context).size.height/2-50,
              child: Padding(
                padding: EdgeInsets.fromLTRB(150,120,15,100),
                child: Text("WELCOME!", style: TextStyle( color: Colors.white,fontSize: 40), overflow: TextOverflow.fade,)
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors:[
                  const Color(0xffac1cff),
                  const Color(0xffd90f9d),
                      const Color(0xffFF1476),
                 //const Color(0xff00f0ff)

                ])
              ),
            ),
          ),
          ),
          ),
          Positioned(
            top:MediaQuery.of(context).size.height/2-175,
            right:MediaQuery.of(context).size.width/2-150,
            height: 370,
            width:300,

            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.white, width: 5)
              ),
             color: Colors.black.withOpacity(0.5) ,

                child: Column(
                  children: [

                    Padding(
                      padding: EdgeInsets.only(top:100),
                      child: Container(
                        child: Column(
                      children:[
                        Container(
                          width: 250.0,
                          height: 60.0,
                          alignment: Alignment.center,
                          child: TextFormField(
                            validator: (value) {
                              RegExp exp = new RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
                             if (value.isEmpty) {
                             return 'Please enter some text';
                             }
                             else if(!exp.hasMatch(value))
                               {
                                 return 'Please enter valid id';
                               }
                             return null;
                              },

                            controller: _username,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person,color: Colors.white,),
                              //hintText: ,
                              border: const OutlineInputBorder(),







                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(33.0),
                            color: Colors.black,
                            border: Border.all(width: 1, color: Colors.white,),
                          ),
                        ),
                      SizedBox(
                        height: 60,
                      ),

                        Container(
                          width: 250.0,
                          height: 60.0,
                          alignment: Alignment.center,
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },

                            obscureText: passwordVisible,
                            style: TextStyle(color:Colors.white),
                            controller: _password,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                              border: const OutlineInputBorder(),
                              prefixIcon:const Icon(Icons.security,color: Colors.white,),
                              suffixIcon: IconButton(icon:Icon(Icons.remove_red_eye,color: Colors.white), onPressed: (){
                                setState(() {
                                  passwordVisible=!passwordVisible;

                                });
                              },),



                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(33.0),
                            color: Colors.black,
                            border: Border.all(width: 1.0, color: Colors.white),
                          ),
                        ),
                      ],
                        ),
                      ),
                    ),
    ],

                ),
              )

          ),
          Positioned(
            top:MediaQuery.of(context).size.height*3/4-40,
            left:MediaQuery.of(context).size.width/2-87,
            child: RaisedButton(
                 onPressed:() {
                  if (!_formKey.currentState.validate()) {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Processing Data')));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Vitals()),
                  );
                  }    },


              child:Container(
                  width: 140.0,
                  height: 54.0,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child:Text("LOGIN",style: TextStyle(fontSize: 35, color: Colors.white),textAlign: TextAlign.center,),),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color:  const Color(0xffd90f9d),
                    //border: Border.all(width: 1.0, color: Colors.transparent),
                  )
              ),
                color: Colors.transparent,



),
          ),
          Align(
            alignment: Alignment(0,0.8),
            child: RichText(
              text: new TextSpan(
                style: TextStyle(fontSize: 20),
                children:[
               TextSpan(
                text: "click",
              ),
                  TextSpan(
                    text: " HERE ",
                    recognizer: new TapGestureRecognizer()
                        ..onTap=  () {
                      print("clicked");
                        },

                    style: TextStyle(fontWeight: FontWeight.bold),

                  ),
                  TextSpan(
                    text: "to register",
                  )
    ]

            )
          )
          ),
        ],
      )
      ),
    );
  }

}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path= new Path();
    path.lineTo(0, size.height-100);
    path.quadraticBezierTo(size.width/4, size.height, size.width, size.height-20);
    path.lineTo(size.width, 0);
    path.close();
    return path;


  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;

  }

}
