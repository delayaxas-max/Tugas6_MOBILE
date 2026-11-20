import 'package:flutter/material.dart';

class Character {
  final String name;
  final String element;
  final String weapon;
  final String rarity;
  final String region;
  final String description;
  final String imageUrl;
  final Color color;
  final IconData icon;

  const Character({
    required this.name,
    required this.element,
    required this.weapon,
    required this.rarity,
    required this.region,
    required this.description,
    required this.imageUrl,
    required this.color,
    required this.icon,
  });
}

final List<Character> characters = [
  Character(
    name: 'Mitya',
    element: 'Electro',
    weapon: 'Catalyst',
    rarity: '5 Star',
    region: 'Snezhnaya',
    description: 'Karakter Electro dari Genshin Impact.',
    imageUrl: 'https://tse2.mm.bing.net/th/id/OIF.SYTDhTegP4Ru6bo1EYsAeA?r=0&pid=Api&h=220&P=0',
    color: const Color(0xFF9B70D6),
    icon: Icons.bolt,
  ),

  Character(
    name: 'Zhongli',
    element: 'Geo',
    weapon: 'Polearm',
    rarity: '5 Star',
    region: 'Liyue',
    description: 'Konsultan Wangsheng Funeral Parlor '
        'yang memiliki pengetahuan luas tentang sejarah Liyue.',
    imageUrl: 'https://tse2.mm.bing.net/th/id/OIP.Ad_7bcdP2gohwgLiMF5iUwHaEK?r=0&pid=Api&h=220&P=0',
    color: const Color(0xFFC99B55),
    icon: Icons.landscape,
  ),

  Character(
    name: 'Xiao',
    element: 'Anemo',
    weapon: 'Polearm',
    rarity: '5 Star',
    region: 'Liyue',
    description: 'Yaksha penjaga yang telah melindungi '
        'Liyue selama ribuan tahun.',
    imageUrl: 'https://tse4.mm.bing.net/th/id/OIP.RrQyc1rCXv1oEacwlXTNgAHaFA?r=0&pid=Api&h=220&P=0',
    color: const Color(0xFF56A99D),
    icon: Icons.air,
  ),

  Character(
    name: 'Varka',
    element: 'Anemo',
    weapon: 'Claymore',
    rarity: '5 Star',
    region: 'Mondstadt',
    description: 'Grand Master Knights of Favonius '
        'yang dikenal sebagai Knight of Boreas.',
    imageUrl: 'https://tse3.mm.bing.net/th/id/OIP.dKrdrXnORCT9YWeExzOMtQHaEK?r=0&pid=Api&h=220&P=0',
    color: const Color(0xFF78AFC6),
    icon: Icons.wind_power,
  ),

  Character(
    name: 'Neuvillette',
    element: 'Hydro',
    weapon: 'Catalyst',
    rarity: '5 Star',
    region: 'Fontaine',
    description: 'Chief Justice Fontaine yang memiliki '
        'kekuatan sebagai Dragon Sovereign Hydro.',
    imageUrl: 'https://static1.srcdn.com/wordpress/wp-content/uploads/2023/09/genshin-impact-neuvillette-best-builds-team-comps-weapons-artifacts.jpg',
    color: const Color(0xFF5996CF),
    icon: Icons.water_drop,
  ),

  Character(
    name: 'Flins',
    element: 'Electro',
    weapon: 'Polearm',
    rarity: '5 Star',
    region: 'Nod-Krai',
    description: 'Seorang Lightkeeper dari Nod-Krai '
        'yang menjaga mercusuar dan pemakaman.',
    imageUrl: 'https://tse1.mm.bing.net/th/id/OIP.Jqj-Y6J1bfgBBdUB-5miZQHaEK?r=0&pid=Api&h=220&P=0',
    color: const Color(0xFF8C72C4),
    icon: Icons.flash_on,
  ),
];


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF26364D),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'GENSHIN ARCHIVE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),

      body: Column(
        children: [

          // HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF26364D),
                  Color(0xFF526B91),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome, Traveler!',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Explore Characters',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${characters.length} Characters Available',
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          // BUTTON LIST & GRID
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: viewButton(
                    'List View',
                    Icons.view_list,
                    0,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: viewButton(
                    'Grid View',
                    Icons.grid_view,
                    1,
                  ),
                ),
              ],
            ),
          ),

          // CONTENT
          Expanded(
            child: selectedIndex == 0
                ? buildListView()
                : buildGridView(),
          ),
        ],
      ),
    );
  }

  Widget viewButton(
    String title,
    IconData icon,
    int index,
  ) {
    bool active = selectedIndex == index;

    return ElevatedButton.icon(
      onPressed: () {
        setState(() {
          selectedIndex = index;
        });
      },
      icon: Icon(icon),
      label: Text(title),
      style: ElevatedButton.styleFrom(
        backgroundColor: active
            ? const Color(0xFF526B91)
            : Colors.white,
        foregroundColor: active
            ? Colors.white
            : const Color(0xFF526B91),
        padding: const EdgeInsets.symmetric(
          vertical: 13,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];

        return Card(
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),

            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                character.imageUrl,
                width: 65,
                height: 65,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 65,
                    height: 65,
                    color: character.color,
                    child: Icon(
                      character.icon,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),

            title: Text(
              character.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: Text(
              '${character.element} • ${character.weapon}',
            ),

            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),

            onTap: () => openDetail(character),
          ),
        );
      },
    );
  }

  // ==========================================
