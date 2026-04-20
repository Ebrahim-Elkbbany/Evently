import 'package:evently/core/utils/extensions/context_extension.dart';
import 'package:evently/core/widgets/event_card.dart';
import 'package:evently/core/widgets/text_fields/custom_text_form_field.dart';
import 'package:evently/features/favourites/manager/favourites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextFormField(
                prefixIcon: Icons.search,
                hintText: context.lan.search_for_event,
                onChanged: (query) {
                  context.read<FavouritesProvider>().searchFavourites(query);
                },
              ),
            ),
            Expanded(
              child: Consumer<FavouritesProvider>(
                builder: (context, favouritesProvider, child) {
                  if (favouritesProvider.favouriteViewState ==
                      FavouritesViewState.loading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: context.customColors.primary,
                      ),
                    );
                  } else if (favouritesProvider.favouriteViewState ==
                      FavouritesViewState.failure) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          favouritesProvider.errorMessage ??
                              context.lan.somethingWentWrong,
                        ),
                      ),
                    );
                  } else if (favouritesProvider.favouriteEvents.isEmpty) {
                    return Center(
                      child: Text(
                        context.lan.no_favourite_events_yet,
                        style: context.textTheme.titleMedium,
                      ),
                    );
                  } else if (favouritesProvider
                      .displayedFavouriteEvents
                      .isEmpty) {
                    return Center(
                      child: Text(
                        context.lan.no_events_found,
                        style: context.textTheme.titleMedium,
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) => EventCard(
                      event: favouritesProvider.displayedFavouriteEvents[index],
                    ),
                    separatorBuilder: (context, index) => context.gapH(16),
                    itemCount:
                        favouritesProvider.displayedFavouriteEvents.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
