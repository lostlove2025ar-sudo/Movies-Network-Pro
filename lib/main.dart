import 'package:flutter/material.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> movies = const [
    {
      'title': 'Oru Durooha Saahacharyathil',
      'banner': 'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=800',
      'category': 'Featured'
    },
    {
      'title': 'Stranger Things',
      'banner': 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=500',
      'category': 'Trending'
    },
    {
      'title': 'The Dark Knight',
      'banner': 'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=500',
      'category': 'Trending'
    },
    {
      'title': 'Inception',
      'banner': 'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?w=500',
      'category': 'Popular'
    },
    {
      'title': 'Interstellar',
      'banner': 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=500',
      'category': 'Popular'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('NETFLIX', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24)),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          const CircleAvatar(
            backgroundColor: Colors.red,
            child: Text('MB', style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured Banner
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(
                  movies[0]['banner']!,
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Column(
                    children: [
                      Text(movies[0]['title']!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('Play'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Catalog Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Movies Bazar Catalog', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            const SizedBox(height: 12),
            
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 16),
                    width: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            movies[index]['banner']!,
                            height: 140,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          movies[index]['title']!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
