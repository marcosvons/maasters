import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //route to Homepage
  static Route<dynamic> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          unauthenticated: (_) {
            Navigator.of(context)
                .pushReplacement<void, void>(SignUpPage.route());
          },
        );
      },
      child: LayoutBuilder(
        builder: (context, boxConstraints) {
          return Scaffold(
            appBar: boxConstraints.maxWidth > Resolutions.mobileMaxWidth
                ? PreferredSize(
                    preferredSize: Size.fromHeight(context.height * 0.1),
                    child: const Header(),
                  )
                : null,
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: LayoutBuilder(
                    builder: (context, boxConstraints) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bienvenido 👋🏼',
                              style: boxConstraints.maxWidth >
                                      Resolutions.mobileMaxWidth
                                  ? context.textTheme.displayLarge
                                  : context.textTheme.displayMedium,
                            ),
                            const SizedBox(height: Dimens.large),
                            Text(
                              'Encontrá al mentor/a que necesitás. Podés buscar por nombre o por distintos filtros de busqueda.',
                              style: context.textTheme.bodyMedium,
                            ),
                            const SizedBox(height: Dimens.xxLarge),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: context.width * 0.4,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      prefixIcon: SvgPicture.asset(
                                        boxConstraints.maxWidth >
                                                Resolutions.mobileMaxWidth
                                            ? AppIcons.search
                                            : AppIcons.searchMobile,
                                        color: context.colorScheme.primary,
                                      ),
                                      prefixIconConstraints:
                                          const BoxConstraints(
                                        maxHeight: Dimens.large,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          Dimens.xSmall,
                                        ),
                                        borderSide: BorderSide(
                                          color:
                                              context.colorScheme.inputBorder,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          Dimens.xSmall,
                                        ),
                                        borderSide: BorderSide(
                                          color: context.colorScheme.primary,
                                          width: 2,
                                        ),
                                      ),
                                      hintText: 'Buscar mentores',
                                      hintStyle:
                                          context.textTheme.bodySmall!.copyWith(
                                        color: context.colorScheme.surface,
                                      ),
                                    ),
                                    onChanged: (value) =>
                                        context.read<MentorshipsBloc>().add(
                                              MentorshipsEvent.searchMentors(
                                                query: value,
                                              ),
                                            ),
                                  ),
                                ),
                                const SizedBox(width: Dimens.xLarge),
                                Container(
                                  padding: const EdgeInsets.all(Dimens.medium),
                                  width: context.width * 0.15,
                                  decoration: BoxDecoration(
                                    color: context
                                        .colorScheme.filterBackgroundColor,
                                    borderRadius: BorderRadius.circular(
                                      Dimens.xSmall,
                                    ),
                                    border: Border.all(
                                      color: context.colorScheme.primary,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Filtros avanzados',
                                        style: context.textTheme.bodySmall!
                                            .copyWith(
                                          color: context.colorScheme.primary,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: Dimens.small,
                                      ),
                                      SvgPicture.asset(
                                        AppIcons.filter,
                                        color: context.colorScheme.primary,
                                        height: Dimens.medium,
                                        width: Dimens.medium,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: Dimens.xxLarge),
                            _HomePageBody(
                              boxConstraints: boxConstraints,
                            ),
                            GestureDetector(
                              child: const Text('Logout'),
                              onTap: () => context
                                  .read<AuthBloc>()
                                  .add(const AuthEvent.logoutRequested()),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({
    required this.boxConstraints,
  });

  final BoxConstraints boxConstraints;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MentorshipsBloc, MentorshipsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(
            child: Text('Initial'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (mentorList, searchedMentors) {
            if (searchedMentors.length == mentorList.length) {
              return _MentorsList(
                mentors: mentorList,
                boxConstraints: boxConstraints,
              );
            } else {
              return _MentorsList(
                mentors: searchedMentors,
                boxConstraints: boxConstraints,
              );
            }
          },
          error: () => Center(
            child: Container(
              color: Colors.red,
              width: context.width,
              height: context.height,
            ),
          ),
        );
      },
    );
  }
}

class _MentorsList extends StatelessWidget {
  const _MentorsList({
    required this.mentors,
    required this.boxConstraints,
  });

  final List<User> mentors;
  final BoxConstraints boxConstraints;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.8,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: mentors.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              boxConstraints.maxWidth > Resolutions.mobileMaxWidth ? 3 : 1,
          crossAxisSpacing: Dimens.xLarge,
          mainAxisSpacing: Dimens.xLarge,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.colorScheme.inputBorder,
              ),
              color: context.colorScheme.secondary,
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.tertiary.withOpacity(0.1),
                  blurRadius: Dimens.small,
                  offset: const Offset(
                    0,
                    Dimens.xSmall,
                  ),
                ),
              ],
              borderRadius: BorderRadius.circular(
                Dimens.xSmall,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                Dimens.small,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    child: mentors[index].photoUrl.isNotEmpty
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimens.xSmall,
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                  mentors[index].photoUrl,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: context.height * 0.15,
                            width: context.width * 0.175,
                          )
                        : SizedBox(
                            height: context.height * 0.15,
                            width: context.width * 0.175,
                            child: SvgPicture.asset(AppIcons.noProfileImage),
                          ),
                  ),
                  const SizedBox(
                    height: Dimens.medium,
                  ),
                  Text(
                    '${mentors[index].firstName} ${mentors[index].lastName}',
                    style: context.textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: Dimens.small,
                  ),
                  _MentorInformation(
                    text:
                        '${mentors[index].title} en ${mentors[index].companyOrSchool}',
                    icon: AppIcons.job,
                  ),
                  const SizedBox(
                    height: Dimens.medium,
                  ),
                  _MentorInformation(
                    text: mentors[index].yearsOfProfesionalExperience > 1
                        ? '${mentors[index].yearsOfProfesionalExperience} años de experiencia'
                        : '${mentors[index].yearsOfProfesionalExperience} año de experiencia',
                    icon: AppIcons.experience,
                  ),
                  const SizedBox(
                    height: Dimens.medium,
                  ),
                  _MentorInformation(
                    text: mentors[index]
                        .areasOfInterest
                        .map(
                          (interest) => interest.name,
                        )
                        .join(', '),
                    icon: AppIcons.title,
                  ),
                  const SizedBox(
                    height: Dimens.large,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.colorScheme.filterBackgroundColor,
                        borderRadius: BorderRadius.circular(
                          Dimens.xSmall,
                        ),
                      ),
                      padding: const EdgeInsets.all(
                        Dimens.small,
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                text: 'Disponible para',
                                style: context.textTheme.bodySmall!.copyWith(
                                  color: context.colorScheme.surfaceTint,
                                ),
                                children: [
                                  const TextSpan(
                                    text: ' ',
                                  ),
                                  TextSpan(
                                    text: 'Sesion de mentoría',
                                    style:
                                        context.textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: Dimens.small,
                          ),
                          SizedBox(
                            width: context.width * 0.05,
                            height: context.height * 0.05,
                            child: ElevatedButton(
                              child: Text(
                                'Más',
                                style: context.textTheme.bodySmall!.copyWith(
                                  color: context.colorScheme.secondary,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MentorInformation extends StatelessWidget {
  const _MentorInformation({
    required this.text,
    required this.icon,
  });

  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          icon,
          width: Dimens.medium,
          height: Dimens.medium,
        ),
        const SizedBox(
          width: Dimens.small,
        ),
        Expanded(
          child: Text(
            text,
            style: context.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
