import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {

  runApp(const AstraApp());

}

class AstraApp extends StatelessWidget {

  const AstraApp({super.key});

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'ASTRA',

      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark(),

      home: const HomeScreen(),

    );

  }

}

// ============================================================

// HOME

// ============================================================

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  void openPage(BuildContext context, Widget page) {

    Navigator.push(

      context,

      MaterialPageRoute(builder: (_) => page),

    );

  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFF030711),

      body: SafeArea(

        child: Padding(

          padding: const EdgeInsets.all(22),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const SizedBox(height: 20),

              const Text(

                'ASTRA',

                style: TextStyle(

                  fontSize: 42,

                  fontWeight: FontWeight.bold,

                  letterSpacing: 7,

                ),

              ),

              const SizedBox(height: 5),

              const Text(

                'Explore the Universe',

                style: TextStyle(

                  fontSize: 17,

                  color: Colors.white54,

                ),

              ),

              const SizedBox(height: 30),

              TextField(
                readOnly: true,
                onTap: () { openPage(context, const UniversalSearchScreen()); },
                decoration: InputDecoration(
                  hintText: 'Search planets, stars, missions...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.arrow_forward),
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(

                'Explore',

                style: TextStyle(

                  fontSize: 24,

                  fontWeight: FontWeight.bold,

                ),

              ),

              const SizedBox(height: 15),

              Expanded(

                child: ListView(

                  children: [

                    SpaceCard(

                      icon: Icons.public,

                      title: 'Solar System',

                      subtitle: 'Planets, moons & asteroids',

                      onTap: () {

                        openPage(

                          context,

                          const SolarSystemScreen(),

                        );

                      },

                    ),

                    SpaceCard(

                      icon: Icons.auto_awesome,

                      title: 'Stars & Galaxies',

                      subtitle: 'Explore deep space',

                      onTap: () {

                        openPage(

                          context,

                          const DeepSpaceScreen(),

                        );

                      },

                    ),

                    SpaceCard(

                      icon: Icons.rocket_launch,

                      title: 'Space Missions',

                      subtitle: 'Explore humanity\'s journey into space',

                      onTap: () {

                        openPage(

                          context,

                          const MissionsScreen(),

                        );

                      },

                    ),

                    SpaceCard(

                      icon: Icons.calendar_month,

                      title: 'Astronomical Events',

                      subtitle: 'Eclipses, meteors & conjunctions',

                      onTap: () {
                        openPage(context, const AstronomicalEventsScreen());
                      },

                    ),

                    SpaceCard(

                      icon: Icons.smart_toy,

                      title: 'ASTRA AI',

                      subtitle: 'Ask anything about space',

                      onTap: () {
                        openPage(context, const AstraAiScreen());
                      },

                    ),

                  ],

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}

// ============================================================

// GENERAL SPACE CARD

// ============================================================

class SpaceCard extends StatelessWidget {

  final IconData icon;

  final String title;

  final String subtitle;

  final VoidCallback onTap;

  const SpaceCard({

    super.key,

    required this.icon,

    required this.title,

    required this.subtitle,

    required this.onTap,

  });

  @override

  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.only(bottom: 12),

      decoration: BoxDecoration(

        color: Colors.white10,

        borderRadius: BorderRadius.circular(20),

      ),

      child: Material(

        color: Colors.transparent,

        child: InkWell(

          borderRadius: BorderRadius.circular(20),

          onTap: onTap,

          child: Padding(

            padding: const EdgeInsets.all(20),

            child: Row(

              children: [

                Icon(

                  icon,

                  size: 32,

                  color: Colors.blueAccent,

                ),

                const SizedBox(width: 18),

                Expanded(

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text(

                        title,

                        style: const TextStyle(

                          fontSize: 18,

                          fontWeight: FontWeight.bold,

                        ),

                      ),

                      const SizedBox(height: 4),

                      Text(

                        subtitle,

                        style: const TextStyle(

                          color: Colors.white54,

                        ),

                      ),

                    ],

                  ),

                ),

                const Icon(

                  Icons.arrow_forward_ios,

                  size: 16,

                  color: Colors.white54,

                ),

              ],

            ),

          ),

        ),

      ),

    );

  }

}

// ============================================================

// SOLAR SYSTEM

// ============================================================

class Planet {

  final String name;

  final String symbol;

  final String description;

  final String distance;

  final String diameter;

  final String orbitalPeriod;

  final String moons;

  final String temperature;

  const Planet({

    required this.name,

    required this.symbol,

    required this.description,

    required this.distance,

    required this.diameter,

    required this.orbitalPeriod,

    required this.moons,

    required this.temperature,

  });

}

class SolarSystemScreen extends StatelessWidget {

  const SolarSystemScreen({super.key});

  static const List<Planet> planets = [

    Planet(

      name: 'Mercury',

      symbol: '☿',

      description:

          'Mercury is the smallest planet in the Solar System and the closest planet to the Sun.',

      distance: '57.9 million km',

      diameter: '4,879 km',

      orbitalPeriod: '88 days',

      moons: '0',

      temperature: '167°C average',

    ),

    Planet(

      name: 'Venus',

      symbol: '♀',

      description:

          'Venus is a rocky planet covered by a dense atmosphere dominated by carbon dioxide.',

      distance: '108.2 million km',

      diameter: '12,104 km',

      orbitalPeriod: '224.7 days',

      moons: '0',

      temperature: '464°C average',

    ),

    Planet(

      name: 'Earth',

      symbol: '🌍',

      description:

          'Earth is our home world and the only planet currently known to support life.',

      distance: '149.6 million km',

      diameter: '12,742 km',

      orbitalPeriod: '365.25 days',

      moons: '1',

      temperature: '15°C average',

    ),

    Planet(

      name: 'Mars',

      symbol: '♂',

      description:

          'Mars is the Red Planet, home to enormous volcanoes, canyons and evidence of ancient water.',

      distance: '227.9 million km',

      diameter: '6,779 km',

      orbitalPeriod: '687 days',

      moons: '2',

      temperature: '-63°C average',

    ),

    Planet(

      name: 'Jupiter',

      symbol: '♃',

      description:

          'Jupiter is the largest planet in the Solar System and a massive gas giant.',

      distance: '778.5 million km',

      diameter: '139,820 km',

      orbitalPeriod: '11.86 years',

      moons: 'Many',

      temperature: '-110°C average',

    ),

    Planet(

      name: 'Saturn',

      symbol: '♄',

      description:

          'Saturn is a gas giant famous for its spectacular ring system.',

      distance: '1.43 billion km',

      diameter: '116,460 km',

      orbitalPeriod: '29.45 years',

      moons: 'Many',

      temperature: '-140°C average',

    ),

    Planet(

      name: 'Uranus',

      symbol: '⛢',

      description:

          'Uranus is an ice giant with an extreme axial tilt, making it appear to rotate on its side.',

      distance: '2.87 billion km',

      diameter: '50,724 km',

      orbitalPeriod: '84 years',

      moons: '28+',

      temperature: '-195°C average',

    ),

    Planet(

      name: 'Neptune',

      symbol: '♆',

      description:

          'Neptune is a distant ice giant with some of the fastest winds measured in the Solar System.',

      distance: '4.5 billion km',

      diameter: '49,244 km',

      orbitalPeriod: '164.8 years',

      moons: '16+',

      temperature: '-200°C average',

    ),

  ];

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFF030711),

      appBar: AppBar(

        backgroundColor: const Color(0xFF030711),

        title: const Text('Solar System'),

      ),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: [

          const Center(

            child: Text(

              '☀️',

              style: TextStyle(fontSize: 90),

            ),

          ),

          const SizedBox(height: 10),

          const Center(

            child: Text(

              'THE SUN',

              style: TextStyle(

                fontSize: 25,

                fontWeight: FontWeight.bold,

                letterSpacing: 3,

              ),

            ),

          ),

          const SizedBox(height: 8),

          const Center(

            child: Text(

              'Center of our Solar System',

              style: TextStyle(color: Colors.white54),

            ),

          ),

          const SizedBox(height: 40),

          const SectionTitle(title: 'PLANETS'),

          const SizedBox(height: 15),

          ...planets.map(

            (planet) => ObjectCard(

              symbol: planet.symbol,

              title: planet.name,

              subtitle: planet.distance,

              onTap: () {

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder: (_) => PlanetScreen(planet: planet),

                  ),

                );

              },

            ),

          ),

        ],

      ),

    );

  }

}

