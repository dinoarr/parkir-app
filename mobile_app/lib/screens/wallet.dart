import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_app/screens/home.dart';

class WalletWidget extends StatefulWidget {
  const WalletWidget({super.key});

  @override
  State<WalletWidget> createState() => _WalletWidgetState();
}

class _WalletWidgetState extends State<WalletWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wallet",
          style: TextStyle(
              color: Color(0xFF45C47C),
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF45C47C)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        leadingWidth: 50,
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Connect with your E-Wallets",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.5, color: Color(0xFFB3B1B0)),
                      ),
                    ),
                    child: Row(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
