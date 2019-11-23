import 'package:meta/meta.dart';
import 'dart:convert';

class UserList {
    final List<User> users;

    UserList({
        @required this.users,
    });

    UserList copyWith({
        List<User> users,
    }) => 
        UserList(
            users: users ?? this.users,
        );

    factory UserList.fromJson(String str) => UserList.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserList.fromMap(Map<String, dynamic> json) => UserList(
        users: List<User>.from(json["Users"].map((x) => User.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "Users": List<dynamic>.from(users.map((x) => x.toMap())),
    };
}

class User {
    final String firstName;
    final String lastName;
    final String email;
    final List<String> phone;
    final String profilePic;
    final String address;

    User({
        @required this.firstName,
        @required this.lastName,
        @required this.email,
        @required this.phone,
        @required this.profilePic,
        @required this.address,
    });

    User copyWith({
        String firstName,
        String lastName,
        String email,
        List<String> phone,
        String profilePic,
        String address,
    }) => 
        User(
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            email: email ?? this.email,
            phone: phone ?? this.phone,
            profilePic: profilePic ?? this.profilePic,
            address: address ?? this.address,
        );

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : List<String>.from(json["phone"].map((x) => x)),
        profilePic: json["profilePic"] == null ? null : json["profilePic"],
        address: json["address"] == null ? null : json["address"],
    );

    Map<String, dynamic> toMap() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email == null ? null : email,
        "phone": phone == null ? null : List<dynamic>.from(phone.map((x) => x)),
        "profilePic": profilePic == null ? null : profilePic,
        "address": address == null ? null : address,
    };
}
