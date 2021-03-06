/*
* OpenTabu is an Open Source game developed by Leonardo Rignanese <dev.rignanese@gmail.com>
* GNU Affero General Public License v3.0: https://choosealicense.com/licenses/agpl-3.0/
* GITHUB: https://github.com/rignaneseleo/OpenTabu
* */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:opentabu/handler/words_handler.dart';
import 'package:opentabu/model/settings.dart';
import 'package:opentabu/model/word.dart';
import 'package:opentabu/provider/csv_provider.dart';
import 'package:opentabu/provider/provider.dart';
import 'package:opentabu/theme/theme.dart';
import 'package:opentabu/view/gamePage.dart';
import 'package:opentabu/view/homePage.dart';
import 'package:opentabu/view/splash_screen.dart';

WordHandler words;

Future<void> main() async {
  runApp(new MaterialApp(
    title: 'Loading Tabu',
    theme: myTheme,
    home: new SplashScreen(),
  ));

  WordProvider wordProvider = new CsvProvider();
  var wordsList = await wordProvider.readData();
  words = WordHandler(wordsList);

  runApp(MaterialApp(
    title: 'Tabu',
    home: new HomePage(),
    theme: myTheme,
    routes: {
      "/home": (_) => new HomePage(),
    },
  ));
}
