import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Color primaryColor = Colors.blueAccent; //Color.fromARGB(0, 0, 157, 255);

const listGreetings = ["Hi! ", "Hello! ", "Hi there! "];

const lastUpdated = "Last Updated October 2021";
const footerName = "Rifqi Mufidianto (Me)";
const descAbout = "I am Rifqi Mufidianto, I live in Indonesia in the city of Bekasi."
    " I am interested in mobile development, especially for Android, photography"
    " and design. And here's my portfolio.";
const descPorto = "Ini adalah beberapa project yang sudah atau sedang di kerjakan.";
const descPhoto = "Saya sangat tertarik sekali dengan beberapa foto pemandangan,"
    " dan berikut beberapa foto yang bisa saya ambil di sektiar saya.";
const descDesign = "Saya juga suka dengan design dan ini beberapa desain yang pernah saya buat.";
const descContact = "It was a pleasure having you browse around this. If you have any"
    " questions, want me on your team, or just want to say hi . . Let's be friends!";

const listSocialIcons = [
  "https://img.icons8.com/fluent/2x/instagram-new.png",
  "https://img.icons8.com/fluent/2x/twitter.png",
  "https://img.icons8.com/fluent/2x/github.png",
  "https://img.icons8.com/fluent/2x/discord.png",
  "https://img.icons8.com/fluent/2x/behance.png",
];

const listSocialLink = [
  "https://instagram.com/mufiidz",
  "https://twitter.com/mufiiidz",
  "https://github.com/mufiidz",
  "https://discordapp.com/users/492185855167954945",
  "https://behance.net/KUFIRA",
];

const listCoverImage = [
  "assets/cover.jpg",
  "assets/cover2.jpg"
];

final listContactIcons = [
  Icons.home,
  Icons.mail,
];

final listContactTitles = [
  "Location",
  "Email",
];

final listContactDetails = [
  "Bekasi, Indonesia",
  "rmufidianto@student.esaunggul.ac.id"
];

void openLink(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Cant launch $url';