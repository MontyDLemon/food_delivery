//todo: Implement Authentication

class User {
  final String id;
  final String name;
  final String? imageUrl;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.imageUrl,
  });

//for now i create a fake user
  get user => User(
        id: "1124140120414",
        name: "MontyD_Lemon",
        email: "monty@gmail.com",
      );
}