class PlanetScreen extends StatelessWidget {

  final Planet planet;

  const PlanetScreen({

    super.key,

    required this.planet,

  });

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFF030711),

      appBar: AppBar(

        backgroundColor: const Color(0xFF030711),

        title: Text(planet.name),

      ),

      body: ListView(

        padding: const EdgeInsets.all(24),

        children: [

          Center(

            child: Text(

              planet.symbol,

              style: const TextStyle(fontSize: 120),

            ),

          ),

          const SizedBox(height: 20),

          Text(

            planet.name.toUpperCase(),

            textAlign: TextAlign.center,

            style: const TextStyle(

              fontSize: 32,

              fontWeight: FontWeight.bold,

              letterSpacing: 4,

            ),

          ),

          const SizedBox(height: 20),

          Text(

            planet.description,

            textAlign: TextAlign.center,

            style: const TextStyle(

              fontSize: 17,

              height: 1.6,

              color: Colors.white70,

            ),

          ),

          const SizedBox(height: 40),

          const SectionTitle(title: 'PLANET DATA'),

          const SizedBox(height: 15),

          InfoCard(

            icon: Icons.straighten,

            title: 'Diameter',

            value: planet.diameter,

          ),

          InfoCard(

            icon: Icons.wb_sunny_outlined,

            title: 'Distance from Sun',

            value: planet.distance,

          ),

          InfoCard(

            icon: Icons.rotate_right,

            title: 'Orbital Period',

            value: planet.orbitalPeriod,

          ),

          InfoCard(

            icon: Icons.nightlight_round,

            title: 'Moons',

            value: planet.moons,

          ),

          InfoCard(

            icon: Icons.thermostat,

            title: 'Temperature',

            value: planet.temperature,

          ),

        ],

      ),

    );

  }

}

