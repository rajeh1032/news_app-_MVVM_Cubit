import 'package:flutter/material.dart';
import 'package:news_app_cubit_mvvm/model/my_category.dart';
import 'package:news_app_cubit_mvvm/ui/home/category_details/source_tab_widget.dart';
import 'package:news_app_cubit_mvvm/ui/home/category_details/source_view_model_provider.dart';
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
  SourceViewModelProvider viewModel = SourceViewModelProvider();
  @override
  void initState() {
    super.initState();
    viewModel.getSourcesL(widget.category.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SourceViewModelProvider>(
          builder: (context, viewModel, child) {
        if (viewModel.errorMessage != null) {
          //todo: error form server
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  viewModel.errorMessage!,
                  style: AppStyles.medium16Black
                      .copyWith(color: Theme.of(context).indicatorColor),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getSourcesL(widget.category.id ?? "");
                  },
                  child: Text(
                    "Try Again",
                    style: AppStyles.medium18Black
                        .copyWith(color: Theme.of(context).indicatorColor),
                  ),
                )
              ],
            ),
          );
        }

        if (viewModel.sourcesList == null) {
          //todo: loading
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.greyColor,
          ));
        }
        //todo: i have data

        return SourceTabWidget(sourceList: viewModel.sourcesList!);
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