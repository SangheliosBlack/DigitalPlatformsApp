import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/core/utils/dates/date_time_utils.dart';
import 'package:flutter_template/features/release/domain/entities/release_entity.dart';
import 'package:flutter_template/features/release/presentation/widgets/code_version_label.dart';
import 'package:flutter_template/features/release/presentation/widgets/video_player_widget.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ReleaseCard extends StatelessWidget {

  final ReleaseEntity release;

  const ReleaseCard({
    super.key,
    required this.release
  });

  Widget _buildMediaWidget() {

    if (release.mediaUrl != null && release.mediaUrl!.isNotEmpty) {

      return VideoPlayerWidget(
        videoUrl: release.mediaUrl!,
        maxHeight: 400.0,
      );

    }
    
    if (release.imageUrl != null && release.imageUrl!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Image.network(
              release.imageUrl!,
              key: ValueKey<String>("DnImageShimmer ${release.imageUrl}"),
              loadingBuilder: (ctx, child, loadingProgress) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  reverseDuration: const Duration(milliseconds: 300),
                  child: loadingProgress == null 
                    ? child
                    : Container(
                      key: ValueKey<String>("DnImageShimmer Shimmer ${release.imageUrl}"),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: AppTheme.primary,
                          value: loadingProgress.expectedTotalBytes != null
                             ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                             : null
                        ),
                      ),
                    ),
                );
              },
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) => Stack(
                children: [
                  Image.asset("assets/images/no-image.jpg"),
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.6),
                      child: Center(
                        child: Text(
                          stackTrace?.toString() ?? "Error loading image",
                          style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    
    return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                release.title,
                style: GoogleFonts.lora(
                  fontSize: 27,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
                maxLines: 5,
              ),
              Gap(10),
              Text(
                release.description,
                style: GoogleFonts.quicksand(
                  fontSize: 13,
                  color: Colors.black
                ),
                maxLines: 10,
              ),
              Gap(15),
              Row(
                spacing: 15,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Creado por:",
                          style: GoogleFonts.quicksand(
                            fontSize: 11,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Gap(5),
                        Row(
                          spacing: 7,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: SizedBox(
                                width:  20,
                                height: 20,
                                child: Image(
                                  image: NetworkImage(release.user.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                release.user.fullName,
                                style: GoogleFonts.quicksand(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Fecha de liberacion:",
                        style: GoogleFonts.quicksand(
                          fontSize: 11,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Gap(5),
                      Text(
                          DateTimeUtils.formatDateWithTime(release.createdAt),
                        style: GoogleFonts.quicksand(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Gap(15),
              Row(
                spacing: 15,
                children: [
                  /*
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(
                      "Q${release.quarter}",
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  */
                  CodeVersionLabel(
                    versionCode: release.codeVersion.code
                  ),
                ],
              ),
              Gap(20),
              Center(
                child: _buildMediaWidget(),
              ),
            ],
          ),
        ),
      )
    );

  }

}