// ============================================================

// V0.3 - STARS & GALAXIES

// ============================================================

class DeepSpaceObject {

  final String name;

  final String symbol;

  final String type;

  final String distance;

  final String constellation;

  final String description;

  const DeepSpaceObject({

    required this.name,

    required this.symbol,

    required this.type,

    required this.distance,

    required this.constellation,

    required this.description,

  });

}

class DeepSpaceScreen extends StatelessWidget {

  const DeepSpaceScreen({super.key});

  static const List<DeepSpaceObject> objects = [

    DeepSpaceObject(

      name: 'Proxima Centauri',

      symbol: '🔴',

      type: 'Red Dwarf Star',

      distance: '4.24 light-years',

      constellation: 'Centaurus',

      description:

          'Proxima Centauri is the closest known star to the Sun.',

    ),

    DeepSpaceObject(

      name: 'Sirius',

      symbol: '⭐',

      type: 'Star System',

      distance: '8.6 light-years',

      constellation: 'Canis Major',

      description:

          'Sirius is the brightest star system visible in Earth\'s night sky.',

    ),

    DeepSpaceObject(

      name: 'Betelgeuse',

      symbol: '🟠',

      type: 'Red Supergiant',

      distance: 'About 548 light-years',

      constellation: 'Orion',

      description:

          'Betelgeuse is a huge red supergiant and one of the most recognizable stars in Orion.',

    ),

    DeepSpaceObject(

      name: 'Orion Nebula',

      symbol: '☁️',

      type: 'Emission Nebula',

      distance: 'About 1,340 light-years',

      constellation: 'Orion',

      description:

          'The Orion Nebula is a massive stellar nursery where new stars are forming.',

    ),

    DeepSpaceObject(

      name: 'Andromeda Galaxy',

      symbol: '🌌',

      type: 'Spiral Galaxy',

      distance: 'About 2.5 million light-years',

      constellation: 'Andromeda',

      description:

          'The Andromeda Galaxy is the nearest large galaxy to the Milky Way.',

    ),

    DeepSpaceObject(

      name: 'Triangulum Galaxy',

      symbol: '🌌',

      type: 'Spiral Galaxy',

      distance: 'About 2.7 million light-years',

      constellation: 'Triangulum',

      description:

          'The Triangulum Galaxy is one of the major galaxies of the Local Group.',

    ),

    DeepSpaceObject(

      name: 'Whirlpool Galaxy',

      symbol: '🌀',

      type: 'Spiral Galaxy',

      distance: 'About 23 million light-years',

      constellation: 'Canes Venatici',

      description:

          'The Whirlpool Galaxy is a famous interacting spiral galaxy.',

    ),

    DeepSpaceObject(

      name: 'Sombrero Galaxy',

      symbol: '🌌',

      type: 'Galaxy',

      distance: 'About 30 million light-years',

      constellation: 'Virgo',

      description:

          'The Sombrero Galaxy is famous for its bright nucleus and prominent dust lane.',

    ),

  ];

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFF030711),

      appBar: AppBar(

        backgroundColor: const Color(0xFF030711),

        title: const Text('Stars & Galaxies'),

      ),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: [

          const SectionTitle(title: 'DEEP SPACE'),

          const SizedBox(height: 8),

          const Text(

            'Explore the Universe',

            style: TextStyle(

              fontSize: 30,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 8),

          const Text(

            'Stars, nebulae and galaxies beyond our Solar System.',

            style: TextStyle(

              color: Colors.white54,

              fontSize: 16,

            ),

          ),

          const SizedBox(height: 30),

          ...objects.map(

            (object) => ObjectCard(

              symbol: object.symbol,

              title: object.name,

              subtitle: '${object.type} • ${object.distance}',

              onTap: () {

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder: (_) =>

                        DeepSpaceDetailsScreen(object: object),

                  ),

                );

              },

            ),

          ),

        ],

      ),

    );

  }

}

