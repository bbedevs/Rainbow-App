import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:rainbowapp/pages/default_location.dart';



class RainbowInfo {

  String location;
  String placename;
  String rainbowImage;
  int probability;

  double lat;
  double lng;
  bool app_first_run;
  LocationData currentLocationData;


  RainbowInfo({this.location});

  Future<bool> getRainbowInfo(bool run_val) async
  {
    app_first_run = run_val;
    try {

      if (app_first_run == true)
        {
          defaultLocation currentLocation = new defaultLocation();
          currentLocationData = await currentLocation.getDefaultLocation();
          lat = currentLocationData.latitude;
          lng = currentLocationData.longitude;
          app_first_run = false;
          print('first run true');
        }
      else
        {
          var addresses = await Geocoder.local.findAddressesFromQuery(location);
          var first = addresses.first;
          print(first);
          lat = first.coordinates.latitude;
          lng = first.coordinates.longitude;
          print('first run false');
        }

    //  print('lat: $lat');
     // print('lng: $lng');
      String url = "INSERT API KEY HERE";
      Response response = await get(url);
      Map data = jsonDecode(response.body);

   //   print(data);

        placename = data['loc']['placename'];
        rainbowImage = data['rainbow']['image'];
        probability = data['rainbow']['prob'];

        if ( location != null && placename == null)
          {
            placename = location;
          }
        else if (location == null && placename == null)
          {
            placename = 'No name available for this location';
          }
        else if (location != null && placename != null)
          {
            placename = location + '\n' + placename;
          }
        //print (placename);
      return true;


    }  catch (e) {
      print ("error + $e");
      return false;
    }


  }




}