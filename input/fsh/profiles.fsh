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
per-nutrient interpretation. The decile expression is computed as stated,
proposed and pending ratification, on the
[Decile Basis and Band Computation](band-computation.html) page. The top-level
interpretation is the overall complete-and-balanced verdict.

Ratio nutrients such as Ca:P are components like any other nutrient, with a
unitless quantity (UCUM `1`). Non-linear ratio nutrients are excluded from the
component model by design.

A component's interpretation is `excess` only when the value is above an
authoritative maximum, one set by a standards body for the animal and the use
it is applied to (maxProvenance
`authoritative`), and not below a minimum set by the applied standard,
including one raised for a caloric restriction or by the AAFCO dry matter
factor (below). Above a conditional, template-set or derived-provisional
maximum, and not below the minimum, the interpretation stays `adequate`. The
band is then `range-d10` ("Highest (90% of Range or
Greater)"), which alone does not show that the maximum was exceeded:
referenceRange.high holds the maximum, and maxProvenance says what kind it is.

Where a caloric restriction, or the AAFCO dry matter factor for a food below
4 kcal/g of dry matter, raises a minimum set by the applied standard,
referenceRange.low holds the raised minimum, and the band is computed from it.
A value below it is `deficient`, even if it meets the minimum that applies
with no adjustment. A verdict checked under a caloric restriction above 0 records the
percentage in `caloricRestriction`. This rule, the condition on `excess` above,
and which minimums they cover are stated, proposed and pending ratification, on
the [Decile Basis and Band Computation](band-computation.html) page.

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
    NutrientLifeStage named lifeStage 1..1 MS and
    CaloricRestriction named caloricRestriction 0..1 MS
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
* component.referenceRange.low ^short = "Requirement minimum"
* component.referenceRange.high ^short = "Maximum or ceiling (see maxProvenance)"
* component.extension contains
    MaximumProvenance named maxProvenance 0..1 MS and
    NutrientDecile named decile 0..1 MS

// TODO v0.2: slice `component` by nutrient.
