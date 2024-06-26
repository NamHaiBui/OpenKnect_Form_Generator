/// Contains utility classes representing form field names in the forms used for adding new jobs.
/// Each record represents a different form used in the process, each containing named record fields.
/// Each record field represents the name of a form field; the name is as an identifier to refer to the field and retrieve its value.
/// Said name can also be used as the title and the hint text of the form field if appropriate.
library job_form_fields;

const ({
  // CompanyModel company,
  String jobPostingId,
  String jobPostingUrl,
  String internalJobTitle, 
  String publicJobTitle,
  String workingType,
  String jobLevel,
  String isFullTime,
  String isUrgent,
  String weeklyWorkingHour,
  String numberOfPositions,
  String numberOfAllowedCandidates,
  String projectedWorkingPeriod,
  String jobOrganization, // department, etc
  String jobWorkingAddress,
  String yearlySalary,
  String hourlySalary,
  String clientJobPostingPeriod, 
  String privateLowBid,
  String privateSalary,
  String jobPostingStatuses, // closed, interviewing, etc... on our end (we can actively)
  //? String relatedTechnologies, 
  //? String majors,
  String clientJobStatus, // closed, interviewing, etc... SUPPLIED BY CLIENT/THE STATE
  //? String jobPortalPostings,
  String supportingDocuments,
  // List<ScreeningQuestion>? screeningQuestions,
}) jobFormFields = (
  jobPostingId: "Job posting ID",
  jobPostingUrl: "Job posting URL",
  internalJobTitle: "Job title (Internal)",
  publicJobTitle: "Job title",
  workingType: "Employment type",
  jobLevel: "Experience level",
  isFullTime: "Full time?",
  isUrgent: "Is urgent?",
  weeklyWorkingHour: "Weekly working hour",
  numberOfPositions: "Number of positions",
  numberOfAllowedCandidates: "Number of allowed candidates",
  projectedWorkingPeriod: "Projected working period",
  jobOrganization: "Job organization",
  jobWorkingAddress: "Job location",
  yearlySalary: "Yearly salary",
  hourlySalary: "Hourly salary",
  clientJobPostingPeriod: "Client job posting period",
  privateLowBid: "Low bid (Private)",
  privateSalary: "Yearly salary (Private)",
  jobPostingStatuses: "Job posting status",
  clientJobStatus: "Job posting status (client)",
  supportingDocuments: "Supporting documents"
);

const ({
  String street,
  String district,
  String city,
  String state,
  String postalCode,
  String country,
}) addressFormFields = (
  street: "Street Address",
  district: "District",
  city: "City",
  state: "State",
  postalCode: "ZIP Code",
  country: "Country",
);