import 'package:flutter/material.dart';
import 'package:github_tracker/app/pages/home_page.dart';
import 'package:github_tracker/app/pages/repos_page.dart';
import 'package:github_tracker/app/repositories/user/user_repository_impl.dart';
import 'package:github_tracker/app/utils/theme_app.dart';

import '../models/user.dart';
import '../widgets/profile_item_description.dart';

class UserPage extends StatelessWidget {
  final User user;

  const UserPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeApp.primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            backgroundColor: ThemeApp.primaryColor,
            expandedHeight: 300.0,
            stretchTriggerOffset: 100.0,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: ThemeApp.secondaryColor,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(user.avatarUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black87,
                      Colors.black38,
                      Colors.black12,
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: user.name != '',
                        replacement: const SizedBox.shrink(),
                        child: Text(
                          user.name,
                          style: ThemeApp.titleRegularStyle.copyWith(
                            color: ThemeApp.secondaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '@${user.login}',
                        style: ThemeApp.titleRegularStyle.copyWith(
                          color: ThemeApp.secondaryColor,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ],
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 30,
              ),
              child: Column(
                children: [
                  Visibility(
                    visible: user.bio != '',
                    replacement: const SizedBox.shrink(),
                    child: Text(
                      user.bio,
                      textAlign: TextAlign.center,
                      style: ThemeApp.titleRegularStyle.copyWith(
                        color: ThemeApp.secondaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.people_alt_rounded,
                        size: 20,
                        color: ThemeApp.secondaryColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '${user.following} following',
                        style: ThemeApp.titleRegularStyle.copyWith(
                          color: ThemeApp.secondaryColor,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Icon(
                        Icons.circle,
                        size: 4,
                        color: ThemeApp.secondaryColor,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '${user.followers} followers',
                        style: ThemeApp.titleRegularStyle.copyWith(
                          color: ThemeApp.secondaryColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: user.location != '',
                    replacement: const SizedBox.shrink(),
                    child: ProfileItemDescription(
                      icon: Icons.location_on_rounded,
                      text: user.location,
                    ),
                  ),
                  Visibility(
                    visible: user.email != '',
                    replacement: const SizedBox.shrink(),
                    child: ProfileItemDescription(
                      icon: Icons.email,
                      text: user.email,
                    ),
                  ),
                  Visibility(
                    visible: user.company != '',
                    replacement: const SizedBox.shrink(),
                    child: ProfileItemDescription(
                      icon: Icons.business_outlined,
                      text: user.company,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Visibility(
                    visible: user.publicRepos != 0,
                    replacement: const SizedBox.shrink(),
                    child: ElevatedButton(
                      onPressed: () async {
                        final repos =
                            await UserRepositoryImpl().getRepos(user.login);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReposPage(
                              reposList: repos,
                              user: user,
                            ),
                          ),
                        );
                      },
                      child: Text('${user.publicRepos} repositórios públicos'),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
