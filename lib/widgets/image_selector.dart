import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

typedef OnChanged = void Function(String value);

class ImagePickerWidget extends StatefulWidget {
  final OnChanged onChanged;
  final String imageUrl;
  final String? imageLabel;
  const ImagePickerWidget(
      {required this.onChanged, String? url, this.imageLabel})
      : imageUrl = url ?? '';
  @override
  _ImagePickerWidgetState createState() =>
      _ImagePickerWidgetState(imageUrl: imageUrl);
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  String imageUrl;

  bool _logoLoading = false;

  _ImagePickerWidgetState({required this.imageUrl});
  /*Future<String> _getImage() async {
    if (kIsWeb || defaultTargetPlatform == TargetPlatform.macOS) {
      return null;
    } else {
      //var image = await ImagePicker().getImage(source: ImageSource.gallery);
      if (image == null) {
        setState(() {});
        // throw Exception('no image selected');
        return '';
      }
      final response = null; // TODO upload image

      return response['url'];
    }
  }*/

  String _imageLabel() => widget.imageLabel ?? 'Bild';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: imageUrl.isNotEmpty
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        children: <Widget>[
          RaisedButton.icon(
            elevation: 0,
            highlightElevation: 1,
            icon: Icon(
              Icons.add_a_photo,
              color: Colors.white,
            ),
            label: Text(
              imageUrl.isNotEmpty
                  ? 'replace ${_imageLabel()}'
                  : 'upload ${_imageLabel()}',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                _logoLoading = true;
              });
            },
          ),
          if (imageUrl.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imageUrl,
                width: 100,
              ),
            ),
          if (imageUrl.isNotEmpty)
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    widget.onChanged('');
                    imageUrl = '';
                    _logoLoading = false;
                  });
                }),
        ],
      ),
    );
  }
}
