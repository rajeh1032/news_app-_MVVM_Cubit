import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cubit_mvvm/model/my_category.dart';
import 'package:news_app_cubit_mvvm/ui/home/category_details/cubit/source_state.dart';
import 'package:news_app_cubit_mvvm/ui/home/category_details/cubit/source_view_model_cubit.dart';
import 'package:news_app_cubit_mvvm/ui/home/category_details/source_tab_widget.dart';
import 'package:news_app_cubit_mvvm/utils/app_colors.dart';
import 'package:news_app_cubit_mvvm/utils/app_styles.dart';

import 'package:provider/provider.dart';

class SourceDetails extends StatefulWidget {
  SourceDetails({required this.category});
  MyCategory category;
  @override
  State<SourceDetails> createState() => _SourceDetailsState();
}

class _SourceDetailsState extends State<SourceDetails> {
  SourceViewModelCubit viewmodel = SourceViewModelCubit();

  @override
  void initState() {
    super.initState();
    viewmodel.getSourcesL(widget.category.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          viewmodel, //todo: كدا هيسمع ال بروفيدر ف بااقي الشاشات

      //todo: استخدمت blocBuilder بناء ع ال state بتاعتي هنا مش ثابته و هتتغير مره loading ومره نص وزرار, اما لو ثابته زي شاشه login هنستخدم BlocListner
      child: BlocBuilder<SourceViewModelCubit, SourceState>(
          // bloc: viewmodel //todo: وبشيل ال blocProvider lمن فوق دا بععملو لو ال  provider مش هيسمع غير ع الاسكرينه دي بس
          builder: (context, state) {
        if (state is SourceLoadingState) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.greyColor,
          ));
        } else if (state is SourceErrorState) {
          return Center(
            child: Column(
              children: [
                Text(
                  state.message!,
                  style: AppStyles.medium16White
                      .copyWith(color: Theme.of(context).indicatorColor),
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    viewmodel.getSourcesL(widget.category.id ?? "");
                  },
                  child: Text("Try Again",
                      style: AppStyles.medium16White
                          .copyWith(color: Theme.of(context).indicatorColor)),
                ),
              ],
            ),
          );
        } else if (state is SourceSucessState) {
          return SourceTabWidget(
            sourceList: state.SourceList!,
          );
        }
        //un Reachable code
        return Container();
      }),
    );
  }
}
/*
 


Consumer: وظيفته إنه يستمع للتغييرات اللي بتحصل في الـ Provider ويعيد بناء (rebuild) الجزء المحدد من الـ UI عند حدوث أي تغيير في البيانات.

هو بيتيح لك استخدام البيانات من الـ Provider بدون الحاجة إلى Provider.of(context)، وبيساعدك تقلل من عدد الـ rebuilds غير الضرورية.

*/

/*

FutureBuilder هو Widget بيُستخدم لما يكون عندك بيانات هتجيلك من مصدر غير متزامن (Asynchronous)، زي API أو قاعدة بيانات، وعايز تعرض البيانات دي بعد ما توصل.

 FutureBuilder<SourceResponse?>(
        future: ApiManger.getSources(widget.category.id ?? ""),
        builder: (context, snapshot) {
          //todo:loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.greyColor,
            ));
          }
          //todo: error client
          else if (snapshot.hasError) {
            Text(
              "SomeThing went wrong",
              style: AppStyles.medium18Black,
            );
            ElevatedButton(
              onPressed: () {
                setState(() {
                  ApiManger.getSources(widget.category.id ?? "");
                });
              },
              child: Text(
                "Try Again",
                style: AppStyles.medium18Black,
              ),
            );
          }
          //todo: server => response (success , error)?
          //todo: 1- server => response error
          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(
                  snapshot.data!.message!,
                  style: AppStyles.medium18Black,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ApiManger.getSources(widget.category.id ?? "");
                      });
                    },
                    child: Text(
                      "Try Again",
                      style: AppStyles.medium18Black,
                    ))
              ],
            );
          }
          //todo: 2- server response successful
          var sourceList = snapshot.data?.sources ?? [];
          return SourceTabWidget(
            sourceList: sourceList,
          );
        });*/
