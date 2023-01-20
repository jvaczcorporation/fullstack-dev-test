import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smash_app/app/modules/home/presentation/pages/countries/countries_controller.dart';
import 'package:smash_app/app/modules/home/presentation/widgets/item_list.dart';
import 'package:smash_app/app/modules/home/presentation/widgets/search_bar.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({super.key});

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  final _controller = Modular.get<CountriesController>();

  @override
  void initState() {
    _controller.fetchCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Países",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
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
                valueListenable: _controller.store.rxCountries,
                builder: (_, countries, child) {
                  if (_controller.store.hasError) {
                    return const Center(
                      child: Text("Falha ao buscar dados!"),
                    );
                  }

                  if (countries == null) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black45,
                      ),
                    );
                  }

                  if (countries.isEmpty) {
                    return const Center(
                      child: Text("Nenhum país encontrado!"),
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: countries.length,
                          itemBuilder: (context, index) {
                            final country = countries[index];
                            return ItemList(
                              description: country.name,
                              onTap: () =>
                                  _controller.navigateToCities(country.id),
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
