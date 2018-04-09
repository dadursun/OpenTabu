/*
* OpenTabu is an Open Source game developed by Leonardo Rignanese <dev.rignanese@gmail.com>
* GNU Affero General Public License v3.0: https://choosealicense.com/licenses/agpl-3.0/
* GITHUB: https://github.com/rignaneseleo/OpenTabu
* */
import 'package:flutter/material.dart';
import 'package:opentabu/model/settings.dart';
import 'package:opentabu/persistence/csvDataReader.dart';
import 'package:opentabu/persistence/dataReader.dart';

class HomePage extends StatefulWidget {
  final dynamic _newGame;

  HomePage(this._newGame);

  @override
  State<StatefulWidget> createState() {
    return new HomePageState(_newGame);
  }
}

class HomePageState extends State<HomePage> {
  dynamic _newGame;
  DataReader _dr;

  Settings _settings;

  HomePageState(this._newGame) {
    _dr = new CSVDataReader();

    _settings = new Settings();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
        child: new Column(
      children: <Widget>[
        _settingsContainer,
        new MaterialButton(
          onPressed: () {
            _newGame(_settings, _dr.words);
          },
          child: new Text(
            "START",
            style: new TextStyle(fontSize: 30.0),
          ),
        )
      ],
    ));
  }

  get _settingsContainer {
    return new Container(
      padding: new EdgeInsets.all(15.0),
      child: new Column(
        children: <Widget>[
          _numberOfTeamsSelector,
          _numberOfTurnsSelector,
          _numberOfSkipSelector,
          _secondsPerTurnSelector
        ],
      ),
    );
  }

  get _numberOfTeamsSelector {
    return new Row(
      children: <Widget>[
        new Expanded(child: new Text("Number of teams: ", style: new TextStyle(fontSize: 18.0))),
        new Slider(
            value: _settings.nPlayers.toDouble(),
            divisions: 3,
            min: 2.0,
            max: 5.0,
            onChanged: (value) {
              setState(() {
                _settings.nPlayers = value.toInt();
              });
            }),
        new Text(_settings.nPlayers.toString())
      ],
    );
  }

  get _numberOfSkipSelector {
    return new Row(
      children: <Widget>[
        new Expanded(child: new Text("Skips number per turn: ", style: new TextStyle(fontSize: 18.0))),
        new Slider(
            value: _settings.nSkip.toDouble(),
            divisions: 10,
            min: 0.0,
            max: 10.0,
            onChanged: (value) {
              setState(() {
                _settings.nSkip = value.toInt();
              });
            }),
        new Text(_settings.nSkip.toString())
      ],
    );
  }

  get _numberOfTurnsSelector {
    return new Row(
      children: <Widget>[
        new Expanded(child: new Text("Turns number: ", style: new TextStyle(fontSize: 18.0))),
        new Slider(
            value: _settings.nTurns.toDouble(),
            divisions: 17,
            min: 3.0,
            max: 20.0,
            onChanged: (value) {
              setState(() {
                _settings.nTurns = value.toInt();
              });
            }),
        new Text(_settings.nTurns.toString())
      ],
    );
  }

  get _secondsPerTurnSelector {
    return new Row(
      children: <Widget>[
        new Expanded(child: new Text("Seconds per turn: ", style: new TextStyle(fontSize: 18.0))),
        new Slider(
            value: _settings.turnDurationInSeconds.toDouble(),
            divisions: 15,
            min: 30.0,
            max: 180.0,
            onChanged: (value) {
              setState(() {
                _settings.turnDurationInSeconds = value.toInt();
              });
            }),
        new Text(_settings.turnDurationInSeconds.toString())
      ],
    );
  }
}