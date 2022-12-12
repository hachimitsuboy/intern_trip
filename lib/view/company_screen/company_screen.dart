import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_trip/functions/register_intern.dart';
import 'package:intern_trip/view/common_widgets/common_button.dart';
import 'package:intern_trip/view/company_screen/children/company_industry_drop_down_button.dart';
import 'package:intern_trip/view/company_screen/children/company_occupation_drop_down_button.dart';
import 'package:intern_trip/view/company_screen/children/schedule_picker.dart';
import 'package:intern_trip/view/company_screen/children/company_text_form_field.dart';
import 'package:intern_trip/view/company_screen/children/event_content_text_form_field.dart';
import 'package:intern_trip/view/company_screen/children/venue_drop_down_button.dart';

class CompanyScreen extends ConsumerWidget {
  const CompanyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController companyController = TextEditingController();
    final TextEditingController eventNameController = TextEditingController();
    final TextEditingController eventContentController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('イベント登録'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                '企業名',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              CompanyTextFormField(
                textEditingController: companyController,
              ),
              const SizedBox(height: 32),
              const Text(
                'イベント名',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              CompanyTextFormField(
                textEditingController: eventNameController,
              ),
              const SizedBox(height: 32),
              const Text(
                'イベント内容',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              EventContentTextFormField(
                  textEditingController: eventContentController),
              const SizedBox(height: 32),
              const Text(
                '業種',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const CompanyIndustriesDropDownButton(),
              const SizedBox(height: 32),
              const Text(
                '職種',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const CompanyOccupationDropDownButton(),
              const SizedBox(height: 32),
              const Text(
                '開催地',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const VenueDropDownButton(),
              const SizedBox(height: 32),
              const Text(
                '開催日時',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const SchedulePicker(),
              const SizedBox(height: 64),
              CommonButton(
                title: 'イベントを登録',
                onPush: () => registerIntern(
                  ref,
                  companyController,
                  eventNameController,
                  eventContentController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
