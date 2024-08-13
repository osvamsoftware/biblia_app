import 'package:biblia_app/data/book_model.dart';
import 'package:biblia_app/ui/global_book/cubit/global_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CollectionListScreen extends StatelessWidget {
  static const path = "/collection";

  const CollectionListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBookCubit, GlobalBookState>(
      builder: (context, booksState) {
        return Scaffold(
            appBar: AppBar(title: const Text('Colección de Libros')),
            body: Stack(
              children: [
                Container(color: Colors.orange.withOpacity(.2)),
                ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: booksState.currentCollection.length,
                  itemBuilder: (context, index) {
                    final book = booksState.currentCollection[index];
                    return ListTile(
                      title: Text(
                        "${book.nombre} - ${book.info?.enIvri ?? "--"}",
                        style: const TextStyle(fontFamily: 'Papyrus', fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        context.read<GlobalBookCubit>().setBook(index);
                        context.push(BookDetailScreen.path);
                      },
                    );
                  },
                ),
              ],
            ));
      },
    );
  }
}

class BookDetailScreen extends StatefulWidget {
  static const path = '/book-details';

  BookDetailScreen();

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  final TextEditingController _chapterController = TextEditingController();

  @override
  void initState() {
    context.read<GlobalBookCubit>().setChapter(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BlocBuilder<GlobalBookCubit, GlobalBookState>(
      builder: (context, state) {
        final captulo = state.currentCollection[state.currentIndexBook ?? 0]
                .captulos?[state.currentIndexChapter.toString()]?.entries ??
            [];

        // Ordenar los versículos por la llave (número de versículo)
        final sortedVerses = captulo.toList()..sort((a, b) => int.parse(a.key).compareTo(int.parse(b.key)));

        return Scaffold(
          appBar: AppBar(
            title: Text(state.currentCollection[state.currentIndexBook ?? 0].nombre ?? 'Libro'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back), // Ícono de la flecha
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              SizedBox(
                width: 100,
                child: TextField(
                  controller: _chapterController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Capítulo',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                  onSubmitted: (value) {
                    final int? chapter = int.tryParse(value);
                    if (chapter != null &&
                        state.currentCollection[state.currentIndexBook ?? 0].captulos
                                ?.containsKey(chapter.toString()) ==
                            true) {
                      context.read<GlobalBookCubit>().setChapter(chapter);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Capítulo no encontrado')),
                      );
                    }
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  final int? chapter = int.tryParse(_chapterController.text);
                  if (chapter != null &&
                      state.currentCollection[state.currentIndexBook ?? 0].captulos?.containsKey(chapter.toString()) ==
                          true) {
                    context.read<GlobalBookCubit>().setChapter(chapter);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Capítulo no encontrado')),
                    );
                  }
                },
              ),
            ],
          ),
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Opacity(
                  opacity: isDarkMode ? 0.1 : 0.5,
                  child: Image.asset(
                    'assets/images/pap_background.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListView(padding: const EdgeInsets.all(16.0), children: [
                if (state.currentIndexChapter == 1)
                  Column(
                    children: [
                      Text(
                        state.currentCollection[state.currentIndexBook ?? 0].info?.enIvri ?? 'Libro',
                        style: const TextStyle(
                          fontFamily: 'Papyrus',
                          fontSize: 36,
                        ),
                      ),
                      Text(
                        "Español:  ${state.currentCollection[state.currentIndexBook ?? 0].info?.espaol ?? 'Libro'}",
                        style: const TextStyle(fontFamily: 'Papyrus', fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "Significado: ${state.currentCollection[state.currentIndexBook ?? 0].info?.significado ?? 'Libro'}",
                          style: const TextStyle(fontFamily: 'Papyrus', fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text('Capítulo: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        )),
                    Text(
                      state.currentIndexChapter.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                  ],
                ),
                ...(sortedVerses).map((entry) {
                  Captulo verse = entry.value;
                  final referencias_invertidas = verse.referencias?.reversed.toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(entry.key,
                          style: const TextStyle(fontFamily: 'Papyrus', fontSize: 22, fontWeight: FontWeight.bold)),
                      SelectableText(
                        removeInitialCharacters(verse.texto ?? ''),
                        style: const TextStyle(fontSize: 18),
                      ),
                      if (verse.referencias != null && referencias_invertidas!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: verse.referencias!
                                .map((ref) => SelectableText(
                                      'Ref: $ref',
                                      style: const TextStyle(color: Colors.grey),
                                    ))
                                .toList(),
                          ),
                        ),
                      const SizedBox(height: 16.0), // Espacio entre versículos
                    ],
                  );
                }),
              ]),
              Positioned(
                bottom: 30,
                right: 30,
                child: SizedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      (state.currentCollection[state.currentIndexBook ?? 0]
                                  .captulos?[((state.currentIndexChapter ?? 0) - 1).toString()]?.isNotEmpty ??
                              false)
                          ? IconButton(
                              onPressed: () {
                                context.read<GlobalBookCubit>().setChapter((state.currentIndexChapter ?? 0) - 1);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              style: IconButton.styleFrom(backgroundColor: Colors.orange.shade400),
                            )
                          : const SizedBox(),
                      (state.currentCollection[state.currentIndexBook ?? 0]
                                  .captulos?[((state.currentIndexChapter ?? 0) + 1).toString()]?.isNotEmpty ??
                              false)
                          ? IconButton(
                              onPressed: () {
                                context.read<GlobalBookCubit>().setChapter((state.currentIndexChapter ?? 0) + 1);
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                              style: IconButton.styleFrom(backgroundColor: Colors.orange.shade400),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

String removeInitialCharacters(String input) {
  List<String> parts = input.split(' ');
  return parts.sublist(1).join(' ');
}
