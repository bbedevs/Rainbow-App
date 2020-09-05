import 'package:flutter/material.dart';
import 'package:rainbowapp/services/rainbow_information.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:rainbowapp/shared/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';





class choose_location extends StatefulWidget {
  @override
  _choose_locationState createState() => _choose_locationState();
}

class _choose_locationState extends State<choose_location> {
  @override
  String _location;
  final _formKey = GlobalKey<FormState>();
  bool _showSpinKit;
  bool valid_data;
  bool _showError;

  Future<bool> updateLocation(String Location) async
  {
       RainbowInfo rainbowInfo = new RainbowInfo(location: Location);
       valid_data =  await rainbowInfo.getRainbowInfo(false);
       print (valid_data);
       if (valid_data == true)
         {
           Navigator.pop(context, {
           'placename': rainbowInfo.placename,
           'rainbow_Image':  rainbowInfo.rainbowImage,
           'probability': rainbowInfo.probability
         });
         }
       else
         {
          return valid_data;
         }

  }

  @override
  void initState() {
    _showSpinKit = false;
    _showError = false;
    super.initState();
  }

  void showSpinKit() {
    setState(() {
      _showSpinKit = !_showSpinKit;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                     validator: (value) => value.isEmpty ? 'Enter a city' : null,
                 onChanged: (val) {
                   setState(() {
                     _location = val;
                     print(_location);
                   });

                 },
                 autocorrect: true,
                 decoration: textInputDecoration
                ),
           SizedBox(height: 20,),
           RaisedButton(
             onPressed: () async {
             if (_formKey.currentState.validate())
                {
                    setState(()  async {
                      _showError = false;
                      print('dagha');
                      print('before $_showError');
                    showSpinKit();
                    _showError =  await updateLocation(_location);
                      print('after $_showError');
                      if (_showError == false)
                      {
                          print('errorone $_showError');
                          _showError = true;
                          print('errorrrrr $_showError');
                          showSpinKit();
                          print('spinnnnn $_showSpinKit');
                      }
                  });
                }
             },
             color: Colors.blueGrey[400],
             child: Text (
               'Continue',
               style: TextStyle(
                 color: Colors.white,
               ),
             ),
           ),
          SizedBox(height: 50.0,),
          Visibility(
            visible: _showSpinKit,
            child: Center(
              child: SpinKitFadingCube(
                color: Colors.blueGrey,
                size: 50.0,
              ),
            ),
          ),
                Visibility( visible: _showError,
                    child: Center(
                        child: Text (
                            'Enter a valid location',
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                        )
                    )
                )
              ],
            ),
          ),
        ),
      )
    );


  }

}


