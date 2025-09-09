import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui;

class WebVideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final double? height;
  final double? width;
  final double? maxHeight;

  const WebVideoPlayerWidget({
    super.key,
    required this.videoUrl,
    this.height,
    this.width,
    this.maxHeight = 400.0,
  });

  @override
  State<WebVideoPlayerWidget> createState() => _WebVideoPlayerWidgetState();
}

class _WebVideoPlayerWidgetState extends State<WebVideoPlayerWidget> {
  late html.VideoElement _videoElement;
  late String _videoElementId;
  bool _isLoading = true;
  bool _hasError = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _videoElementId = 'video-${widget.videoUrl.hashCode}';
    _createVideoElement();
    
    // Timeout para el loading - si no carga en 10 segundos, dejar de mostrar loading
    Future.delayed(Duration(seconds: 10), () {
      if (mounted && _isLoading) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  void _createVideoElement() {
    _videoElement = html.VideoElement()
      ..src = widget.videoUrl
      ..controls = true
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.objectFit = 'contain'
      ..style.borderRadius = '10px'
      ..preload = 'metadata'
      ..crossOrigin = 'anonymous';

    // Event listeners - usar solo eventos básicos que siempre existen
    _videoElement.onCanPlay.listen((event) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _hasError = false;
        });
      }
    });

    _videoElement.onError.listen((event) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _hasError = true;
          _errorMessage = 'Error loading video';
        });
      }
    });

    // Register the video element
    ui.platformViewRegistry.registerViewFactory(
      _videoElementId,
      (int viewId) => _videoElement,
    );
  }

  void _enterFullscreen() {
    if (_videoElement.requestFullscreen != null) {
      _videoElement.requestFullscreen();
    }
  }

  @override
  void dispose() {
    _videoElement.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Container(
        height: widget.maxHeight ?? 400.0,
        width: widget.width,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.white,
                size: 48,
              ),
              SizedBox(height: 16),
              Text(
                'Error loading video',
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Text(
                _errorMessage ?? 'Unknown error',
                style: GoogleFonts.quicksand(
                  color: Colors.white70,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _createVideoElement();
                  });
                },
                icon: Icon(Icons.refresh),
                label: Text('Retry'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final maxHeight = widget.maxHeight ?? 400.0;

    Widget videoWidget = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            // HTML Video Element
            HtmlElementView(
              viewType: _videoElementId,
            ),
            
            // Loading Indicator
            if (_isLoading)
              Container(
                color: Colors.black87,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.primary,
                    strokeWidth: 3,
                  ),
                ),
              ),
            
            // Fullscreen button overlay
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: _enterFullscreen,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.fullscreen,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // Always use scroll for consistent experience
    return Container(
      width: widget.width,
      height: maxHeight,
      child: SingleChildScrollView(
        child: videoWidget,
      ),
    );
  }
}
