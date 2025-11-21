import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> _historyItems = [
    "chatgpt",
    "figma",
    "idx google",
    "apple tv mobile ui",
    "github",
    "hotstar",
    "zee5",
    "hotstar like ui",
    "apple tv",
    "telegram",
    "Google",
    "wbuhs",
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _submitSearch(String query) {
    if (query.isNotEmpty) {
      context.go('/search/$query');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(),
            const Divider(height: 1, color: Colors.white10),
            Expanded(
              child: _buildHistoryList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () => context.go('/'),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              autofocus: true,
              style: const TextStyle(fontSize: 18),
              decoration: const InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
              onSubmitted: _submitSearch,
            ),
          ),
          _buildGradientIcon(Icons.mic, [
            Colors.blue,
            Colors.red,
            Colors.yellow,
            Colors.green
          ]),
          const SizedBox(width: 16),
          _buildGradientIcon(Icons.camera_alt_outlined, [
            Colors.blue,
            Colors.red,
            Colors.yellow,
            Colors.green
          ]),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildHistoryList() {
    return ListView.builder(
      itemCount: _historyItems.length,
      itemBuilder: (context, index) {
        return _buildHistoryItem(_historyItems[index]);
      },
    );
  }

  Widget _buildHistoryItem(String item) {
    return InkWell(
      onTap: () {
        _searchController.text = item;
        _submitSearch(item);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            const Icon(
              Icons.schedule,
              color: Colors.grey,
              size: 22,
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 40),
            const Icon(
              Icons.north_west,
              color: Colors.grey,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientIcon(IconData icon, List<Color> colors) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: Icon(icon, color: Colors.white),
    );
  }
}
