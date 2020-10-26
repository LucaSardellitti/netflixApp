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
            padding: EdgeInsets.only(right: 40.0, left: 40.0),
            
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
                      

                      //Input Email
                      InputForm("Email", false),
                      InputForm("Password", true),

                      //Button
                      RaisedButton(
                        onPressed: signIn,
                        child: Text("LOGIN "),
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

//Widget Design Input
class InputForm extends StatelessWidget{
  String type;
  final obscureText;

  InputForm(this.type, this.obscureText);

  @override
  Widget build (BuildContext context){
    
    //Input Email
    return new 
    Container(
      padding: EdgeInsets.only(top:10.0, bottom: 10.0),
      child:
        TextFormField(
          obscureText: obscureText,//Cache le password
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          validator: (input) {
            if(type == "Email"){
              if(input.isEmpty){
                return "Please type an email";
              }
            }   
            else if(type == "Password"){
              if(input.length < 6){
                return "Your password needs 6 characters";
              }
            }
            return null;
          },
          onSaved: (input) => type = input,
          decoration: InputDecoration(
            hintText: "$type",
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
    );
  }
}