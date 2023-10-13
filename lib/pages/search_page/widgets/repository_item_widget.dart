import 'package:flutter/material.dart';
import 'package:githubster/models/github_repository_model.dart';
import 'package:githubster/pages/search_page/widgets/favorite_button.dart';
import 'package:githubster/pages/search_page/widgets/repository_item_wrap_widget.dart';
import 'package:githubster/resources/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryItemWidget extends StatelessWidget {
  const RepositoryItemWidget({
    super.key,
    required this.gitHubRepositoryModel,
  });

  final GitHubRepositoryModel gitHubRepositoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(gitHubRepositoryModel.url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: RepositoryItemWrapWidget(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                gitHubRepositoryModel.nameOfRepository,
                style: AppStyles.body,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            FavoriteButton(
              gitHubRepositoryModel: gitHubRepositoryModel,
            ),
          ],
        ),
      ),
    );
  }
}
