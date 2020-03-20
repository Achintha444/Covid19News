import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CovidAll extends Equatable {
  int _cases;
  int _deaths;
  int _recovered;

  CovidAll({
    @required int cases,
    @required int deaths,
    @required int recovered,
  }) : super([cases, deaths,recovered]) {
    this._cases = cases;
    this._deaths = deaths;
    this._recovered = recovered;
  }

  int get getCases {
    return this._cases;
  }

  int get getDeaths {
    return this._deaths;
  }

  int get getRecovered{
    return this._recovered;
  }
}
