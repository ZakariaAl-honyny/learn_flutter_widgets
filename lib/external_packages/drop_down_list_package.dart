import 'package:flutter/material.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
// import 'package:flutter/material.dart';
// import 'constants.dart';

class DropDownListPackage extends StatefulWidget {
  const DropDownListPackage({super.key});

  @override
  State<DropDownListPackage> createState() => _DropDownListPackageState();
}

class _DropDownListPackageState extends State<DropDownListPackage> {
  /// This is list of city which will pass to the drop down
  final List<SelectedListItem<String>> _listOfCities = [
    SelectedListItem<String>(data: 'Tokyo'),
    SelectedListItem<String>(data: 'New York'),
    SelectedListItem<String>(data: 'London'),
    SelectedListItem<String>(data: 'Paris'),
    SelectedListItem<String>(data: 'Madrid'),
    SelectedListItem<String>(data: 'Dubai'),
    SelectedListItem<String>(data: 'Rome'),
    SelectedListItem<String>(data: 'Barcelona'),
    SelectedListItem<String>(data: 'Cologne'),
    SelectedListItem<String>(data: 'Monte Carlo'),
    SelectedListItem<String>(data: 'Puebla'),
    SelectedListItem<String>(data: 'Florence'),
  ];

  /// This is list of language with custom model which will pass to the drop down
  final List<SelectedListItem<LanguageModel>> _listOfLanguages = [
    SelectedListItem<LanguageModel>(
      data: LanguageModel(name: 'English', code: 'en'),
    ),
    SelectedListItem<LanguageModel>(
      data: LanguageModel(name: 'Spanish', code: 'es'),
    ),
    SelectedListItem<LanguageModel>(
      data: LanguageModel(name: 'French', code: 'fr'),
    ),
    SelectedListItem<LanguageModel>(
      data: LanguageModel(name: 'German', code: 'de'),
    ),
    SelectedListItem<LanguageModel>(
      data: LanguageModel(name: 'Chinese', code: 'zh'),
    ),
    SelectedListItem<LanguageModel>(
      data: LanguageModel(name: 'Hindi', code: 'hi'),
    ),
    SelectedListItem<LanguageModel>(
      data: LanguageModel(name: 'Arabic', code: 'ar'),
    ),
    SelectedListItem<LanguageModel>(
      data: LanguageModel(name: 'Russian', code: 'ru'),
    ),
    SelectedListItem<LanguageModel>(
      data: LanguageModel(name: 'Japanese', code: 'ja'),
    ),
    SelectedListItem<LanguageModel>(
      data: LanguageModel(name: 'Portuguese', code: 'pt'),
    ),
    SelectedListItem<LanguageModel>(
      data: LanguageModel(name: 'Italian', code: 'it'),
    ),
    SelectedListItem<LanguageModel>(
      data: LanguageModel(name: 'Korean', code: 'ko'),
    ),
  ];

  /// This is register text field controllers
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _cityTextEditingController =
      TextEditingController();
  final TextEditingController _languageTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _cityTextEditingController.dispose();
    _languageTextEditingController.dispose();
    _passwordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              const Text(
                'Register',
                style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15.0),
              AppTextField(
                textEditingController: _nameTextEditingController,
                title: 'Name',
                hint: 'Enter Your Name',
              ),
              AppTextField(
                textEditingController: _emailTextEditingController,
                title: 'Email',
                hint: 'Enter Your Email',
              ),
              AppTextField(
                textEditingController: _cityTextEditingController,
                title: 'City',
                hint: 'Choose Your City',
                isReadOnly: true,
                onTextFieldTap: onCityTextFieldTap,
              ),
              AppTextField(
                textEditingController: _languageTextEditingController,
                title: 'Language',
                hint: 'Choose Your Language',
                isReadOnly: true,
                onTextFieldTap: onLanguageTextFieldTap,
              ),
              AppTextField(
                textEditingController: _passwordTextEditingController,
                title: 'Password',
                hint: 'Add Your Password',
                isReadOnly: false,
              ),
              const SizedBox(height: 15.0),
              const AppElevatedButton(),
            ],
          ),
        ),
      ),
    );
  }

  /// Handles the text field tap for the city
  void onCityTextFieldTap() {
    DropDownState<String>(
      dropDown: DropDown<String>(
        isDismissible: true,
        bottomSheetTitle: const Text(
          'Cities',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        submitButtonText: 'Save',
        clearButtonText: 'Clear',
        data: _listOfCities,
        onSelected: (selectedItems) {
          List<String> list = [];
          for (var item in selectedItems) {
            _cityTextEditingController.text = item.data;
            list.add(item.data);
          }
          showSnackBar(list.toString());
        },
        enableMultipleSelection: false,
        maxSelectedItems: 3,
      ),
    ).showModal(context);
  }

  /// Handles the text field tap for the language
  void onLanguageTextFieldTap() {
    DropDownState<LanguageModel>(
      dropDown: DropDown<LanguageModel>(
        isDismissible: true,
        bottomSheetTitle: const Text(
          'Languages',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        submitButtonText: 'Save',
        clearButtonText: 'Clear',
        data: _listOfLanguages,
        listItemBuilder: (index, dataItem) {
          return Text('${dataItem.data.name} : ${dataItem.data.code}');
        },
        onSelected: (selectedItems) {
          List<String> list = [];
          for (var item in selectedItems) {
            list.add('${item.data.name} : ${item.data.code}');
          }
          
          if (list.isNotEmpty) {
            _languageTextEditingController.text = list.toString();
          } else {
            _languageTextEditingController.clear();
          }

          showSnackBar(list.toString());
        },
        searchDelegate: (query, dataItems) {
          return dataItems
              .where(
                (item) =>
                    item.data.name.toLowerCase().contains(
                      query.toLowerCase(),
                    ) ||
                    item.data.code.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
        },
        enableMultipleSelection: true,
        maxSelectedItems: 3,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

/// This is Common App text field class
class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isReadOnly;
  final VoidCallback? onTextFieldTap;

  const AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    this.isReadOnly = false,
    this.onTextFieldTap,
    super.key,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        const SizedBox(height: 5.0),
        TextFormField(
          controller: widget.textEditingController,
          cursorColor: Colors.black,
          readOnly: widget.isReadOnly,
          onTap:
              widget.isReadOnly
                  ? () {
                    FocusScope.of(context).unfocus();
                    widget.onTextFieldTap?.call();
                  }
                  : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12,
            contentPadding: const EdgeInsets.only(
              left: 8,
              bottom: 0,
              top: 0,
              right: 15,
            ),
            hintText: widget.hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}

/// This is common class for 'REGISTER' elevated button
class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(70, 76, 222, 1),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        child: const Text(
          'REGISTER',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

/// This is custom model class which we will use in drop down
class LanguageModel {
  final String name;
  final String code;

  LanguageModel({required this.name, required this.code});
}
