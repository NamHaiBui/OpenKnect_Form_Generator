import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart' as gen_ai;

class GeminiInitializer {
  static late final gen_ai.GenerativeModel gemimiModel;

  static Future<void> initialize(String? apiKey) async {
    if (apiKey == null) {
      debugPrint('No \$API_KEY environment variable');
      exit(1);
    }
    final generationConfig = gen_ai.GenerationConfig(
      temperature: 1,
      topP: 0.95,
      topK: 64,
      maxOutputTokens: 8192,
      responseMimeType: 'application/json',
    );

    gemimiModel = gen_ai.GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
      generationConfig: generationConfig,
    );
  }

  static Future<gen_ai.GenerateContentResponse> call(String call) async {
    final List<Map<String, String>> parts = [
      {
        'text':
            "input: Create a form for a job application that collects the applicant's full name, email, desired position (from a dropdown), availability (date range), and skills (checkbox group)."
      },
      {
        'text':
            "output: { \"id\": 2, \"name\": \"Job Application Form\", \"fields\": [ { \"type\": \"textBox\", \"label\": \"Full Name\", \"initialValue\": [\"\"], \"key\": \"fullName\", \"text\": \"Enter your full name\", \"options\": [], \"validations\": { \"required\": true, \"minLength\": 5 } }, { \"type\": \"textBox\", \"label\": \"Email\", \"initialValue\": [\"\"], \"key\": \"email\", \"text\": \"Enter your email address\", \"options\": [], \"validations\": { \"required\": true, \"email\": true } }, { \"type\": \"dropdownList\", \"label\": \"Position Applying For\", \"initialValue\": [\"\"], \"key\": \"position\", \"options\": [ \"Software Engineer\", \"Marketing Manager\", \"Data Analyst\" ], \"validations\": { \"required\": true } }, { \"type\": \"dateRange\", \"label\": \"Availability\", \"date\": { \"dateFormat\": \"yyyy-MM-dd\", \"firstDate\": \"2024-01-01\", \"lastDate\": \"2025-12-31\" }, \"initialValue\": [\"\", \"\"], \"key\": \"availability\", \"options\": [], \"validations\": { \"required\": true } }, { \"type\": \"toCollectCheckboxGroup\", \"label\": \"Skills\", \"text\": \"Select your skills\", \"initialValue\": [], \"key\": \"skills\", \"options\": [ \"Python\", \"Java\", \"JavaScript\", \"SQL\", \"Leadership\", \"Communication\" ], \"validations\": { \"required\": true } } ]}"
      },
      {
        'text':
            "input: Generate a form for booking travel. The form should include fields for the traveler's name, departure address, destination address, travel dates (date range), and travel class (radio group)."
      },
      {
        'text':
            "output: { \"id\": 3, \"name\": \"Travel Booking Form\", \"fields\": [ { \"type\": \"textBox\", \"label\": \"Traveler Name\", \"initialValue\": [\"\"], \"key\": \"travelerName\", \"text\": \"Enter your name\", \"options\": [], \"validations\": { \"required\": true } }, { \"type\": \"address\", \"label\": \"Departure Address\", \"initialValue\": [\"\",\"\",\"\",\"\",\"\"], \"key\": \"departureAddress\", \"options\": [], \"validations\": { \"required\": true } }, { \"type\": \"address\", \"label\": \"Destination Address\", \"initialValue\": [\"\",\"\",\"\",\"\",\"\"], \"key\": \"destinationAddress\", \"options\": [], \"validations\": { \"required\": true } }, { \"type\": \"dateRange\", \"label\": \"Travel Dates\", \"date\": { \"dateFormat\": \"yyyy-MM-dd\", \"firstDate\": \"2024-01-01\", \"lastDate\": \"2025-12-31\" }, \"initialValue\": [\"\", \"\"], \"key\": \"travelDates\", \"options\": [], \"validations\": { \"required\": true } }, { \"type\": \"radioGroup\", \"label\": \"Travel Class\", \"initialValue\": [\"\"], \"key\": \"travelClass\", \"options\": [ \"Economy\", \"Premium Economy\", \"Business\", \"First Class\" ], \"validations\": { \"required\": true } } ]}"
      },
      {
        'text':
            "input: Generate a form for a customer survey including a name box, a date box and a description box and a score box that only allows numbers from 1 to 10"
      },
      {
        'text':
            "output: { \"id\": 4, \"name\": \"Customer Survey Form\", \"fields\": [ { \"type\": \"textBox\", \"label\": \"Name\", \"initialValue\": [\"\"], \"key\": \"name\", \"text\": \"Enter your name\", \"options\": [], \"validations\": { \"required\": true } }, { \"type\": \"date\", \"label\": \"Date\", \"initialValue\": [\"\"], \"key\": \"date\", \"options\": [], \"validations\": { \"required\": true } }, { \"type\": \"textBox\", \"label\": \"Description\", \"initialValue\": [\"\"], \"key\": \"description\", \"text\": \"Provide feedback or comments\", \"options\": [], \"validations\": { \"required\": true } }, { \"type\": \"number\", \"label\": \"Score (1-10)\", \"initialValue\": [\"\"], \"key\": \"score\", \"text\": \"Rate your experience\", \"options\": [], \"validations\": { \"required\": true, \"minNumber\": 1, \"maxNumber\": 10 } } ]}"
      },
      {
        'text':
            "input: Generate a form to retrieve a person name using a textbox"
      },
      {
        'text':
            "output: {\"id\": 1,\"name\": \"Name Retrieval Form\",\"fields\": [{\"type\": \"textBox\",\"label\": \"Name\",\"initialValue\": [\"\"],\"key\": \"name\",\"text\": \"Enter your name\",\"options\": [],\"validations\": {\"required\": true}}]}"
      },
      {
        'text':
            "input: Generate a form with a single text input field labeled \"Name\"."
      },
      {
        'text':
            "output: {\"id\": 5,\"name\": \"Simple Name Form\",\"fields\": [{\"type\": \"textBox\",\"label\": \"Name\",\"initialValue\": [\"\"],\"key\": \"name\",\"text\": \"Enter your name\",\"options\": [],\"validations\": { \"required\": true }}]}"
      },
      {
        'text':
            "input: Create a form with a dropdown menu labeled \"Country\" that includes the following options: USA, Canada, Mexico, UK, France, Germany, China, Japan."
      },
      {
        'text':
            "output: {\"id\": 5, \"name\": \"Country Selection Form\", \"fields\": [{\"type\": \"dropdownList\", \"label\": \"Country\", \"initialValue\": [\"\"], \"key\": \"country\", \"options\": [\"USA\", \"Canada\", \"Mexico\", \"UK\", \"France\", \"Germany\", \"China\", \"Japan\"], \"validations\": {\"required\": true}}]}"
      },
      {
        'text':
            "input: Make a form with a radio button group labeled \"Gender\" with the options: Male, Female, Other."
      },
      {
        'text':
            "output: {\"id\": 5, \"name\": \"Gender Selection Form\", \"fields\": [{\"type\": \"radioGroup\", \"label\": \"Gender\", \"initialValue\": [\"\"], \"key\": \"gender\", \"options\": [\"Male\", \"Female\", \"Other\"], \"validations\": {\"required\": true}}]}"
      },
      {
        'text':
            "input: Design a form with a checkbox labeled \"Agree to terms and conditions\"."
      },
      {
        'text':
            "output: {\"id\": 5, \"name\": \"Terms and Conditions Agreement Form\", \"fields\": [ { \"type\": \"checkbox\", \"label\": \"Agree to terms and conditions\", \"initialValue\": [false], \"key\": \"agreeToTerms\", \"options\": [], \"validations\": { \"required\": true } } ]}"
      },
      {
        'text':
            "input: Construct a form with a date picker labeled \"Date of birth\"."
      },
      {
        'text':
            "output: {\"id\": 5,\"name\": \"Date of Birth Form\",\"fields\": [{\"type\": \"date\", \"label\": \"Date of Birth\", \"initialValue\": [\"\"], \"key\": \"dateOfBirth\", \"options\": [], \"validations\": { \"required\": true }}]}"
      },
      {
        'text':
            "input: Build a form with a time picker labeled \"Appointment time\"."
      },
      {
        'text':
            "output: {\"id\": 5,\"name\": \"Appointment Time Form\",\"fields\": [{\"type\": \"timePicker\", \"label\": \"Appointment Time\", \"initialValue\": [\"00:00\"], \"key\": \"appointmentTime\", \"options\": [], \"validations\": { \"required\": true }}]}"
      },
      {
        'text':
            "input: Create a form with a password input field labeled \"Password\"."
      },
      {
        'text':
            "output: {\"id\": 5, \"name\": \"Password Input Form\", \"fields\": [{\"type\": \"password\", \"label\": \"Password\", \"initialValue\": [\"\"], \"key\": \"password\", \"text\": \"Enter your password\", \"options\": [], \"validations\": {\"required\": true}}]}"
      },
      {'text': "input: $call"}
    ];

    return await gemimiModel.generateContent(
      parts
          .map(
            (e) => gen_ai.Content.text(
              e['text']!,
            ),
          )
          .toList(),
    );
  }
}