class DeepSpaceDetailsScreen extends StatelessWidget {

  final DeepSpaceObject object;

  const DeepSpaceDetailsScreen({

    super.key,

    required this.object,

  });

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFF030711),

      appBar: AppBar(

        backgroundColor: const Color(0xFF030711),

        title: Text(object.name),

      ),

      body: ListView(

        padding: const EdgeInsets.all(24),

        children: [

          Center(

            child: Text(

              object.symbol,

              style: const TextStyle(fontSize: 110),

            ),

          ),

          const SizedBox(height: 20),

          Text(

            object.name,

            textAlign: TextAlign.center,

            style: const TextStyle(

              fontSize: 30,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 8),

          Text(

            object.type.toUpperCase(),

            textAlign: TextAlign.center,

            style: const TextStyle(

              color: Colors.blueAccent,

              letterSpacing: 2,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 30),

          Text(

            object.description,

            textAlign: TextAlign.center,

            style: const TextStyle(

              fontSize: 17,

              height: 1.6,

              color: Colors.white70,

            ),

          ),

          const SizedBox(height: 35),

          InfoCard(

            icon: Icons.category,

            title: 'Object Type',

            value: object.type,

          ),

          InfoCard(

            icon: Icons.social_distance,

            title: 'Distance',

            value: object.distance,

          ),

          InfoCard(

            icon: Icons.auto_awesome,

            title: 'Constellation',

            value: object.constellation,

          ),

        ],

      ),

    );

  }

}

// ============================================================

// V0.4 - SPACE MISSIONS

// ============================================================

class SpaceMission {

  final String name;

  final String symbol;

  final String agency;

  final String year;

  final String status;

  final String destination;

  final String description;

  const SpaceMission({

    required this.name,

    required this.symbol,

    required this.agency,

    required this.year,

    required this.status,

    required this.destination,

    required this.description,

  });

}

class MissionsScreen extends StatelessWidget {

  const MissionsScreen({super.key});

  static const List<SpaceMission> missions = [

    SpaceMission(

      name: 'Apollo 11',

      symbol: '🌕',

      agency: 'NASA',

      year: '1969',

      status: 'Completed',

      destination: 'Moon',

      description:

          'Apollo 11 was the mission that first landed humans on the Moon.',

    ),

    SpaceMission(

      name: 'Voyager 1',

      symbol: '🛰️',

      agency: 'NASA',

      year: '1977',

      status: 'Active',

      destination: 'Interstellar Space',

      description:

          'Voyager 1 explored the outer Solar System and later entered interstellar space.',

    ),

    SpaceMission(

      name: 'Voyager 2',

      symbol: '🛰️',

      agency: 'NASA',

      year: '1977',

      status: 'Active',

      destination: 'Interstellar Space',

      description:

          'Voyager 2 performed historic flybys of Jupiter, Saturn, Uranus and Neptune.',

    ),

    SpaceMission(

      name: 'Hubble Space Telescope',

      symbol: '🔭',

      agency: 'NASA / ESA',

      year: '1990',

      status: 'Space Telescope',

      destination: 'Low Earth Orbit',

      description:

          'Hubble transformed astronomy with high-resolution observations from above Earth\'s atmosphere.',

    ),

    SpaceMission(

      name: 'Curiosity',

      symbol: '🤖',

      agency: 'NASA',

      year: '2011',

      status: 'Mars Rover',

      destination: 'Mars',

      description:

          'Curiosity explores Gale Crater and studies the geology and past environment of Mars.',

    ),

    SpaceMission(

      name: 'Perseverance',

      symbol: '🚙',

      agency: 'NASA',

      year: '2020',

      status: 'Mars Rover',

      destination: 'Mars',

      description:

          'Perseverance explores Jezero Crater and investigates the planet\'s ancient environment.',

    ),

    SpaceMission(

      name: 'James Webb Space Telescope',

      symbol: '🔭',

      agency: 'NASA / ESA / CSA',

      year: '2021',

      status: 'Space Telescope',

      destination: 'Sun-Earth L2',

      description:

          'The James Webb Space Telescope observes the universe primarily in infrared wavelengths.',

    ),

    SpaceMission(

      name: 'Artemis I',

      symbol: '🚀',

      agency: 'NASA',

      year: '2022',

      status: 'Completed',

      destination: 'Moon',

      description:

          'Artemis I was an uncrewed test flight of the Space Launch System and Orion spacecraft around the Moon.',

    ),

  ];

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFF030711),

      appBar: AppBar(

        backgroundColor: const Color(0xFF030711),

        title: const Text('Space Missions'),

      ),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: [

          const SectionTitle(title: 'SPACE EXPLORATION'),

          const SizedBox(height: 8),

          const Text(

            'Humanity Beyond Earth',

            style: TextStyle(

              fontSize: 30,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 8),

          const Text(

            'Discover spacecraft, telescopes, rovers and historic missions.',

            style: TextStyle(

              color: Colors.white54,

              fontSize: 16,

            ),

          ),

          const SizedBox(height: 30),

          ...missions.map(

            (mission) => ObjectCard(

              symbol: mission.symbol,

              title: mission.name,

              subtitle: '${mission.agency} • ${mission.year}',

              onTap: () {

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder: (_) =>

                        MissionDetailsScreen(mission: mission),

                  ),

                );

              },

            ),

          ),

        ],

      ),

    );

  }

}

