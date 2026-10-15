// Open Animal Nutrition — Extensions (v0.1 SCAFFOLD, UNVALIDATED)

Extension: AppliedRequirementStandard
Id: applied-requirement-standard
Title: "Applied Requirement Standard"
Description: "Which published requirement standard the adequacy check was run against. A variable selection, never hardcoded into the check."
Context: Observation
* value[x] only CodeableConcept
* valueCodeableConcept from RequirementStandardVS (required)

Extension: NutrientLifeStage
Id: nutrient-life-stage
Title: "Life Stage"
Description: "The life stage whose requirements were applied (e.g. growth, adult maintenance). A variable selection."
Context: Observation
* value[x] only CodeableConcept
* valueCodeableConcept from LifeStageVS (required)

Extension: MaximumProvenance
Id: maximum-provenance
Title: "Maximum Provenance"
Description: """
Whether a nutrient's maximum is AUTHORITATIVE (set by the applied standard) or
DERIVED-PROVISIONAL (computed by a disclosed rule from the minimum, where no
authoritative limit exists).

Derived ceilings prioritize consistency and determinism, NOT toxicological
calibration, and are revisable by the governance body. This flag exists so a
consumer can see at a glance which ceilings are authoritative and which are the
standard's own provisional call.
"""
Context: Observation.component
* value[x] only code
* valueCode from MaximumProvenanceVS (required)

Extension: NutrientDecile
Id: nutrient-decile
Title: "Nutrient Decile (Common-Basis Expression)"
Description: "The diet's level for this nutrient expressed on the common mathematical basis used to compare across standards. TODO: pin the basis and the computation in the conformance spec (this is the single decision that carries the standard's neutrality). The proposed basis also defines four bands below the minimum, which a 1..10 integer cannot express."
Context: Observation.component
* value[x] only integer    // 1..10 — TODO confirm integer vs decimal, and how below-minimum bands are represented
