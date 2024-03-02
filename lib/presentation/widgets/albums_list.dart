import 'package:flutter/material.dart';
import 'package:fluttertest/domain/Album.dart';

class AlbumsList extends StatelessWidget {
  final List<Album> _albums;

  const AlbumsList({super.key, required List<Album> albums}) : _albums = albums;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: _albums.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(_albums[index].title),
              onTap: () {});
        });
  }
}