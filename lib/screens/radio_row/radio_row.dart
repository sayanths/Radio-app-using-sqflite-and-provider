import 'package:flutter/material.dart';

import 'package:radio_app/model/radio.dart';

class RadioRow extends StatefulWidget {
  final RadioModel radioModel;
  const RadioRow({super.key, required this.radioModel});

  @override
  State<RadioRow> createState() => _RadioRowState();
}

class _RadioRowState extends State<RadioRow> {

  @override
  Widget build(BuildContext context) {
    return _buildSongRow();
  }

  Widget _buildSongRow() {
    return ListTile(
      title: Text(
        widget.radioModel.radioName,
        style: TextStyle(color: Colors.purpleAccent),
      ),
      leading: _image(this.widget.radioModel.radioPic),
      subtitle: Text(
        this.widget.radioModel.radioDesc,
        maxLines: 3,
      ),
      trailing: Wrap(
        spacing: -10.0,
        runSpacing: 0.0,
        children: [
          _buildPlayStoreIcon(),
          _buildAddFavouriteIcon(),
        ],
      ),
    );
  }

  Widget _image(Url, {Size}) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(Url),
      ),
      height: Size == null ? 55 : Size,
      width: Size == null ? 55 : Size,
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

  Widget _buildPlayStoreIcon() {
    return IconButton(onPressed: () {}, icon: Icon(Icons.play_circle_filled));
  }

  Widget _buildAddFavouriteIcon() {
    return IconButton(
        color: Colors.amber, onPressed: () {}, icon: Icon(Icons.favorite));
  }
}
