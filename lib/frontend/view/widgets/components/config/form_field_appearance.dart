/// Contains utility classes representing form field titles and names in the forms used for adding new s.
/// Each record represents a different form used in the process, each containing named record fields.
/// Each record field represents the title and name of a form field used in its respective form.
/// Note that currently, a form field's title (used when displaying the form) is also used as its name/identifier in the flutter_form_builder library.
library job_form_field_appearance;

import 'package:flutter/material.dart';


const Size titleTextSize = Size(166, 52);
const Size addressTitleTextSize = Size(166, 146);
const Size formTextFieldSize = Size(432, 52);
const Size formDropdownFieldSize = Size(100, 52);
const Size formRangeFieldSize = Size(195, 52);
const Size formRadioOptionSize = Size(150, 0);
const double formRadioWrapSpacing = 10.0;

const EdgeInsets paddingPostingStatusTitles =
    EdgeInsets.only(left: 56, right: 24, bottom: 16, top: 16);
const EdgeInsets paddingBetweenFormFields =
    EdgeInsets.only(bottom: 24);
const EdgeInsets paddingAroundPostingFormPage =
    EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 20);
const EdgeInsets paddingAroundPostingFormProgressBar =
    EdgeInsets.only(left: 24, right: 24);
const EdgeInsets paddingPostingQuestions =
    EdgeInsets.only(left: 24, right: 24, bottom: 24);
const EdgeInsets paddingPostingQuestionContent =
    EdgeInsets.only(bottom: 27, top: 20);
const EdgeInsets paddingPostingQuestionCategories =
    EdgeInsets.only(top: 20, bottom: 20, right: 15, left: 15);
const EdgeInsets paddingPostingQuestionButtons = 
     EdgeInsets.only(top: 20, bottom: 20, right: 15, left: 8);

const SizedBox spacingBetweenTitleAndField = SizedBox(height: 6);
const SizedBox spacingBetweenTitleAndTextEditor = SizedBox(height: 12);
const SizedBox spacingBetweenDescriptionFields = SizedBox(height: 25);
const SizedBox spacingBetweenRangeFields = SizedBox(width: 10);

const SizedBox spacingBetweenAddressTitleAndField = SizedBox(height: 4);
const SizedBox spacingBetweenAddressFields = SizedBox(width: 8);
const SizedBox spacingBetweenAddressRows = SizedBox(height: 12);
const SizedBox spacingBetweenFormTopBarAndContent = SizedBox(height: 20);
const SizedBox spacingBetweenQuestionFormTitleAndContent = SizedBox(height: 15);

const SizedBox spacingBetweenQuestionRows = SizedBox(height: 15);

const Size formAddressStreetFieldSize = Size(334, 44);
const Size formAddressDistrictFieldSize = Size(113, 44);
const Size formAddressCityFieldSize = Size(140, 44);
const Size formAddressStateFieldSize = Size(76, 44);
const Size formAddressCountryFieldSize = Size(300, 44);
const Size formAddressPostalCodeFieldSize = Size(100, 44);

const TextStyle questionButtonTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 18,
  fontFamily: "Roboto",
  fontWeight: FontWeight.w500,
);

const double fieldNameSize = 12.5;

const Icon removeQuestionIcon = Icon(Icons.delete_outlined);
const Icon removeAnswerIcon = Icon(Icons.delete_outlined);
const Icon addTemplateQuestionIcon = Icon(Icons.add);
const Icon removeTemplateQuestionIcon = Icon(Icons.close);


