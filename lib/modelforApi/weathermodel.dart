class Weather {
  var cityName;
  var icon;
  var conditon;
  var temp;
  var wind;
  var humidity;
  var winddir;
  
  var presure;
  var precipe;
  var gust;
  var uv;
  var latsupadate;

  Weather(
      {required this.cityName,
      required this.icon,
      required this.conditon,
      required this.temp,
      required this.wind,
      required this.humidity,
      required this.winddir,
      required this.presure,
      required this.precipe,
      required this.latsupadate,
      required this.gust,
      required this.uv});

    Weather.fromJson(Map<String,dynamic> json){
      cityName =json['location']['name'];
      icon = json['current']['condition']['icon'];
      conditon =  json['current']['condition']['text'];
      temp=json['current']['temp_c'];
      wind =json['current']['wind_kph'];
      humidity = json['current' ]['humidity'];
      winddir =json['current']['wind_dir'];
      presure =json['current']['pressure_mb'];
      precipe =json['current']['precip_mm'];
      latsupadate =json['current']['last_updated'];
      gust =json['current']['gust_kph'];
      uv =json['current']['uv'];
    }
}
