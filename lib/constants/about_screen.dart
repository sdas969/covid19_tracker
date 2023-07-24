import 'package:covid19_tracker/models/button_model.dart';
import 'package:covid19_tracker/models/description_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';

final List<ButtonModel> buttonList = [
  ButtonModel(
      iconData: Icons.android,
      label: 'Download',
      onPressed: () => _launchURL(downloadURL),
      color: Colors.blue.shade900),
  ButtonModel(
      iconData: OctIcons.repo_16,
      label: 'Repository',
      onPressed: () => _launchURL(repoURL),
      color: const Color(0xff238636)),
  ButtonModel(
      iconData: FontAwesome5.github,
      label: '@sdas969',
      onPressed: () => _launchURL(githubURL),
      color: Colors.black),
  ButtonModel(
      iconData: FontAwesome.database,
      label: 'disease.sh',
      onPressed: () => _launchURL(apiURL),
      color: Colors.blue),
  ButtonModel(
      iconData: FontAwesome.linkedin_squared,
      label: 'Smarajit Das',
      onPressed: () => _launchURL(linkedinURL),
      color: const Color(0xff0077b5)),
  ButtonModel(
      iconData: FontAwesome.mail,
      label: 'E-mail',
      onPressed: () => _launchURL(email),
      color: const Color(0xffce3c30))
];

final List<DescriptionModel> aboutList = [
  DescriptionModel(
      description:
          'To ensure the accuracy and reliability of its data, the app relies on the disease.sh API, which aggregates information from reputable sources, including the World Health Organization (WHO) and national health agencies. A Python script runs on a regular schedule, fetching the latest stats and updating the Firebase database. This approach removes any dependencies that could potentially cause app failures, allowing the app to deliver up-to-date information consistently.',
      title: 'Data Reliability'),
  DescriptionModel(
      description:
          'The app understands that staying informed during a pandemic should be effortless. Its dedicated team has optimized the app'
          's backend to deliver a smooth user experience. The scheduled job not only updates real-time data but also fine-tunes historical information. This careful curation ensures that you experience uninterrupted browsing with an intact trend history, without any stutters in the front-end.',
      title: 'Seamless User Experience'),
  DescriptionModel(
      description:
          'Your privacy is paramount to the app. Its data collection and usage are outlined in detail in its privacy policy. The app takes all necessary measures to safeguard your personal information and handle it responsibly.',
      title: 'Data Privacy and Security'),
  DescriptionModel(
      description:
          'The app is committed to making itself better every day. Your feedback and suggestions play a crucial role in its evolution. Feel free to reach out to sdas9696969@gmail.com if you have any questions or ideas to share.',
      title: 'Continuous Improvement')
];

_launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}

const downloadURL =
    'https://github.com/sdas969/Flutter/blob/master/covid19_tracker/app-armeabi-v7a-release.apk';
const repoURL =
    'https://github.com/sdas969/Flutter/tree/master/covid19_tracker';
const githubURL = 'https://github.com/sdas969';
const apiURL = 'https://disease.sh/';
const linkedinURL = 'https://linkedin.com/in/sdas969/';
const email = 'mailto:sdas9696969@gmail.com';
