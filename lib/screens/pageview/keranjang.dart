import 'package:defood/screens/order_screens/methodpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:styled_text/styled_text.dart';

class Keranjang extends StatefulWidget {
  @override
  _KeranjangState createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  final searchController = TextEditingController();
  //FirebaseAuth _auth = FirebaseAuth.instance;
  //CollectionReference order = FirebaseFirestore.instance.collection("users");
  //static String _restoran = "resto", _food ="makanan", _item = "item", _price = "harga";
  bool value = false, value2 = false;
  int index = 1;

  void dispose() {
    super.dispose();
  }
  @override
  void initState() {
    //ReadNestedData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA53C27),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  height: MediaQuery.of(context).size.height  / 2.9,
                  color: Color(0xFFBD452C),
                  child: Column(
                    children: <Widget>[
                      _pesanan(),
                      item(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFA53C27),
        child: Row(
          children: [
            SizedBox(width: 20.0), 
            Text(
              "Subtotal:",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              " XXXXXX",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 120.0),
            Container(height: 60.0,width: 1.0,),
            TextButton(
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MethodPesan()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(' PESAN ',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFBD452C),
                          )),
                    ],
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ))),
                ),
          ],
        ),
      ),
    );
  }

  //GABISA INI
  /*
  void ReadNestedData() { 
    var firebaseUser = _auth.currentUser;
    order.doc(firebaseUser.uid) .get().then((docSnapshot) => {
      _food = docSnapshot.data()["cart"][0]["nama_makanan"] 
      }); 
  }*/

  Widget _pesanan() {
    return Container(  
      child: Row(
          children: <Widget>[
            SizedBox(width: 10.0),  
            Checkbox(  
              checkColor: Colors.white,  
              activeColor: Color(0xFFA53C27),  
              value: this.value,  
              onChanged: (bool value) {  
                 setState(() {  
                  this.value = value;  
                });  
              },
            ),
            SizedBox(width: 10.0),
            Icon(
              Icons.circle,
              color: Colors.white,
              size: 40.0,
            ),
            SizedBox(width: 10.0), 
            Text(
              'Restoran X ',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                ),
            ),
          ],  
        ),
    );  
  }

  Widget item() {
    return Container(
      child: Row(
        children: <Widget>[
        SizedBox(width: 60.0), 
        Checkbox(  
          checkColor: Colors.white,  
          activeColor: Color(0xFFA53C27),  
          value: this.value2,  
          onChanged: (bool value2) {  
              setState(() {  
              this.value2 = value2;  
            });  
          },
        ),
        Icon(
          Icons.image,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(width: 10.0),
        Container (
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Item Xx',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  ),
              ),
              Text(
                'AAAAA',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  ),
              ),
              SizedBox(height: 5.0),
              Text(
                'Rp. Harga',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                  ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(width: 110.0), 
              Icon(
                Icons.close,
                color: Colors.white,
                size: 15.0,
              ),
              SizedBox(height: 25.0),
              Container(
                color: Color(0xFFA53C27),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add_box,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    Text('  ${index.toString()}  ' , style: TextStyle( color: Colors.white,),),
                    Icon(
                      Icons.indeterminate_check_box,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
      ),
    );
  }

}