class MissionDetailsScreen extends StatelessWidget {

  final SpaceMission mission;

  const MissionDetailsScreen({

    super.key,

    required this.mission,

  });

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFF030711),

      appBar: AppBar(

        backgroundColor: const Color(0xFF030711),

        title: Text(mission.name),

      ),

      body: ListView(

        padding: const EdgeInsets.all(24),

        children: [

          Center(

            child: Text(

              mission.symbol,

              style: const TextStyle(fontSize: 110),

            ),

          ),

          const SizedBox(height: 20),

          Text(

            mission.name,

            textAlign: TextAlign.center,

            style: const TextStyle(

              fontSize: 30,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 8),

          Text(

            mission.agency,

            textAlign: TextAlign.center,

            style: const TextStyle(

              color: Colors.blueAccent,

              letterSpacing: 2,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 30),

          Text(

            mission.description,

            textAlign: TextAlign.center,

            style: const TextStyle(

              fontSize: 17,

              height: 1.6,

              color: Colors.white70,

            ),

          ),

          const SizedBox(height: 35),

          const SectionTitle(title: 'MISSION DATA'),

          const SizedBox(height: 15),

          InfoCard(

            icon: Icons.apartment,

            title: 'Agency',

            value: mission.agency,

          ),

          InfoCard(

            icon: Icons.calendar_month,

            title: 'Launch Year',

            value: mission.year,

          ),

          InfoCard(

            icon: Icons.flag,

            title: 'Destination',

            value: mission.destination,

          ),

          InfoCard(

            icon: Icons.sensors,

            title: 'Status',

            value: mission.status,

          ),

        ],

      ),

    );

  }

}


// ============================================================
// V0.5 - ASTRONOMICAL EVENTS
// ============================================================
class AstronomicalEvent {
  final String name, symbol, type, date, visibility, description;
  const AstronomicalEvent({required this.name, required this.symbol, required this.type, required this.date, required this.visibility, required this.description});
}

