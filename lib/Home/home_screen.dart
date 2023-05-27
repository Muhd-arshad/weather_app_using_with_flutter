// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_flutter/location/getlocation.dart';
import 'package:weather_flutter/wetherData/weatherdata.dart';
 var dayifo= DateTime.now();
  var dateformate =DateFormat('EEE,d MMM,yyyy').format(dayifo);

// ignore: must_be_immutable
class ScreenHome extends StatelessWidget {
  var client = WeatherData();
  var data;
 


  info() async {
    var position = await getposition();
    data = await client.getdata(position.altitude, position.longitude);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: info(),
        builder: (context, snapshot) {
          return Column(
            children: [
              Container(
                height: size.height * 0.75,
                width: size.width,
                margin: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 76, 125, 231),
                        Color(0xFF89D3Fb),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.2, 0.85]),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    data == null
                        ? const CircularProgressIndicator()
                        : Text(
                            '${data?.cityName}',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 35),
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      dateformate,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9), fontSize: 15),
                    ),
                    data == null
                        ? Image.asset(
                            'assets/images/icons8-sun-48.png',
                            width: size.width * 0.4,
                            fit: BoxFit.fill,
                          )
                        : Image.network(
                            'http:${data?.icon}',
                            width: size.width * 0.4,
                            fit: BoxFit.fill,
                          ),
                    const SizedBox(
                      height: 3,
                    ),

                     Text(
                      '${data?.conditon}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                     Text(
                      '${data?.temp}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset('assets/images/icons8-wind-50.png'),
                               Text(
                                '${data?.wind} km',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'wind',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                  'assets/images/icons8-partly-cloudy-day-48.png'),
                               Text(
                                '${data?.humidity}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Humidity',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                  'assets/images/icons8-windsock-48.png'),
                               Text(
                                '${data?.winddir}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'wind-direction',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 29,
              ),
               Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Gust',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${data?.gust} kp/h',
                          style: const TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Presure',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${data?.presure}ph',
                          style: const TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Uv',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${data?.uv}',
                          style: const TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Precipitation',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${data?.precipe} mm',
                          style: const TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'wind',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${data?.wind} km/h',
                          style: const TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Last update',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${data?.latsupadate}',
                          style: const TextStyle(color: Colors.green, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
