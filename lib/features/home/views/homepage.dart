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
      child: BlocBuilder<MentorshipsBloc, MentorshipsState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Center(
              child: GestureDetector(
                child: const Text('Logout'),
                onTap: () => context.read<MentorshipsBloc>().add(
                      MentorshipsEvent.getMentors(
                        interest: context
                            .read<AuthBloc>()
                            .state
                            .user!
                            .areasOfInterest,
                      ),
                    ),
              ),
            ),
            error: () => Center(
              child: GestureDetector(
                child: const Text('Error'),
                onTap: () => context
                    .read<AuthBloc>()
                    .add(const AuthEvent.logoutRequested()),
              ),
            ),
            loaded: (mentors) => LayoutBuilder(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                              color:
                                                  context.colorScheme.primary,
                                            ),
                                            prefixIconConstraints:
                                                const BoxConstraints(
                                              maxHeight: Dimens.large,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                Dimens.xSmall,
                                              ),
                                              borderSide: BorderSide(
                                                color: context
                                                    .colorScheme.inputBorder,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                Dimens.xSmall,
                                              ),
                                              borderSide: BorderSide(
                                                color:
                                                    context.colorScheme.primary,
                                                width: 2,
                                              ),
                                            ),
                                            hintText: 'Buscar mentores',
                                            hintStyle: context
                                                .textTheme.bodySmall!
                                                .copyWith(
                                              color:
                                                  context.colorScheme.surface,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: Dimens.xLarge),
                                      Container(
                                        padding:
                                            const EdgeInsets.all(Dimens.medium),
                                        width: context.width * 0.15,
                                        decoration: BoxDecoration(
                                          color: context.colorScheme
                                              .filterBackgroundColor,
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
                                              style: context
                                                  .textTheme.bodySmall!
                                                  .copyWith(
                                                color:
                                                    context.colorScheme.primary,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: Dimens.small,
                                            ),
                                            SvgPicture.asset(
                                              AppIcons.filter,
                                              color:
                                                  context.colorScheme.primary,
                                              height: Dimens.medium,
                                              width: Dimens.medium,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: Dimens.xxLarge),
                                  SizedBox(
                                    width: context.width * 0.8,
                                    child: GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: mentors.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            boxConstraints.maxWidth >
                                                    Resolutions.mobileMaxWidth
                                                ? 3
                                                : 1,
                                        crossAxisSpacing: Dimens.xLarge,
                                        mainAxisSpacing: Dimens.xLarge,
                                        childAspectRatio: 0.75,
                                      ),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: context
                                                  .colorScheme.inputBorder,
                                            ),
                                            color:
                                                context.colorScheme.secondary,
                                            boxShadow: [
                                              BoxShadow(
                                                color: context
                                                    .colorScheme.tertiary
                                                    .withOpacity(0.1),
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  child: SizedBox(
                                                    height:
                                                        context.height * 0.15,
                                                    width: context.width * 0.15,
                                                    child: Image.network(
                                                      mentors[index].photoUrl,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: Dimens.medium,
                                                ),
                                                Text(
                                                  '${mentors[index].firstName} ${mentors[index].lastName}',
                                                ),
                                                const SizedBox(
                                                  height: Dimens.small,
                                                ),
                                                Text(
                                                  '${mentors[index].title} en ${mentors[index].companyOrSchool}',
                                                ),
                                                const SizedBox(
                                                  height: Dimens.medium,
                                                ),
                                                Text(
                                                  '${mentors[index].yearsOfProfesionalExperience} años de experiencia',
                                                ),
                                                const SizedBox(
                                                  height: Dimens.medium,
                                                ),
                                                Text(
                                                  mentors[index]
                                                      .areasOfInterest
                                                      .join(', '),
                                                ),
                                                const SizedBox(
                                                  height: Dimens.large,
                                                ),
                                                ElevatedButton(
                                                  child: const Text('Ver más'),
                                                  onPressed: () {},
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
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
        },
      ),
    );
  }
}
