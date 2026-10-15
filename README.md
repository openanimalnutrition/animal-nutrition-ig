# Open Animal Nutrition — v0.1 scaffold

A FHIR R5 Implementation Guide for verifying animal-diet nutritional adequacy
against NRC / AAFCO / FEDIAF on a common basis. This guide models the
**verdict**, not diet production.

## ⚠️ Status: UNVALIDATED scaffold
This skeleton was hand-authored and has **not** been compiled with SUSHI or the
IG Publisher. Expect to fix FSH on first compile. `TODO` markers flag the known
soft spots (UCUM units, the R5 patient-animal species mechanism,
integer-vs-decimal for the decile, component slicing, ratio-nutrient handling).

## Locked configuration
- canonical: `https://openanimalnutrition.org/fhir/animal-nutrition`
- package id: `openanimalnutrition.fhir.animalnutrition`
- license: CC0-1.0
- FHIR version: 5.0.0 (migrate to R6 when tooling lands, ~late 2026)

## Build
```
# 1. scaffold the canonical project layout (ig.ini, templates, etc.)
sushi init

# 2. drop these input/fsh/* files in and compile FSH -> FHIR JSON
sushi .

# 3. build + validate the full IG site (needs Java + IG Publisher)
./_genonce.sh        # or _genonce.bat on Windows
```

## Layout
```
sushi-config.yaml
input/
  fsh/
    profiles.fsh        # AnimalNutrientAdequacy (Observation profile)
    extensions.fsh      # appliedStandard, lifeStage, maxProvenance, decile
    terminology.fsh     # CodeSystems + ValueSets (stubs)
    examples.fsh        # canine adult-maintenance example
  pagecontent/
    index.md
GOVERNANCE.md
```

## Governance
See [GOVERNANCE.md](GOVERNANCE.md), including the steward's disclosure of interest.
