import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:national_geography_app/src/core/extensions/context_theme.dart';
import 'package:national_geography_app/src/features/detail/presentation/screen/detail_screen.dart';
import 'package:national_geography_app/src/features/home/presentation/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    BlocProvider.of<HomeBloc>(context).add(GetWildAnimalsEvent());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            text: 'EXPLORE\n',
            style: context.textTheme.headlineMedium,
            children: <InlineSpan>[
              TextSpan(
                text: "The Wildlife",
                style: context.textTheme.headlineSmall!.copyWith(color: Colors.blueGrey),
              ),
            ],
          ),
        ),
        actions: const <Widget>[
          CircleAvatar(
            child: Icon(Icons.person),
          ),
          SizedBox(width: 15),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(9),
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeSuccess) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.data.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                model: state.data[index],
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(state.data[index].image),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                state.data[index].title,
                                style: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                state.data[index].story,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (state is HomeFailure) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator.adaptive());
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: double.infinity,
            child: RotatedBox(
              quarterTurns: 45,
              child: TabBar(
                onTap: (index) {},
                // padding: const EdgeInsets.only(bottom: 5),
                controller: _tabController,
                isScrollable: true,
                tabs: const <Tab>[
                  Tab(text: "WILDLIFE"),
                  Tab(text: "MAGAZINE"),
                  Tab(text: "CHANNEL"),
                  Tab(text: "ENIRONMENT"),
                  Tab(text: "HISTORY&CULTURE"),
                  Tab(icon: Icon(Icons.grid_view_rounded)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
