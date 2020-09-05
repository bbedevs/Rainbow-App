import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {


  Map data = {};
  @override
  Widget build(BuildContext context) {

    double c_width = MediaQuery.of(context).size.width*0.8;
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String imageURL = data['rainbow_Image'];
    print ('Data: $data');
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 60, 67, 99),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(50),
                child: SpinKitChasingDots(
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
              Container(
                   decoration: BoxDecoration(
                    image: DecorationImage(
                      image: new NetworkImage(imageURL),
                      fit: BoxFit.cover,
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,120,0,0),
                  child: Column(
                    children: <Widget>[
                      FlatButton.icon(
                        onPressed: () async {
                          dynamic result =  await Navigator.pushNamed(context, '/choose_location');
                          setState(() {
                            data = {
                              'location': result ['location'],
                              'placename' : result['placename'],
                              'rainbow_Image': result["rainbow_Image"],
                              'probability': result['probability']
                            };
                          });
                        },
                        icon: Icon(
                          Icons.edit_location,
                          color: Colors.grey[300],

                        ),
                        label: Text('Edit Location',
                          style: TextStyle(
                            color: Colors.grey[300],
                          ),),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            data['placename'].toUpperCase(),
                            style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 2,
                              color: Colors.white,

                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'hello',
                        style: TextStyle(
                          fontSize: 66,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
    ]
    )
    )
    );


  }
}
