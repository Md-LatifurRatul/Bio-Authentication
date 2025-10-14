import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BioAuthenticationHomeScreen extends StatefulWidget {
  const BioAuthenticationHomeScreen({super.key});

  @override
  State<BioAuthenticationHomeScreen> createState() =>
      _BioAuthenticationHomeScreenState();
}

class _BioAuthenticationHomeScreenState
    extends State<BioAuthenticationHomeScreen> {
  bool _isAuthenticated = false;
  final LocalAuthentication _auth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildUI(), floatingActionButton: _authButton());
  }

  Widget _authButton() {
    return FloatingActionButton(
      onPressed: () async {
        if (_isAuthenticated) {
          final bool canAuthenticateWithBiometric =
              await _auth.canCheckBiometrics;
          print(canAuthenticateWithBiometric);
          if (canAuthenticateWithBiometric) {
            try {
              final bool didAuthenticate = await _auth.authenticate(
                localizedReason: "Please Authenticate first",

                options: const AuthenticationOptions(biometricOnly: true),
              );

              setState(() {
                _isAuthenticated = didAuthenticate;
              });
            } catch (e) {
              print(e.toString());
            }
          }
        } else {
          setState(() {
            _isAuthenticated = false;
          });
        }

        setState(() {
          _isAuthenticated = !_isAuthenticated;
        });
      },
      child: Icon(_isAuthenticated ? Icons.lock : Icons.lock_open),
    );
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Account Balance",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          if (_isAuthenticated)
            const Text(
              "\$ 25,23232",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          if (!_isAuthenticated)
            const Text(
              "******",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}
