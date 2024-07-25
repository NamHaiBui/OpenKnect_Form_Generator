/// Contains utility classes representing the order of 
library job_form_pages;

const int jobFormMaxPages = 5;

class JobFormPageIndices {
  static const int jobInfoForm = 0;
  static const int jobDescriptionForm = 1;
  static const int jobQuestionsForm = 2;
  static const int jobToCollectForm = 3;
  static const int reviewJobPosting = 4;
  const JobFormPageIndices._();
}

final Map<int, String> jobFormPageTitles = {
  JobFormPageIndices.jobInfoForm: 'Job Information',
  JobFormPageIndices.jobDescriptionForm: 'Job Description',
  JobFormPageIndices.jobToCollectForm: 'What information do you want to collect from applicants?',
  JobFormPageIndices.jobQuestionsForm: 'Screening Questions',
  JobFormPageIndices.reviewJobPosting: 'Review Job Posting',
};