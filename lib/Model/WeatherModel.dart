// class WeatherModel
// {
//   String? message;
//   List<WeaDataModel> data=[];
// }
//
// class WeaDataModel
// {
// List<WeaDataListModel> weather=[];
// WeaDataModel.fromJson(Map<String,dynamic>json)
// {
//   json[]
// }
// }
// class WeaDataListModel
// {
//   String? main;
//   String? description;
//   String? icon;
//   WeaDataListModel.fromJson(Map<String,dynamic>json)
//   {
//     main= json['main'];
//     description= json['description'];
//     icon= json['icon'];
//   }
// }
//
// class WeaDataMain
// {
//   int? temp;
//   int? minTemp;
//   int? maxTemp;
//   WeaDataMain.fromJson(Map<String,dynamic>json)
//   {
//     temp=json['temp'];
//     minTemp=json['temp_min'];
//     maxTemp=json['temp_max'];
//   }
//
// }
class WeatherData {
  String? cod;
  dynamic message;
  List <ListTwo> list=[];
  int? cnt;


  WeatherData.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    if (json['list'] != null) {
      json['list'].forEach((v) {
        list.add( ListTwo.fromJson(v));
      });
    }
    cnt =json['cnt'];
  }

}

class ListTwo {
  Main? main;
  List<Weather> weather=[];






  ListTwo.fromJson(Map<String, dynamic> json) {
    main = json['main'] != null ?  Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }

  }

}

class Main {
  dynamic temp;
  dynamic tempMin;
  dynamic tempMax;



  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];

  }

}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;


  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

}