class AstronomicalEventsScreen extends StatelessWidget {
  const AstronomicalEventsScreen({super.key});
  static const List<AstronomicalEvent> events = [
    AstronomicalEvent(name:'Solar Eclipse', symbol:'🌑', type:'Eclipse', date:'Upcoming events', visibility:'Depends on location', description:'A solar eclipse occurs when the Moon passes between Earth and the Sun, blocking some or all of the Sun from view.'),
    AstronomicalEvent(name:'Lunar Eclipse', symbol:'🌘', type:'Eclipse', date:'Upcoming events', visibility:'Night side of Earth', description:'A lunar eclipse occurs when Earth passes between the Sun and the Moon and Earth’s shadow falls across the Moon.'),
    AstronomicalEvent(name:'Perseid Meteor Shower', symbol:'☄️', type:'Meteor Shower', date:'Every year', visibility:'Northern Hemisphere', description:'The Perseids are one of the best-known annual meteor showers and are associated with comet Swift-Tuttle.'),
    AstronomicalEvent(name:'Geminid Meteor Shower', symbol:'✨', type:'Meteor Shower', date:'Every year', visibility:'Much of Earth', description:'The Geminids are a strong annual meteor shower associated with asteroid 3200 Phaethon.'),
    AstronomicalEvent(name:'Planetary Conjunction', symbol:'🪐', type:'Conjunction', date:'Variable', visibility:'Depends on planets', description:'A conjunction occurs when two astronomical objects appear close together in the sky from Earth.'),
    AstronomicalEvent(name:'Supermoon', symbol:'🌕', type:'Moon Event', date:'Variable', visibility:'Night side of Earth', description:'The term supermoon is commonly used when a full Moon occurs near the Moon’s closest approach to Earth.'),
  ];
  @override Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFF030711),
    appBar: AppBar(backgroundColor: const Color(0xFF030711), title: const Text('Astronomical Events')),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      const SectionTitle(title:'COSMIC CALENDAR'), const SizedBox(height:8),
      const Text('What’s happening in the sky?', style: TextStyle(fontSize:30,fontWeight:FontWeight.bold)),
      const SizedBox(height:8), const Text('Explore eclipses, meteor showers, conjunctions and lunar events.', style: TextStyle(color:Colors.white54,fontSize:16,height:1.5)), const SizedBox(height:30),
      ...events.map((e)=>ObjectCard(symbol:e.symbol,title:e.name,subtitle:'${e.type} • ${e.date}',onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>AstronomicalEventDetailsScreen(event:e))))),
    ]));
}

class AstronomicalEventDetailsScreen extends StatelessWidget {
  final AstronomicalEvent event; const AstronomicalEventDetailsScreen({super.key,required this.event});
  @override Widget build(BuildContext context)=>Scaffold(backgroundColor:const Color(0xFF030711),appBar:AppBar(backgroundColor:const Color(0xFF030711),title:Text(event.name)),body:ListView(padding:const EdgeInsets.all(24),children:[
    const SizedBox(height:20),Center(child:Text(event.symbol,style:const TextStyle(fontSize:110))),const SizedBox(height:25),Text(event.name,textAlign:TextAlign.center,style:const TextStyle(fontSize:30,fontWeight:FontWeight.bold)),const SizedBox(height:10),Text(event.type.toUpperCase(),textAlign:TextAlign.center,style:const TextStyle(color:Colors.blueAccent,fontWeight:FontWeight.bold,letterSpacing:2)),const SizedBox(height:30),Text(event.description,textAlign:TextAlign.center,style:const TextStyle(fontSize:17,height:1.6,color:Colors.white70)),const SizedBox(height:40),const SectionTitle(title:'EVENT DATA'),const SizedBox(height:15),InfoCard(icon:Icons.category,title:'Type',value:event.type),InfoCard(icon:Icons.calendar_month,title:'Date',value:event.date),InfoCard(icon:Icons.visibility,title:'Visibility',value:event.visibility)
  ]));
}

