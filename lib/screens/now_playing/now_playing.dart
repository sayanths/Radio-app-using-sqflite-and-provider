import 'package:flutter/material.dart';

class NowPlaying extends StatelessWidget {
    final String radioTitle;
    final String radioImageUrl;
   NowPlaying({super.key,required this.radioTitle,required this.radioImageUrl});

  @override
  Widget build(BuildContext context) {
  
    
    return Container(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.green),
          child: Column(
            children: [
              _nowPlayingText(context, this.radioTitle, this.radioImageUrl),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nowPlayingText(BuildContext context, String title, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: ListTile(
        title: Text(title),
        subtitle: Text(
          'now playing',
          textScaleFactor: 0.8,
          style: TextStyle(color: Colors.brown),
        ),
        leading: _image(imageUrl, Size: 50.0),
        trailing: Wrap(
          spacing: -10.0,
          children: [
            _buildStopIcon(context),
            _buildShareIcon(context),
          ],
        ),
      ),
    );
  }

  Widget _image(Url, {Size}) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(Url),
      ),
      height: Size == null ? 55.0 : Size,
      width: Size == null ? 55.0 : Size,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 3,
            offset: Offset(0, 3),
          )
        ],
      ),
    );
  }

  Widget _buildStopIcon(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.stop),
      color: Colors.red,
    );
  }

  Widget _buildShareIcon(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.share),
      color: Colors.orange,
    );
  }
}
