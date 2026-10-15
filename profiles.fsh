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

// TODO v0.2: slice `component` by nutrient; decide explicit handling for ratio
// nutrients (Ca:P) and exclude non-linear ratios from the component model per
// the conformance spec.
