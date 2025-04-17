import 'package:flutter/material.dart';

class GridImageContainer extends StatelessWidget {
  const GridImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        'https://s3-alpha-sig.figma.com/img/17fc/dc52/d335fdb1f2d30661509eee0a7256e306?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=CMdsZUCB-jFQUxPl7t9u-1i0FZAl7npOjVjqfp-aZiFVVLY5Fv4e2oz4ueXZ7idU1h7udpoILWeDLoJVWX9xWcRPoqFStFIf2738U01EP1cVyrthdJq~x8U16K5PgKpJYTCqrvCgt~0JMG0QFs5jpl~IIdxg4JdMQ~fjKmxe8dY0SFaTFTvcEf1YdkqqaKmrx9SBImAsxG~wJavnqd45zhsjMn1gO7qKI5x66iFBempj2SbZtxg5PG9oRFvS44vmoqp5kk2l6St4Ixeo0qi7zJsa6flPCX06xrgxthluHEM2Z4K8WjMowtD27NBYK2Az36zgOpCOJ2WkvfX37BAD3w__',
      ),
    );
  }
}
