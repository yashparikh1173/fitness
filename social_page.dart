
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart'; // For sharing posts

class SocialPage extends StatefulWidget {
  @override
  _SocialPageState createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  List<Post> posts = [
    Post(username: "John Doe", content: "Had an amazing workout today! 💪🔥", profileImage: "assets/profile.jpg"),
    Post(username: "Emily Smith", content: "Loving my new fitness journey! 🏋️‍♂️", profileImage: "assets/profile2.jpg"),
    Post(username: "Michael Johnson", content: "Who else is hitting the gym today?", profileImage: "assets/profile3.jpg"),
  ];

  void _likePost(int index) {
    setState(() {
      posts[index].likes += 1;
    });
  }

  void _commentOnPost(int index) {
    TextEditingController _commentController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text("Add a Comment", style: TextStyle(color: Colors.white)),
          content: TextField(
            controller: _commentController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Write a comment...",
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
          actions: [
            TextButton(
              child: Text("Cancel", style: TextStyle(color: Colors.red)),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text("Post", style: TextStyle(color: Colors.green)),
              onPressed: () {
                setState(() {
                  posts[index].comments.add(_commentController.text);
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _sharePost(String content) {
    Share.share(content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Social Feed", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return _buildPost(posts[index], index);
        },
      ),
    );
  }

  Widget _buildPost(Post post, int index) {
    return Card(
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(post.profileImage),
                  radius: 25,
                ),
                SizedBox(width: 10),
                Text(post.username, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Text(post.content, style: TextStyle(color: Colors.white, fontSize: 14)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite, color: Colors.red),
                      onPressed: () => _likePost(index),
                    ),
                    Text(post.likes.toString(), style: TextStyle(color: Colors.white)),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.comment, color: Colors.white),
                  onPressed: () => _commentOnPost(index),
                ),
                IconButton(
                  icon: Icon(Icons.share, color: Colors.white),
                  onPressed: () => _sharePost(post.content),
                ),
              ],
            ),
            if (post.comments.isNotEmpty) ...[
              Divider(color: Colors.grey),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: post.comments.map((comment) => Text("• $comment", style: TextStyle(color: Colors.white70))).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class Post {
  String username;
  String content;
  String profileImage;
  int likes;
  List<String> comments;

  Post({required this.username, required this.content, required this.profileImage, this.likes = 0, List<String>? comments})
      : this.comments = comments ?? [];
}