// ============================================================
// V0.6 - UNIVERSAL SEARCH
// ============================================================
class UniversalSearchScreen extends StatefulWidget { const UniversalSearchScreen({super.key}); @override State<UniversalSearchScreen> createState()=>_UniversalSearchScreenState(); }
class _UniversalSearchScreenState extends State<UniversalSearchScreen> {
  String query=''; bool matches(String t)=>t.toLowerCase().contains(query.toLowerCase());
  @override Widget build(BuildContext context){
    final planets=SolarSystemScreen.planets.where((p)=>matches(p.name)||matches(p.description)).toList();
    final deep=DeepSpaceScreen.objects.where((o)=>matches(o.name)||matches(o.type)||matches(o.constellation)).toList();
    final missions=MissionsScreen.missions.where((m)=>matches(m.name)||matches(m.agency)||matches(m.destination)).toList();
    final events=AstronomicalEventsScreen.events.where((e)=>matches(e.name)||matches(e.type)).toList();
    final any=planets.isNotEmpty||deep.isNotEmpty||missions.isNotEmpty||events.isNotEmpty;
    return Scaffold(backgroundColor:const Color(0xFF030711),appBar:AppBar(backgroundColor:const Color(0xFF030711),title:const Text('Search ASTRA')),body:Padding(padding:const EdgeInsets.all(20),child:Column(children:[
      TextField(autofocus:true,onChanged:(v)=>setState(()=>query=v.trim()),decoration:InputDecoration(hintText:'Try Mars, Andromeda, Voyager...',prefixIcon:const Icon(Icons.search),filled:true,fillColor:Colors.white10,border:OutlineInputBorder(borderRadius:BorderRadius.circular(18),borderSide:BorderSide.none))),const SizedBox(height:20),
      Expanded(child:query.isEmpty?const Center(child:Text('Search the universe 🌌',style:TextStyle(color:Colors.white54,fontSize:18))):!any?const Center(child:Text('No results found.',style:TextStyle(color:Colors.white54,fontSize:18))):ListView(children:[
        if(planets.isNotEmpty)...[const SectionTitle(title:'PLANETS'),const SizedBox(height:10),...planets.map((p)=>ObjectCard(symbol:p.symbol,title:p.name,subtitle:'Planet • ${p.distance}',onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>PlanetScreen(planet:p))))),const SizedBox(height:12)],
        if(deep.isNotEmpty)...[const SectionTitle(title:'STARS & GALAXIES'),const SizedBox(height:10),...deep.map((o)=>ObjectCard(symbol:o.symbol,title:o.name,subtitle:'${o.type} • ${o.distance}',onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>DeepSpaceDetailsScreen(object:o))))),const SizedBox(height:12)],
        if(missions.isNotEmpty)...[const SectionTitle(title:'MISSIONS'),const SizedBox(height:10),...missions.map((m)=>ObjectCard(symbol:m.symbol,title:m.name,subtitle:'${m.agency} • ${m.year}',onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>MissionDetailsScreen(mission:m))))),const SizedBox(height:12)],
        if(events.isNotEmpty)...[const SectionTitle(title:'EVENTS'),const SizedBox(height:10),...events.map((e)=>ObjectCard(symbol:e.symbol,title:e.name,subtitle:'${e.type} • ${e.date}',onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>AstronomicalEventDetailsScreen(event:e)))))]
      ]))
    ])));
  }
}

// ============================================================
// V0.7 - ASTRA AI
// ============================================================
class AstraMessage { final String text; final bool user; const AstraMessage(this.text,this.user); }
class AstraAiScreen extends StatefulWidget { const AstraAiScreen({super.key}); @override State<AstraAiScreen> createState()=>_AstraAiScreenState(); }
class _AstraAiScreenState extends State<AstraAiScreen> {
  final input=TextEditingController(); final scroll=ScrollController(); bool loading=false;
  static const apiUrl='http://10.0.2.2:8000/chat';
  final messages=<AstraMessage>[const AstraMessage('Hello! I am ASTRA AI. Ask me anything about the universe. 🌌',false)];
  @override void dispose(){input.dispose();scroll.dispose();super.dispose();}
  void bottom(){WidgetsBinding.instance.addPostFrameCallback((_){if(scroll.hasClients)scroll.animateTo(scroll.position.maxScrollExtent,duration:const Duration(milliseconds:250),curve:Curves.easeOut);});}
  Future<void> send() async {
    final text=input.text.trim(); if(text.isEmpty||loading)return;
    setState((){messages.add(AstraMessage(text,true));input.clear();loading=true;}); bottom();
    try {
      final r=await http.post(Uri.parse(apiUrl),headers:{'Content-Type':'application/json'},body:jsonEncode({'message':text})).timeout(const Duration(seconds:45));
      if(!mounted)return;
      if(r.statusCode==200){final data=jsonDecode(r.body) as Map<String,dynamic>; final reply=data['reply']?.toString().trim()??''; setState(()=>messages.add(AstraMessage(reply.isEmpty?'ASTRA returned an empty response.':reply,false)));}
      else {setState(()=>messages.add(AstraMessage('Backend error ${r.statusCode}. Check main.py.',false)));}
    } catch(_){if(mounted)setState(()=>messages.add(const AstraMessage('Cannot reach ASTRA server. Start main.py and check the API address.',false)));}
    finally {if(mounted){setState(()=>loading=false);bottom();}}
  }
  @override Widget build(BuildContext context)=>Scaffold(
    backgroundColor:const Color(0xFF030711),
    appBar:AppBar(backgroundColor:const Color(0xFF030711),title:const Row(children:[Icon(Icons.smart_toy,color:Colors.blueAccent),SizedBox(width:10),Text('ASTRA AI')])),
    body:SafeArea(child:Column(children:[
      Expanded(child:ListView.builder(controller:scroll,padding:const EdgeInsets.all(18),itemCount:messages.length+(loading?1:0),itemBuilder:(context,i){
        if(loading&&i==messages.length)return const Padding(padding:EdgeInsets.all(12),child:Row(children:[SizedBox(width:18,height:18,child:CircularProgressIndicator(strokeWidth:2)),SizedBox(width:10),Text('ASTRA is thinking...',style:TextStyle(color:Colors.white54))]));
        final m=messages[i]; return Align(alignment:m.user?Alignment.centerRight:Alignment.centerLeft,child:Container(constraints:const BoxConstraints(maxWidth:520),margin:const EdgeInsets.only(bottom:12),padding:const EdgeInsets.symmetric(horizontal:16,vertical:13),decoration:BoxDecoration(color:m.user?Colors.blueAccent:Colors.white10,borderRadius:BorderRadius.circular(18)),child:Text(m.text,style:const TextStyle(fontSize:16,height:1.4))));
      })),
      Container(padding:const EdgeInsets.fromLTRB(14,10,14,14),color:const Color(0xFF070D19),child:Row(children:[Expanded(child:TextField(controller:input,enabled:!loading,minLines:1,maxLines:4,textInputAction:TextInputAction.send,onSubmitted:(_)=>send(),decoration:InputDecoration(hintText:'Ask ASTRA about the universe...',filled:true,fillColor:Colors.white10,border:OutlineInputBorder(borderRadius:BorderRadius.circular(18),borderSide:BorderSide.none)))),const SizedBox(width:10),IconButton.filled(onPressed:loading?null:send,icon:const Icon(Icons.send))]))
    ])));
}

