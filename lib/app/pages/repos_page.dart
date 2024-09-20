import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_tracker/app/pages/repos_bloc/repos_bloc.dart';
import 'package:github_tracker/app/utils/theme_app.dart';

import '../widgets/repo_item.dart';

class ReposPage extends StatelessWidget {
  static const String routeName = '/user_repos';
  final String urlRepos;

  const ReposPage({
    super.key,
    required this.urlRepos,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            ReposBloc()..add(GetReposEvent(urlRepos: urlRepos)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Public Repos',
              style: ThemeApp.titleLargeStyle,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: ThemeApp.secondaryColor,
              ),
            ),
            backgroundColor: ThemeApp.primaryColor,
            elevation: 0,
          ),
          backgroundColor: ThemeApp.primaryColor,
          body: BlocConsumer<ReposBloc, ReposState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ReposInitialState) {
                return const Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: ThemeApp.secondaryColor,
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is ReposStateData) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: ListView.builder(
                    itemCount: state.repos.length,
                    itemBuilder: (context, index) {
                      return RepoItem(
                        repo: state.repos[index],
                      );
                    },
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      );
}
