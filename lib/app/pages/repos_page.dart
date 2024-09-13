import 'package:flutter/material.dart';
import 'package:github_tracker/app/utils/theme_app.dart';

import '../models/repos.dart';
import '../models/user.dart';

class ReposPage extends StatelessWidget {
  final List<Repos>? reposList;
  final User user;

  const ReposPage({
    super.key,
    this.reposList,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    reposList!.sort((a, b) => b.updatedAt.compareTo(a.updatedAt),);
    return Scaffold(
      backgroundColor: ThemeApp.primaryColor,
      appBar: AppBar(
        title: Text(
          'Repositórios de ${user.login}',
          style: ThemeApp.titleRegularStyle.copyWith(
            color: ThemeApp.secondaryColor,
            fontSize: 18,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: ThemeApp.secondaryColor,
          ),
        ),
        backgroundColor: ThemeApp.primaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: reposList!.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: ThemeApp.secondaryColor,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          reposList![index].name,
                          overflow: TextOverflow.ellipsis,
                          style: ThemeApp.titleRegularStyle.copyWith(
                            color: ThemeApp.primaryColor,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          reposList![index].forked == false
                              ? Text(
                                  '${reposList![index].forks} forks',
                                  style: ThemeApp.titleRegularStyle.copyWith(
                                      color: ThemeApp.primaryColor,
                                      fontWeight: FontWeight.normal),
                                )
                              : Text(
                                  'Forked',
                                  style: ThemeApp.titleRegularStyle.copyWith(
                                      color: ThemeApp.primaryColor,
                                      fontWeight: FontWeight.normal),
                                ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            reposList![index].language,
                            style: ThemeApp.titleRegularStyle.copyWith(
                                color: ThemeApp.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  reposList![index].description != ''
                      ? Text(
                          reposList![index].description,
                          style: ThemeApp.titleRegularStyle.copyWith(
                              color: ThemeApp.primaryColor,
                              fontWeight: FontWeight.normal),
                        )
                      : Text(
                          'Sem descrição',
                          textAlign: TextAlign.start,
                          style: ThemeApp.titleRegularStyle.copyWith(
                              color: ThemeApp.primaryColor,
                              fontWeight: FontWeight.normal),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
