import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:futureit/news/news_web_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<Article>> future;
  String? searchTerm;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  List<String> categoryItems = [
    "GENERAL",
    "BUSINESS",
    "ENTERTAINMENT",
    "HEALTH",
    "SCIENCE",
    "SPORTS",
    "TECHNOLOGY",
  ];

  late String selectedCategory;

  @override
  void initState() {
    selectedCategory = categoryItems[0];
    future = getNewsData();

    super.initState();
  }

  Future<List<Article>> getNewsData() async {
    NewsAPI newsAPI = NewsAPI("c8bbe5666bc24e5d92b79f0e047a778e");
    return await newsAPI.getTopHeadlines(
      country: "us",
      query: searchTerm,
      category: selectedCategory,
      pageSize: 50,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: isSearching ? searchAppBar() : appBar(),
      body: SafeArea(
          child: Container(
            child: Column(
                  children: [
            _buildCategories(),
            Expanded(
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Error loading the news"),
                    );
                  } else {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return _buildNewsListView(snapshot.data as List<Article>);
                    } else {
                      return const Center(
                        child: Text("No news available"),
                      );
                    }
                  }
                },
                future: future,
              ),
            )
                  ],
                ),
          )),
    );
  }

  searchAppBar() {
    return AppBar(
      bottom: PreferredSize(
            preferredSize: Size.fromHeight(1), // Set the height of the white border
            child: Container(
              color: Colors.grey, // Color of the white border
              height: 1, // Thickness of the white border
            ),
          ),
      backgroundColor: Pallete.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back,
        size: 30,),
        onPressed: () {
          setState(() {
            isSearching = false;
            searchTerm = null;
            searchController.text = "";
            future = getNewsData();
          });
        },
      ),
      title: Container(
      
        height: 40,
        child: Center(
          child: TextField(
            controller: searchController,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                color: Pallete.black,
                fontSize: 12
              )
            ),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: Pallete.black,
                  fontSize: 12
                )
              ),
              border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
             focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1.0,
                          color: Colors.black)
                        )
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                searchTerm = searchController.text;
                future = getNewsData();
              });
            },
            icon: const Icon(Icons.search)),
      ],
    );
  }

  appBar() {
    return AppBar(
      bottom: PreferredSize(
            preferredSize: Size.fromHeight(1), // Set the height of the white border
            child: Container(
              color: Colors.grey, // Color of the white border
              height: 1, // Thickness of the white border
            ),
          ),
      backgroundColor: Colors.white,
      title: Text("News",
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          color: Pallete.black,
          fontSize: 16
        )
      ),),
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                isSearching = true;
              });
            },
            icon: const Icon(Icons.search,)),
      ],
    );
  }

  Widget _buildNewsListView(List<Article> articleList) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ListView.builder(
        itemBuilder: (context, index) {
          Article article = articleList[index];
          return _buildNewsItem(article);
        },
        itemCount: articleList.length,
      ),
    );
  }

  Widget _buildNewsItem(Article article) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsWebView(url: article.url!),
            ));
      },
      child: Card(
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(),
                height: 60,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Image.network(
                    article.urlToImage ?? "",
                    fit: BoxFit.fitHeight,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image_not_supported);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title!,
                    maxLines: 2,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 12
                      )
                    )
                  ),
                  Text(
                    article.source.name!,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                      )
                    )
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              
              onPressed: () {
                setState(() {
                  selectedCategory = categoryItems[index];
                  future = getNewsData();
                });
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                categoryItems[index] == selectedCategory
                    ? Pallete.yellow1
                    : Pallete.white
              ),
              side: MaterialStateProperty.all<BorderSide>(
      BorderSide(
        color: Pallete.black,
        width: 0.5,
      ),
    ),
              ),
              child: Text(categoryItems[index],
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: Pallete.black,
                  fontSize: 12
                )
              ),),
            ),
          );
        },
        itemCount: categoryItems.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}