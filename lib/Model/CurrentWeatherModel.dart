class CurrentWeaModel
{
  int? cod;
  WeaMainData? main;
  List<WeaList> weather=[];
  CurrentWeaModel.fromJson(Map<String,dynamic>json)
  {
    cod=json['cod'];
    main=WeaMainData.fromJson(json['main']);
    json['weather'].forEach((element){
      weather.add(WeaList.fromJson(element));
    });
  }

}

class WeaMainData
{
  dynamic temp;
  dynamic minTemp;
  dynamic maxTemp;
  WeaMainData.fromJson(Map<String,dynamic>json)
  {
    temp=json['temp'];
    minTemp=json['temp_min'];
    maxTemp=json['temp_max'];
  }

}
class WeaList
{
  String? main;
  String? description;
  String? icon;
  WeaList.fromJson(Map<String,dynamic>json)
  {
    main=json['main'];
    description=json['description'];
    icon=json['icon'];
  }
}