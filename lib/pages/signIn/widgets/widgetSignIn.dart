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

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(top:200.0),
            color: Colors.red,
            child:
              Form(
                key: _formKey,
                child: 

                  Column(
                    children: <Widget>[
                      //Input Email
                      TextFormField(
                        validator: (input) {
                          if(input.isEmpty){
                            return "Please type an email";
                          }
                        },
                        onSaved: (input) => _email = input,
                        decoration: InputDecoration(
                          labelText: 'Email'
                        ),
                      ),

                      //Input Password
                      TextFormField(
                        validator: (input) {
                          if(input.length < 6){
                            return "Your password needs 6 characters";
                          }
                        },
                        onSaved: (input) => _password = input,
                        decoration: InputDecoration(
                          labelText: 'Password'
                        ),
                        obscureText: true,//Cache le password
                      ),

                      //Button
                      RaisedButton(
                        onPressed: signIn,
                        child: Text("SignIn "),
                        )
                    ]
                  ),

              )












              // Column(
              //   children: [
                  
              //     Container(
              //         width: MediaQuery.of(context).size.width,
              //         margin: const EdgeInsets.only(top: 180.0),
              //         color: Colors.orange,
              //         child: Text("Login"),
              //       ),

              //       Container(
              //         width: MediaQuery.of(context).size.width,
              //         color: Colors.yellow,
              //         child: Text("Login"),
              //       ),

              //       Container(
              //         width: MediaQuery.of(context).size.width,
              //         color: Colors.blue,
              //         child: Text("Button"),
              //       )
              //   ],
              // )
      
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