// =====================================================================
// Open Animal Nutrition — Profiles
// v0.1 SCAFFOLD (UNVALIDATED). Core resource: the adequacy assessment.
// =====================================================================

Profile: AnimalNutrientAdequacy
Parent: Observation
Id: animal-nutrient-adequacy
Title: "Animal Nutrient Adequacy Assessment"
Description: """
The result of the agnostic, mathematical check of a diet's resolved nutrient
profile against a selected requirement standard (NRC / AAFCO / FEDIAF) for a
given species and life stage.

Each assessed nutrient is a component carrying the diet's level, the applicable
min/max requirement range, the common-basis decile expression, and a
per-nutrient interpretation. The top-level interpretation is the overall
complete-and-balanced verdict.

Ratio nutrients such as Ca:P are components like any other nutrient, with a
unitless quantity (UCUM `1`). Non-linear ratio nutrients are excluded from the
component model by design.

A component's interpretation is `excess` only when the value is above a maximum
or safe upper limit set by the applied standard (maxProvenance `authoritative`).
Above a derived-provisional ceiling the interpretation stays `adequate`; the
value is still flagged by its decile band, `range-d10` ("Highest (90% of Range
or Greater)"), and referenceRange.high holds the derived ceiling it exceeds.

`performer` is optional. When a veterinarian, nutritionist or clinic ran or
reviewed the check, name them (Practitioner, PractitionerRole or Organization).
The organization that only operates the checking software is not the performer
unless it also reviewed this verdict. Software cannot be the performer of an
Observation in FHIR R5 (`performer` does not accept a Device). When software
computed the verdict, record it in `device`: a Device whose `name` and
`version` give the software's name and version, so a reader can tell which
checker, and which version of it, produced the verdict.

SCOPE: this profile models the VERDICT. Ingredient selection, fortification,
and rounding (i.e. how a passing diet is produced) are out of scope by design.
"""
* extension contains
    AppliedRequirementStandard named appliedStandard 1..1 MS and
    NutrientLifeStage named lifeStage 1..1 MS
* status MS
* code 1..1 MS
* code = OANAssessmentCS#diet-adequacy
* subject 1..1 MS
* subject only Reference(Patient)          // animal Patient; reuse core animal support
* effective[x] MS
* performer MS
* performer only Reference(Practitioner or PractitionerRole or Organization)
* performer ^short = "Veterinarian, nutritionist or clinic who ran or reviewed the check (optional)"
* device MS
* device only Reference(Device)
* device ^short = "Software that computed the verdict, with its name and version (optional)"
* interpretation 1..1 MS                    // overall complete-and-balanced verdict
* interpretation from AdequacyInterpretationVS (required)
* component MS
* component ^short = "One per assessed nutrient"
// --- per-component shape (left unsliced in v0.1; slice by nutrient in a later version) ---
* component.code 1..1 MS
* component.code from AnimalNutrientVS (extensible)
* component.value[x] only Quantity
* component.valueQuantity MS
* component.interpretation 1..1 MS
* component.interpretation from AdequacyInterpretationVS (required)
* component.referenceRange MS
* component.referenceRange.low ^short = "Requirement minimum (authoritative)"
* component.referenceRange.high ^short = "Maximum (authoritative OR derived-provisional)"
* component.extension contains
    MaximumProvenance named maxProvenance 0..1 MS and
    NutrientDecile named decile 0..1 MS

// TODO v0.2: slice `component` by nutrient.
