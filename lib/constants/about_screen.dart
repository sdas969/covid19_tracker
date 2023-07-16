import 'package:covid19_tracker/models/button_model.dart';
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
