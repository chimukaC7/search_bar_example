import 'package:flutter/material.dart';

class SarchbarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Search Bar Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(useRootNavigator: false, context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null!);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement the search results here based on the query.
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement suggestions here based on the query.
    final List<String> suggestionList = [
      "Oliver Anderson",
      "Sophia Martinez",
      "Liam Johnson",
      "Emma Smith",
      "Noah Davis",
      "Ava Taylor",
      "Ethan Brown",
      "Isabella Wilson",
      "Lucas Moore",
      "Mia Jones",
      "Jackson Robinson",
      "Olivia White",
      "Aiden Harris",
      "Sophia Thompson",
      "Logan Carter",
      "Emily Miller",
      "Mason Martin",
      "Harper Clark",
      "Caleb Turner",
      "Chloe Baker",
    ];

    final filteredList = suggestionList.where((suggestion) => suggestion.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredList[index]),
          onTap: () {
            // You can handle the selection of a suggestion here.
            // For example, you might want to navigate to a new page.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchResultPage(query: filteredList[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class SearchResultPage extends StatelessWidget {
  final String query;

  const SearchResultPage({
    super.key,
    required this.query
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Result'),
      ),
      body: Center(
        child: Text('Search result for: $query'),
      ),
    );
  }
}