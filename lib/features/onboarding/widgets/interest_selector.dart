import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maasters/core/core.dart';
import 'package:maasters/features/features.dart';

class InterestSelector extends StatelessWidget {
  const InterestSelector({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.medium),
          ),
          icon: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              child: Icon(
                Icons.close,
                color: context.colorScheme.primary,
              ),
              onTap: () => Navigator.of(context).pop(),
            ),
          ),
          content: Builder(
            builder: (context) => SizedBox(
              width: constraints.maxWidth > Resolutions.mobileMaxWidth
                  ? context.width * 0.7
                  : context.width * 0.7,
              height: constraints.maxWidth > Resolutions.mobileMaxWidth
                  ? context.height * 0.5
                  : context.height * 0.7,
              child: SingleChildScrollView(
                child: BlocBuilder<OnboardingCubit, OnboardingState>(
                  builder: (context, state) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: SpecificInterest.values.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: constraints.maxWidth >
                                    Resolutions.mobileMaxWidth
                                ? 3
                                : 1,
                            crossAxisSpacing: Dimens.small,
                            mainAxisSpacing: Dimens.small,
                            childAspectRatio: constraints.maxWidth >
                                    Resolutions.mobileMaxWidth
                                ? context.width / (context.height / 4)
                                : context.width / (context.height / 8),
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Dimens.small),
                                  border: Border.all(
                                    color: state.user.areasOfInterest.contains(
                                      SpecificInterest.values[index],
                                    )
                                        ? context.colorScheme.primary
                                        : context.colorScheme.inputBorder,
                                    width: state.user.areasOfInterest.contains(
                                      SpecificInterest.values[index],
                                    )
                                        ? 2
                                        : 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: Dimens.small,
                                      ),
                                      child: Image.asset(
                                        SpecificInterest.values[index]
                                            .specificInterestAreaImage(
                                          SpecificInterest.values[index],
                                          isMobile: constraints.maxWidth <
                                              Resolutions.mobileMaxWidth,
                                        ),
                                        width: Dimens.large,
                                        height: Dimens.large,
                                        color:
                                            state.user.areasOfInterest.contains(
                                          SpecificInterest.values[index],
                                        )
                                                ? context.colorScheme.primary
                                                : context.colorScheme.hintText,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        SpecificInterest.values[index].name,
                                        style: context.textTheme.bodySmall!
                                            .copyWith(
                                          color: state.user.areasOfInterest
                                                  .contains(
                                            SpecificInterest.values[index],
                                          )
                                              ? context.colorScheme.primary
                                              : context.colorScheme.hintText,
                                          fontWeight: state.user.areasOfInterest
                                                  .contains(
                                            SpecificInterest.values[index],
                                          )
                                              ? FontWeight.w600
                                              : FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Image.asset(
                                      SpecificInterest.values[index]
                                          .specificInterestAreaImage(
                                        SpecificInterest.values[index],
                                        isMobile: constraints.maxWidth <
                                            Resolutions.mobileMaxWidth,
                                      ),
                                      width: Dimens.large,
                                      height: Dimens.large,
                                      color: Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                if (state.user.areasOfInterest
                                    .contains(SpecificInterest.values[index])) {
                                  context
                                      .read<OnboardingCubit>()
                                      .removeAreaOfInterest(
                                        SpecificInterest.values[index],
                                      );
                                } else {
                                  context
                                      .read<OnboardingCubit>()
                                      .validateFourthFormPage(
                                        areasOfInterest:
                                            SpecificInterest.values[index],
                                      );
                                }
                              },
                            );
                          },
                        ),
                        const SizedBox(height: Dimens.xxLarge),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(
            Dimens.xLarge,
            Dimens.large,
            Dimens.xLarge,
            0,
          ),
        );
      },
    );
  }
}
