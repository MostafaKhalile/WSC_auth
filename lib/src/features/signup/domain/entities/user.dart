import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/*
╔═══════════════════════════════════════════════════╗
║ Created by Fady Fouad on 24/09/2023 at 14:11.     ║
║═══════════════════════════════════════════════════║
║ fady.fouad.a@gmail.com.                           ║
╚═══════════════════════════════════════════════════╝
*/


class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String token;

  User({required this.id, required this.name, required this.email, required this.phone, required this.image, required this.token});

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    image,
    token
  ];

}