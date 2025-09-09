import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui;

class SimpleWebVideoWidget extends StatefulWidget {
  final String videoUrl;
  final double? height;
  final double? width;
  final double? maxHeight;

  const SimpleWebVideoWidget({
    super.key,
    required this.videoUrl,
    this.height,
    this.width,
    this.maxHeight = 400.0,
  });

  @override
  State<SimpleWebVideoWidget> createState() => _SimpleWebVideoWidgetState();
}

class _SimpleWebVideoWidgetState extends State<SimpleWebVideoWidget> {
  late String _videoElementId;

  @override
  void initState() {
    super.initState();
    _videoElementId = 'video-${DateTime.now().millisecondsSinceEpoch}-${widget.videoUrl.hashCode}';
    _createVideoElement();
  }

  void _createVideoElement() {
    final videoElement = html.VideoElement()
      ..src = widget.videoUrl
      ..controls = true
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.objectFit = 'contain'
      ..style.borderRadius = '10px'
      ..preload = 'metadata'
      ..autoplay = false;

    // Register the video element
    ui.platformViewRegistry.registerViewFactory(
      _videoElementId,
      (int viewId) => videoElement,
    );
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = widget.maxHeight ?? 400.0;

    return Container(
      width: widget.width,
      height: maxHeight,
      child: SingleChildScrollView(
        child: Container(
          height: maxHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: HtmlElementView(
              viewType: _videoElementId,
            ),
          ),
        ),
      ),
    );
  }
}
