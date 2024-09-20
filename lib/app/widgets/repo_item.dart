import 'package:flutter/material.dart';

import '../models/repos.dart';
import '../utils/theme_app.dart';

class RepoItem extends StatelessWidget {
  final Repos repo;
  const RepoItem({
    super.key,
    required this.repo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      margin: const EdgeInsets.only(top: 16),
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
                  repo.name,
                  overflow: TextOverflow.ellipsis,
                  style: ThemeApp.titleRegularStyle.copyWith(
                    color: ThemeApp.primaryColor,
                  ),
                ),
              ),
              Row(
                children: [
                  repo.forked == false
                      ? Text(
                          '${repo.forks} forks',
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
                    repo.language,
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
          repo.description != ''
              ? Text(
                  repo.description,
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
  }
}