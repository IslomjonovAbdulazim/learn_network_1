// https://jsonplaceholder.typicode.com/photos

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  bool isLoading = false;
  final dio = Dio();
  List data = [];

  void getPhotos() async {
    isLoading = true;
    setState(() {});

    final response = await dio.get("https://jsonplaceholder.typicode.com/photos",);
    data = response.data;

    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(data[index]['id'].toString()),
                title: Text(data[index]['title']),
                subtitle: Text(data[index]['url']),
                trailing: Text(data[index]['albumId'].toString()),
              );
            },
          ),
        ),
      ),
    );
  }
}
