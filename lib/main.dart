import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CI/CD integration',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 50),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/persian_flutter.jpeg',
                scale: 20,
              ),
              const Text(
                'Persian Flutter community presents',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              )
            ],
          ),
          const Gap(25),
          const Text(
            'Here we are learning how to implement a Github workflow in Flutter projects that provide us the APK file and a free domain which can see the web app of the project there, after merge with main branch.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
          const Gap(15),
          const Text(
            'Please follow the Persian Flutter community to know more...',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black87,
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    _visitWebsite('www.linkedin.com/company/persianflutter/');
                  },
                  style: IconButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(10, 102, 194, 1)),
                  icon: SvgPicture.asset(
                    'assets/icons/linkedln.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  )),
              IconButton(
                  onPressed: () {
                    _visitWebsite('t.me/persian_flutter');
                  },
                  style: IconButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(38, 165, 228, 1)),
                  icon: SvgPicture.asset(
                    'assets/icons/telegram.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  )),
              IconButton(
                  onPressed: () {
                    _visitWebsite('www.youtube.com/@PersianFlutter');
                  },
                  style: IconButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 0, 0, 1)),
                  icon: SvgPicture.asset(
                    'assets/icons/youtube.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  )),
              IconButton(
                  onPressed: () {
                    _visitWebsite('github.com/mahdiyarz/persian_flutter_ci_cd');
                  },
                  style: IconButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(24, 23, 23, 1)),
                  icon: SvgPicture.asset(
                    'assets/icons/github.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _visitWebsite(String websiteURL) async {
    final Uri finalUrl = Uri.parse('https://$websiteURL');

    if (!await launchUrl(
      finalUrl,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $finalUrl';
    }
  }
}
