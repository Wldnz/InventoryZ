
import 'package:flutter/material.dart';
import 'package:my_app/components/navigation.dart';
import 'package:my_app/pages/addProduct.dart';
import 'package:my_app/pages/all_logs.dart';
import 'package:my_app/pages/dashboard.dart';
import 'package:my_app/pages/manage_transaction.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Choose Option Trasanction'),
        backgroundColor: Colors.blueAccent.shade400,
        toolbarHeight: 65.0,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 50.0,
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            _card( AssetImage('assets/images/transaction-history.png'), 'Manage Transaction', ManageTransaction()),
            SizedBox(height: 50.0,),
            _card( AssetImage('assets/images/transaction-history.png'), 'Check Logs', AllHistory())
          ],
        ),
      ),
      bottomNavigationBar: NavigationBottomAdmin(),
      
    );
  }

  SizedBox _card(
    AssetImage image,
    String name,
    StatefulWidget page,
  ) {
    return SizedBox(
            width: 340.0,
            height: 200.0,
            child: Card(
              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(image: image,height: 60.0),
                    SizedBox(height: 20.0),
                    Text(name, style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0
                    ),)
                  ],
                ),
              ),
            ),
          );
  }
}