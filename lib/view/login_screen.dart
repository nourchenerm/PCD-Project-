import 'package:flutter/material.dart';
import '../widget/navbar.dart';

class LoginScreen extends StatelessWidget {
  int _selectedIndex = 0;  // L'index de l'élément sélectionné dans la navbar
  

  // Liste des pages correspondant aux éléments de la navbar
  List<Widget> _pages = [
    Center(child: Text('Page Home')),
    Center(child: Text('Page Favoris')),
    Center(child: Text('Page Login')),
    Center(child: Text('Page Paramètres')),
  ];

  // Fonction appelée quand un élément de la navbar est sélectionné
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/background.jpg"), // Ton image de fond ici
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenu principal
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Texte au-dessus
                Text(
                  "Discover Best Place to Vacation",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
                // Bouton Log In
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogInScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Log In",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Bouton Sign Up
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: navbar(
        selectedIndex: _selectedIndex,
        // onItemTapped: _onItemTapped,
        backgroundColor: Colors.blue,  // Couleur de fond de la navbar
      ),
    );
  }

  void setState(Null Function() param0) {}
}
class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _rememberMe = false;
  int _selectedIndex = 0;  // L'index de l'élément sélectionné dans la navbar

  List<Widget> _pages = [
    Center(child: Text('Page Home')),
    Center(child: Text('Page Favoris')),
    Center(child: Text('Page Login')),
    Center(child: Text('Page Paramètres')),
  ];

  // Fonction appelée quand un élément de la navbar est sélectionné
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"), // Ton image de fond ici
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenu principal
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Texte "Sign In"
                Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                // Champ de texte pour le nom d'utilisateur
                TextField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Champ de texte pour le mot de passe
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // "Remember Me" checkbox et "Forget Password?"
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                    ),
                    Text(
                      "Remember Me",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Spacer(),
                    // Lien "Forget Password"
                    TextButton(
                      onPressed: () {
                        // Action pour "Forget Password"
                      },
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Bouton Log In
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Action pour Log In
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Log In",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Lien vers Sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: navbar(
        selectedIndex: _selectedIndex,
        // onItemTapped: _onItemTapped,
        backgroundColor: Colors.blue,  // Couleur de fond de la navbar
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int _selectedIndex = 0;  // L'index de l'élément sélectionné dans la navbar

  List<Widget> _pages = [
    Center(child: Text('Page Home')),
    Center(child: Text('Page Favoris')),
    Center(child: Text('Page Login')),
    Center(child: Text('Page Paramètres')),
  ];

  // Fonction appelée quand un élément de la navbar est sélectionné
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"), // Ton image de fond ici
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenu principal
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Texte "Create Your Account"
                Text(
                  "Create Your Account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                // Champ de texte pour le nom
                TextField(
                  decoration: InputDecoration(
                    labelText: "Name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Champ de texte pour l'email
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Champ de texte pour le mot de passe
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Champ de texte pour la confirmation du mot de passe
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Bouton Sign Up
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Action pour Sign Up
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: navbar(
        selectedIndex: _selectedIndex,
        // onItemTapped: _onItemTapped,
        backgroundColor: Colors.blue,  // Couleur de fond de la navbar
      ),
    );
  }
}
