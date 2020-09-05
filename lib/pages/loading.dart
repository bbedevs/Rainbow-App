
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rainbowapp/pages/default_location.dart';
import 'package:rainbowapp/services/rainbow_information.dart';
import 'package:location/location.dart';


class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  @override
  defaultLocation currentLocation = new defaultLocation();
  LocationData currentLocationData;
  void setupWorldTime() async
  {
    currentLocationData = await currentLocation.getDefaultLocation();
    print(currentLocationData.longitude);
    print(currentLocationData.latitude);
    RainbowInfo rainbowInfo = new RainbowInfo(location: '');
    await rainbowInfo.getRainbowInfo(true);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'placename': rainbowInfo.placename,
      'rainbow_Image': rainbowInfo.rainbowImage,
      'probability': rainbowInfo.probability
    });
  }


  @override
  void initState()
  {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 60, 67, 99),
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

