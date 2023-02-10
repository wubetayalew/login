import 'dart:convert';

class UserModel {
  final String identification;
  final String firstName;
  final String lastName;
  final String? userCreated;
  String? email;
  List<String>? phoneNumber;
  List<String>? location;
  List<String>? image;
  List<String>? favorite;
  List<String>? cart;
  List<String>? orderd;
  List<String>? channels;
  List<String>? doNotWantToSeeThisPost;
  List<String>? commentAndReating;
  bool? banUser;
  UserModel({
    required this.identification,
    required this.firstName,
    required this.lastName,
    required this.userCreated,
    email,
    phoneNumber,
    location,
    image,
    favorite,
    cart,
    orderd,
    channels,
    doNotWantToSeeThisPost,
    commentAndReating,
    banUser,
  })  : email = email ?? "",
        phoneNumber = phoneNumber ?? [""],
        location = location ?? [''],
        image = image ?? [''],
        favorite = favorite ?? [''],
        cart = cart ?? [''],
        orderd = orderd ?? [''],
        channels = channels ?? [''],
        doNotWantToSeeThisPost = doNotWantToSeeThisPost ?? [''],
        commentAndReating = commentAndReating ?? [''],
        banUser = banUser ?? false;

  UserModel copyWith({
    String? identification,
    String? firstName,
    String? lastName,
    String? userCreated,
    String? email,
    List<String>? phoneNumber,
    List<String>? location,
    List<String>? image,
    List<String>? favorite,
    List<String>? cart,
    List<String>? orderd,
    List<String>? channels,
    List<String>? doNotWantToSeeThisPost,
    List<String>? commentAndReating,
    bool? banUser,
  }) {
    return UserModel(
      identification: identification ?? this.identification,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userCreated: userCreated ?? this.userCreated,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      location: location ?? this.location,
      image: image ?? this.image,
      favorite: favorite ?? this.favorite,
      cart: cart ?? this.cart,
      orderd: orderd ?? this.orderd,
      channels: channels ?? this.channels,
      doNotWantToSeeThisPost:
          doNotWantToSeeThisPost ?? this.doNotWantToSeeThisPost,
      commentAndReating: commentAndReating ?? this.commentAndReating,
      banUser: banUser ?? this.banUser,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'identification': identification,
      'firstName': firstName,
      'lastName': lastName,
      'userCreated': userCreated,
      'email': email,
      'phoneNumber': phoneNumber,
      'location': location,
      'image': image,
      'favorite': favorite,
      'cart': cart,
      'orderd': orderd,
      'channels': channels,
      'doNotWantToSeeThisPost': doNotWantToSeeThisPost,
      'commentAndReating': commentAndReating,
      'banUser': banUser,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      identification: map['identification'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      userCreated: map['userCreated'],
      email: map['email'],
      phoneNumber: List<String>.from(map['phoneNumber']),
      location: List<String>.from(map['location']),
      image: List<String>.from(map['image']),
      favorite: List<String>.from(map['favorite']),
      cart: List<String>.from(map['cart']),
      orderd: List<String>.from(map['orderd']),
      channels: List<String>.from(map['channels']),
      doNotWantToSeeThisPost: List<String>.from(map['doNotWantToSeeThisPost']),
      commentAndReating: List<String>.from(map['commentAndReating']),
      banUser: map['banUser'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  List<Object?> get props => [
        identification,
        firstName,
        lastName,
        userCreated,
        email,
        phoneNumber,
        location,
        image,
        favorite,
        cart,
        orderd,
        channels,
        doNotWantToSeeThisPost,
        commentAndReating,
        banUser
      ];
}

// void main(List<String> args) {
//   UserModel a = UserModel(
//     identification: '1234',
//     firstName: 'sjkdfbvsuod',
//     lastName: 'akfsalfblas',
//     userCreated: 'skjfgsipghis',
//   );
//   a.phoneNumber?.add('value');
//   a.phoneNumber?.add('value');
//   a.phoneNumber?.add('value');
//   List<String> b = a.phoneNumber ?? [];
//   print(a.toMap());
// }
