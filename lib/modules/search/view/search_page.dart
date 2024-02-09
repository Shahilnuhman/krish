import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krish/modules/home/riverpod/appThemeProvider.dart';
import 'package:krish/modules/home/widgets/searchBarWidget.dart';
import 'package:krish/support/theme/theme.dart';
import 'package:krish/support/transition/transition.dart';
import 'package:lottie/lottie.dart';


class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});
   static Route route() {
    return AppFadeTransition(page: const SearchPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(appThemeProvider);

    return  Scaffold(appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppBar(
          // Leading icon button for user profile
          leading:Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(Icons.person, color: Colors.white,
                size: 24,),
            ),
          ),
          centerTitle: true,
          backgroundColor: colors(context).primary,
          // App logo in the title
          title: SizedBox(
            width: 50,
            child: Image.asset("assets/images/image.png"),
          ),
          // Actions in the app bar
          actions: [
            // Toggle dark mode button
            IconButton(
              onPressed: () {
                ref.read(appThemeProvider.notifier).state = !isDarkMode;
              },
              icon: isDarkMode
                  ? const Icon(
                      Icons.sunny,
                      color: Colors.amber,
                    )
                  : const Icon(
                      Icons.dark_mode,
                      color: Colors.white,
                    ),
            ),
         
          ],
          // Search bar widget at the bottom of the app bar
          bottom:  PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: SearchBarWidget(onTap: (){
            }),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children:[
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Lottie.asset(
                  'assets/images/search.json',
                  height: 200,
                  repeat: false,
                ),
              ),
            //  Text("No matches Found")
        
        
          ]
        ),
      ),
    );
  }
}