// Open Animal Nutrition — Extensions (v0.1 SCAFFOLD, UNVALIDATED)

Extension: AppliedRequirementStandard
Id: applied-requirement-standard
Title: "Applied Requirement Standard"
Description: "Which published requirement standard the adequacy check was run against, by its edition's code when the edition is known (for example AAFCO-2026). A variable selection, never hardcoded into the check."
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

Extension: CaloricRestriction
Id: caloric-restriction
Title: "Caloric Restriction"
Description: """
The intentional caloric restriction that the check was run under, as a
percentage of the animal's energy need, in UCUM `%`: 25 means that the animal
is fed 25% less energy than it needs. Most of the applied standard's per-Mcal
minimums are then multiplied by 1 ÷ (1 − restriction ÷ 100) (under an AAFCO
selection, together with any AAFCO dry matter factor), so a nutrient can be
`deficient` although it meets the minimum that applies with no restriction.
The source template accepts 0 (none) or a number from 1 to 55. Present only
for a restriction above 0, and absent when none was entered (blank or 0 in the
template). An intake
entered in place of the calculated energy requirement is not a restriction.
Neither it nor the template's figure for how far it falls below that
requirement (cell N4 on the template's Standards tab) is recorded here. Which
minimums are raised, and the rule that makes a value below them `deficient`,
are stated, proposed and pending ratification, on the
[Decile Basis and Band Computation](band-computation.html) page.
"""
Context: Observation
* value[x] only Quantity
* valueQuantity.comparator 0..0
* valueQuantity.value 1..1
* valueQuantity.system 1..1
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code 1..1
* valueQuantity.code = #%

Extension: MaximumProvenance
Id: maximum-provenance
Title: "Maximum Provenance"
Description: """
The kind of maximum a nutrient's range high is: AUTHORITATIVE (set by a standards body for the animal and the use it is applied
to), CONDITIONAL (a standard's figure with a condition the check
does not verify), TEMPLATE-SET (set or computed by the source template) or
DERIVED-PROVISIONAL (computed by a disclosed rule from the minimum). Only a
value above an authoritative maximum is `excess`. How the source template's
maximum types map to these codes is stated, proposed and pending ratification,
on the [Decile Basis and Band Computation](band-computation.html) page.

Derived ceilings prioritize consistency and determinism, NOT toxicological
calibration, and are revisable by the governance body. This flag exists so a
consumer can see at a glance which ceilings are authoritative and which are
not.
"""
Context: Observation.component
* value[x] only code
* valueCode from MaximumProvenanceVS (required)

Extension: NutrientDecile
Id: nutrient-decile
Title: "Nutrient Decile (Common-Basis Expression)"
Description: "The diet's level for this nutrient on the common mathematical basis used to compare across standards, expressed as a band of the Dynamic Decile System: four bands below the minimum and ten deciles from the minimum to the range high. Where an entry gets a band, a value above the range high is in range-d10 (Highest) unless it is below the minimum. The decile basis and band computation are stated on the [Decile Basis and Band Computation](band-computation.html) page, proposed and pending ratification by the governance body."
Context: Observation.component
* value[x] only code
* valueCode from NutrientDecileVS (required)
