// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:app/category.dart';
import 'package:flutter/material.dart';

class CategoryItem {
  CategoryItem(this.icon, this.name, this.color);

  final IconData icon;
  final String name;
  final Color color;
}

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    // from above. Use a placeholder icon, such as `Icons.cake` for each
    // Category. We'll add custom icons later.
    final categories = List<CategoryItem>.generate(_categoryNames.length,
        (i) => CategoryItem(Icons.cake, _categoryNames[i], _baseColors[i]));

    final listView = ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int i) {
          return Category(
              categories[i].name, categories[i].icon, categories[i].color);
        });

    final appBar = AppBar(
      title: new Text(
        'Unit Converter',
        style: new TextStyle(fontSize: 30.0, color: Colors.black),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.green[100],
      elevation: 0.0,
      centerTitle: true,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
      backgroundColor: Colors.green[100],
    );
  }
}
