import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    super.key,
    required this.avatar,
    required this.firstName,
    required this.lastName,
    required this.email,
  });
  final String avatar;
  final String firstName;
  final String lastName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 117,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: Image.network(
                avatar,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Shimmer.fromColors(
                    baseColor: Colors.black54,
                    highlightColor: Colors.black45,
                    child: Container(
                      height: 80,
                      width: 80,
                      color: Colors.black45,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.black45,
                    child: const Icon(Icons.image_not_supported_outlined)),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: SizedBox(
                height: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          '$firstName $lastName',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 16,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        email,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        minFontSize: 10,
                        style: Theme.of(context).textTheme.labelSmall,
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
  }
}

class ArtikelCardWidgetLoading extends StatelessWidget {
  const ArtikelCardWidgetLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Row(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.black54,
              highlightColor: Colors.black45,
              child: Container(
                width: 80,
                height: 80,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: SizedBox(
                  height: double.maxFinite,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.black54,
                        highlightColor: Colors.black45,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(10)),
                          height: 10,
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.black54,
                        highlightColor: Colors.black45,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(10)),
                          height: 10,
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
