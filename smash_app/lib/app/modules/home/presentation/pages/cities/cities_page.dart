import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smash_app/app/modules/home/presentation/pages/cities/cities_controller.dart';
import 'package:smash_app/app/modules/home/presentation/widgets/item_list.dart';
import 'package:smash_app/app/modules/home/presentation/widgets/search_bar.dart';

class CitiesPage extends StatefulWidget {
  final String idCountry;

  const CitiesPage({
    super.key,
    required this.idCountry,
  });

  @override
  State<CitiesPage> createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {
  final _controller = Modular.get<CitiesController>();

  @override
  void initState() {
    _controller.fetchCities(widget.idCountry);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cidades",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SearchBar(
              onChanged: (value) {
                _controller.onChangedText(value);
                if (value.isEmpty) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _controller.store.rxCities,
                builder: (_, cities, child) {
                  if (_controller.store.hasError) {
                    return const Center(
                      child: Text("Falha ao buscar dados!"),
                    );
                  }

                  if (cities == null) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black45,
                      ),
                    );
                  }

                  if (cities.isEmpty) {
                    return const Center(
                      child: Text("Nenhuma cidade encontrada!"),
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: cities.length,
                          itemBuilder: (context, index) {
                            final city = cities[index];
                            return ItemList(
                              description: '${city.name} - ${city.state}',
                            );
                          },
                        ),
                      ),
                    ],
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