// ============================================================

// REUSABLE OBJECT CARD

// ============================================================

class ObjectCard extends StatelessWidget {

  final String symbol;

  final String title;

  final String subtitle;

  final VoidCallback onTap;

  const ObjectCard({

    super.key,

    required this.symbol,

    required this.title,

    required this.subtitle,

    required this.onTap,

  });

  @override

  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.only(bottom: 12),

      decoration: BoxDecoration(

        color: Colors.white10,

        borderRadius: BorderRadius.circular(20),

      ),

      child: Material(

        color: Colors.transparent,

        child: InkWell(

          onTap: onTap,

          borderRadius: BorderRadius.circular(20),

          child: Padding(

            padding: const EdgeInsets.all(18),

            child: Row(

              children: [

                Container(

                  width: 62,

                  height: 62,

                  alignment: Alignment.center,

                  decoration: BoxDecoration(

                    color: Colors.white10,

                    borderRadius: BorderRadius.circular(31),

                  ),

                  child: Text(

                    symbol,

                    style: const TextStyle(fontSize: 31),

                  ),

                ),

                const SizedBox(width: 18),

                Expanded(

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text(

                        title,

                        style: const TextStyle(

                          fontSize: 18,

                          fontWeight: FontWeight.bold,

                        ),

                      ),

                      const SizedBox(height: 5),

                      Text(

                        subtitle,

                        style: const TextStyle(

                          color: Colors.white54,

                        ),

                      ),

                    ],

                  ),

                ),

                const Icon(

                  Icons.arrow_forward_ios,

                  size: 16,

                  color: Colors.white54,

                ),

              ],

            ),

          ),

        ),

      ),

    );

  }

}

// ============================================================

// INFO CARD

// ============================================================

class InfoCard extends StatelessWidget {

  final IconData icon;

  final String title;

  final String value;

  const InfoCard({

    super.key,

    required this.icon,

    required this.title,

    required this.value,

  });

  @override

  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: Colors.white10,

        borderRadius: BorderRadius.circular(18),

      ),

      child: Row(

        children: [

          Icon(

            icon,

            color: Colors.blueAccent,

          ),

          const SizedBox(width: 15),

          Expanded(

            child: Text(

              title,

              style: const TextStyle(

                color: Colors.white60,

              ),

            ),

          ),

          Flexible(

            child: Text(

              value,

              textAlign: TextAlign.right,

              style: const TextStyle(

                fontWeight: FontWeight.bold,

              ),

            ),

          ),

        ],

      ),

    );

  }

}

// ============================================================

// SECTION TITLE

// ============================================================

class SectionTitle extends StatelessWidget {

  final String title;

  const SectionTitle({

    super.key,

    required this.title,

  });

  @override

  Widget build(BuildContext context) {

    return Text(

      title,

      style: const TextStyle(

        fontSize: 14,

        letterSpacing: 3,

        color: Colors.blueAccent,

        fontWeight: FontWeight.bold,

      ),

    );

  }

}