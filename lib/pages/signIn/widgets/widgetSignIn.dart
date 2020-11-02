import 'package:AppYnov/pages/home/home.dart';
import 'package:flutter/material.dart';
import '../signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

//Widget Principal
class SignInWidget extends State<SignIn> {
  //Private variable
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build (BuildContext ctxt){
    return new Scaffold(
      body: 
        Stack(
        //fit: StackFit.expand,
        children: [
          //Background image
          Image.asset(
            'assets/images/imgFilm.jpg',
            fit: BoxFit.cover,
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(right: 40.0, bottom: 55.0, left: 40.0),
            
            // Background Gradient 
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.5],
                colors: [Colors.transparent, Colors.grey[850]]
                )
            ),
            child:
              Form(
                key: _formKey,
                child: 

                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

                      //Titre
                      Container(
                        margin: EdgeInsets.only(bottom: 30.0),
                        child: 
                          Align(
                            alignment: Alignment.topLeft,
                            child: 
                              Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                      ),

                      //Input Email
                      Container(
                        margin: EdgeInsets.only(bottom: 15.0),
                        child:
                          TextFormField(
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            validator: (input) {
                              if(input.isEmpty){
                                return "Please type an email";
                              }
                              return null;
                            },
                            onSaved: (input) => _email = input,
                            decoration: InputDecoration(
                              hintText: "Email",
                              filled: true,
                              fillColor: Colors.white24,
                              focusColor: Colors.white,
                              hoverColor: Colors.white,
                              contentPadding: const EdgeInsets.all(20.0),

                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white30,
                                ),
                                borderRadius: BorderRadius.circular(30), 
                              ),

                              disabledBorder: InputBorder.none,
                              errorBorder:  OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white30,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white30,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),

                              focusedErrorBorder:  OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white30,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                      ),

                      //Input Password
                      Container(
                        margin: EdgeInsets.only(bottom: 15.0),
                        child:
                          TextFormField(
                            obscureText: true,//Cache le password
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            validator: (input) {
                              
                              if(input.length < 6){
                                return "Your password needs 6 characters";
                              }
                              return null;
                            },
                            onSaved: (input) => _password = input,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.remove_red_eye_sharp, color: Colors.black38),
                              hintText: "Password",
                              filled: true,
                              fillColor: Colors.white24,
                              focusColor: Colors.white,
                              hoverColor: Colors.white,
                              contentPadding: const EdgeInsets.all(20.0),

                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white30,
                                ),
                                borderRadius: BorderRadius.circular(30), 
                              ),

                              disabledBorder: InputBorder.none,
                              errorBorder:  OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white30,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white30,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),

                              focusedErrorBorder:  OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white30,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                      ),

                      //Button
                      Container(
                        margin: EdgeInsets.only(top: 30.0),
                        child:
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: 
                              RaisedButton(
                                color: Color(0xfffac495),//Préfixe oxff (car ffac495 -> RVB)
                                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                onPressed: signIn,
                                child: Text("LOGIN "),
                                
                              ),
                          ),
                      )
                      
                      
                    ]
                  ),

              )
          )

        ],
        
      ),
    );
  }

  //Connection de l'utiliateur
  Future<void> signIn() async{
    await Firebase.initializeApp();
    
    final formState = _formKey.currentState;

    //Si le formulaire est valide
    if(formState.validate()){
      formState.save();
      try {
        //Connexion
        UserCredential userCredential  = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        
        //Redirection sur la homepage
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }
      //Gestion des exeptions
      on FirebaseAuthException catch(e){
        //Si l'utilisateur n'existe pas
        if(e.code == 'user-not-found'){
          print('No user founs fot that email.');
        }
        //Si le mot de passe est mauvais
        else if(e.code == 'wrong-password'){
          print('Wrong password provided for that user.');
        }
      } catch(e){
        print(e.message);
      }
    }
  }

}

