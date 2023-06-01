import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/widgets/image/image_network.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../../theme/chat_constants.dart';
import '../../container_message.dart';
import 'preview_link.dart';
import 'preview_link_bloc.dart';

class MetadataLinkWidget extends StatelessWidget {
  const MetadataLinkWidget(this.link, {required this.isYour, super.key});
  final String link;
  final bool isYour;
  TextStyle get titleStyle => TextStyle(
      color: ChatConstants.messageTextColor(isYour),
      fontSize: 14,
      fontWeight: FontWeight.bold);
  TextStyle get bodyStyle => TextStyle(
      color: ChatConstants.messageTextColor(isYour),
      fontSize: 12,
      fontWeight: FontWeight.normal);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PreviewLinkBloc(link),
      child: BlocBuilder<PreviewLinkBloc, PreviewLinkState>(
        builder: (_, state) {
          if (state.loading || state.link == null) {
            return const SizedBox.shrink();
          }
          return ContainerMessage(
            isYour,
            child: GestureDetector(
              onTap: () => launchUrlString(link),
              child: Center(
                  child: state.link?.isSmallImage == true
                      ? _buildPreviewLinkWithIcon(state.link!)
                      : _buildPreviewLinkWithImage(state.link!)),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPreviewLinkWithImage(PreviewLinkData metaDataLink) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (metaDataLink.image.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: XImageNetwork(metaDataLink.image, fit: BoxFit.cover),
          ),
        if (metaDataLink.title.isNotEmpty)
          Text(
            metaDataLink.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: titleStyle,
          ),
        if (metaDataLink.description.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            metaDataLink.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: bodyStyle,
          ),
        ],
      ],
    );
  }

  Widget _buildPreviewLinkWithIcon(PreviewLinkData metaDataLink) {
    return BlocBuilder<PreviewLinkBloc, PreviewLinkState>(
      builder: (_, state) {
        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (metaDataLink.title.isNotEmpty)
                    Text(
                      metaDataLink.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: titleStyle,
                    ),
                  if (metaDataLink.description.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      metaDataLink.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: bodyStyle,
                    ),
                  ]
                ],
              ),
            ),
            if (metaDataLink.image.isNotEmpty)
              SizedBox(
                width: 64,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: XImageNetwork(metaDataLink.image, fit: BoxFit.cover),
                ),
              ),
          ],
        );
      },
    );
  }
}