// GRID VIEW - CHARACTER CARD
// ==========================================

Widget buildGridView() {
  return GridView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: characters.length,
    gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.72,
    ),

    itemBuilder: (context, index) {
      final character = characters[index];

      return GestureDetector(
        onTap: () => openDetail(character),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),

          child: Stack(
            fit: StackFit.expand,
            children: [

              // GAMBAR KARAKTER
              Image.network(
                character.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: character.color,
                    child: Icon(
                      character.icon,
                      size: 65,
                      color: Colors.white,
                    ),
                  );
                },
              ),

              // GRADIENT BAGIAN BAWAH
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color(0xCC000000),
                    ],
                    stops: [0.45, 1.0],
                  ),
                ),
              ),

              // NAMA DAN ELEMENT
              Positioned(
                left: 12,
                bottom: 14,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      character.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black54,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 4),

                    Row(
                      children: [
                        Icon(
                          character.icon,
                          color: Colors.white,
                          size: 15,
                        ),

                        const SizedBox(width: 5),

                        Text(
                          character.element,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // BINTANG RARITY
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    '★★★★★',
                    style: TextStyle(
                      color: Color(0xFFFFD36A),
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

  void openDetail(Character character) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
          character: character,
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Character character;

  const DetailPage({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5FA),

      appBar: AppBar(
        title: const Text('Character Details'),
        backgroundColor: const Color(0xFF26364D),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            // CHARACTER HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    character.color,
                    const Color(0xFF26364D),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
              ),

              child: Column(
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      character.imageUrl,
                      width: 180,
                      height: 220,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 180,
                          height: 220,
                          color: character.color,
                          child: Icon(
                            character.icon,
                            size: 70,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    character.name,
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    character.region,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    '★★★★★',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFFFFD36A),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Character Information',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF26364D),
                    ),
                  ),

                  const Divider(height: 25),

                  infoRow(
                    Icons.bolt,
                    'Element',
                    character.element,
                  ),

                  infoRow(
                    Icons.sports_martial_arts,
                    'Weapon',
                    character.weapon,
                  ),

                  infoRow(
                    Icons.star,
                    'Rarity',
                    character.rarity,
                  ),

                  infoRow(
                    Icons.public,
                    'Region',
                    character.region,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF26364D),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    character.description,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget infoRow(
    IconData icon,
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF526B91),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}