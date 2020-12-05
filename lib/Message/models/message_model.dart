import 'user_model.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.unread,
  });
}

// YOU - current user
final User currentUser =
    User(id: 0, name: 'Current User', imageUrl: 'images/greg.jpg');

// USERS
final User greg = User(id: 1, name: 'Greg', imageUrl: 'images/greg.jpg');

final User james = User(id: 2, name: 'James', imageUrl: 'images/james.jpg');

final User john = User(id: 3, name: 'John', imageUrl: 'images/john.jpg');

final User olivia = User(id: 4, name: 'Olivia', imageUrl: 'images/olivia.jpg');

final User sam = User(id: 5, name: 'Sam', imageUrl: 'images/sam.jpg');

final User sophia = User(id: 6, name: 'Sophia', imageUrl: 'images/sophia.jpg');
final User steven = User(id: 7, name: 'Steven', imageUrl: 'images/steven.jpg');

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Selamun aleyküm',
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: john,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: steven,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: sam,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: greg,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Orda mısın????',
    // unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Hiiç',
    // unread: true,
  ),
  Message(
    sender: james,
    time: '3:45 PM',
    text: 'Eee napıyorsun',
    // unread: true,
  ),
  Message(
    sender: james,
    time: '3:15 PM',
    text: 'Aynı nolsun',
    // unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'İyi sen',
    // unread: true,
  ),
  Message(
    sender: james,
    time: '2:00 PM',
    text: 'Naber',
    // unread: true,
  ),
];
