import 'package:flutter/material.dart';
import 'package:myapp/search_result_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<SearchItem> _searchResults = [];
  bool _isLoading = false;

  final List<SearchItem> _historyItems = [
    SearchItem(text: "chatgpt"),
    SearchItem(text: "figma"),
    SearchItem(text: "idx google"),
    SearchItem(text: "apple tv mobile ui", subtitle: "Images"),
    SearchItem(text: "github"),
    SearchItem(text: "hotstar"),
    SearchItem(text: "zee5"),
    SearchItem(text: "hotstar like ui", subtitle: "Images"),
    SearchItem(text: "apple tv"),
    SearchItem(text: "telegram"),
    SearchItem(text: "Google"),
    SearchItem(text: "wbuhs"),
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_searchController.text.isNotEmpty) {
      _performSearch(_searchController.text);
    } else {
      setState(() {
        _searchResults = [];
      });
    }
  }

  Future<void> _performSearch(String query) async {
    setState(() {
      _isLoading = true;
    });

    // Simulate a network request
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      // Mock search results
      _searchResults = List.generate(
        10,
        (index) => SearchItem(
          text: '$query result $index',
          subtitle: 'This is a mock description for result $index',
        ),
      );
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(),
            const Divider(height: 1, color: Colors.white10),
            Expanded(
              child: _searchController.text.isEmpty
                  ? _buildHistoryList()
                  : _buildSearchResults(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      color: const Color(0xFF1F1F1F),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              autofocus: true,
              style: const TextStyle(fontSize: 18, color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
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

  Widget _buildSearchResults() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (_searchResults.isEmpty) {
      return const Center(
          child: Text('No results found.',
              style: TextStyle(color: Colors.white)));
    } else {
      return ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          final item = _searchResults[index];
          return ListTile(
            title: Text(item.text, style: const TextStyle(color: Colors.white)),
            subtitle: item.subtitle != null
                ? Text(item.subtitle!,
                    style: const TextStyle(color: Colors.grey))
                : null,
          );
        },
      );
    }
  }

  Widget _buildHistoryItem(SearchItem item) {
    return InkWell(
      onTap: () {
        _searchController.text = item.text;
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.text,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFFE3E3E3),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  if (item.subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      item.subtitle!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ]
                ],
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