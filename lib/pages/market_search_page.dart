import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:el_fares/pages/add_details_shop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarketSearchPage extends StatefulWidget {
  const MarketSearchPage({super.key});

  @override
  State<MarketSearchPage> createState() => _MarketSearchPageState();
}

class _MarketSearchPageState extends State<MarketSearchPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _searchController = TextEditingController();
  List<QueryDocumentSnapshot> _filteredMarkets = [];

  @override
  void initState() {
    super.initState();
    _fetchAllMarkets();
  }

  Future<void> _fetchAllMarkets() async {
    final querySnapshot = await _firestore.collection('markets').get();
    setState(() {
      _filteredMarkets = querySnapshot.docs;
    });
  }

  void _filterMarkets(String query) {
    if (query.isEmpty) {
      _fetchAllMarkets();
    } else {
      setState(() {
        _filteredMarkets = _filteredMarkets
            .where((market) => market['market_name']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  void _createMarket(String marketName) async {
    final newMarket = {
      'market_name': marketName,
      'created_at': Timestamp.now(),
    };

    final docRef = await _firestore.collection('markets').add(newMarket);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Market "$marketName" created successfully!')),
    );

    // Navigate to AddDetailsShop for the new market
    Get.to(() => AddDetailsShop(marketId: docRef.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select or Create Market')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Markets',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _fetchAllMarkets();
                  },
                ),
              ),
              onChanged: _filterMarkets,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredMarkets.length,
              itemBuilder: (context, index) {
                final market = _filteredMarkets[index];
                return ListTile(
                  title: Text(market['market_name']),
                  onTap: () {
                    // Navigate to AddDetailsShop with the selected marketId
                    Get.to(() => AddDetailsShop(marketId: market.id));
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Prompt the user to create a new market
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Create New Market'),
                    content: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        labelText: 'Enter Market Name',
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          final marketName = _searchController.text.trim();
                          if (marketName.isNotEmpty) {
                            _createMarket(marketName);
                            _searchController.clear();
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Create'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Create New Market'),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
