This page is for readers who use the source template's data without its cell
notes: exports, programs and AI checkers. It gives the template's status and
its known limitations, as the template's own status block states them
(Standards tab, cell A2 and rows 132 to 149, Version 21OCT26b), and the errata
for copies of earlier versions. The template's cell notes named below give the
details. How the template computes the bands, and the proposed rules for a
verdict, are on the
[Decile Basis and Band Computation](band-computation.html) page.

### Status

The source template is the *Standardized Nutrient Ranges \| Dynamic Decile
System Table*. Its Version 21OCT26b has been live since 21 October 2026: the
final feature version, 21OCT26, with the wording of four texts corrected. In
the
template's words (cells A133 to A135):

> Status: this is the final feature version of this sheet. It is frozen: only
> errors are corrected, each with a new version label and a row on the History
> of Change(s) sheet; no new inputs, requirements, rules or standards editions
> are added. Requests for new features are taken for the code version, not for
> this sheet.
>
> A code version (Python and Rust) is in development. It will take inputs this
> sheet cannot (e.g., age, breed, whether a nutrient is added as an additive)
> and will say when a result depends on an input that is not known.
>
> The code version becomes the reference once it reproduces this sheet's
> published test cases; until then this sheet remains the reference. For its
> status and the Open Animal Nutrition FHIR Implementation Guide, see
> https://github.com/openanimalnutrition (openanimalnutrition.org is the
> planned future address).

- **Reproducing the test cases** means giving the template's results on its
  released test cases. Any case where the code version gives a different
  result, for example where it corrects an error in the template, is to be
  recorded with its reason and approved by the provisional steward before the
  code version becomes the reference. The Python and Rust code are planned to
  read one shared data file of requirement values.
- **The adequacy interpretation stays proposed.** Which values are
  `deficient` or `excess` is the provisional steward's proposal, pending
  ratification by the governance body, in the code version as on the
  [Decile Basis and Band Computation](band-computation.html) page.
- **Errors** in the template, or differences between it and this guide, can
  be reported in the guide's
  [source repository](https://github.com/openanimalnutrition/animal-nutrition-ig).

### Standards

In the template's words (cell A136):

> Standards: 2006 NRC Nutrient Requirements of Dogs and Cats; 2026 AAFCO
> Official Publication (Dog and Cat Food Nutrient Profiles); FEDIAF Nutritional
> Guidelines, September 2025.

This guide's [Requirement Standards](CodeSystem-requirement-standard.html) code
system has a code for each edition: `NRC-2006`, `AAFCO-2026` and `FEDIAF-2025`.

### What the descriptions show

In the template's words (cells A137 and A138):

> The descriptors compare the entered values with the selected requirement's
> ranges only; they do not show that a diet is adequate, safe or compliant
> (see the L1 and G1 notes).
>
> A value above a range high reads Highest. The Open Animal Nutrition FHIR IG
> calls a value excess only above an authoritative max (max types in columns
> AU to BO of the Healthy Dog Cat Reqt Data sheet; see the E5 note); this
> grouping is proposed, pending ratification.

The grouping is under [Maximum types](band-computation.html#maximum-types).

### Known limitations

The template has no input for the conditions below. In the template's words
(cells A139 to A149; the cell notes named are on the Standards tab unless
stated):

> Known limitations (this sheet has no input for them; details in the notes
> named):
>
> 1. Age: FEDIAF Dog Late Growth puppies with an expected adult weight over
>    15 kg keep the calcium min of 2.5 g/Mcal and the Ca:P max of 1.6 after
>    about 6 months of age, when FEDIAF allows 2.0 and 1.8 (AE52 and AF56 notes
>    on the Healthy Dog Cat Reqt Data sheet).
> 2. Breed: FEDIAF's preferred calcium max for Great Dane puppies (1.6% DM) is
>    not applied (B63 note).
> 3. Added nutrients: FEDIAF's EU legal maxs for copper, iodine, iron,
>    manganese, selenium and zinc apply only to amounts added as additives, but
>    are applied here to every diet (J3 note on the Healthy Dog Cat Reqt Data
>    sheet).
> 4. Sources: iron added as oxide or carbonate and copper added as oxide should
>    not be counted toward the mins (B78 and B80 notes); limits on added
>    selenium and on phosphorus from soluble sources (cats) are not checked (B89
>    and B67 notes).
> 5. Conditional mins: the cat vitamin K and biotin mins apply to every diet,
>    although the standards make them conditional (B102 and B116 notes).
> 6. Reference animals: NRC's per kg body weight^0.67 values for kittens and
>    lactating queens apply to one reference animal; this sheet uses them for
>    every kitten or queen (AG3 and AQ3 notes on the Healthy Dog Cat Reqt Data
>    sheet).
> 7. Moisture: foods with more than 12% moisture count as wet, a lower cut
>    than FEDIAF's 14% (B40 note); FEDIAF's wet-diet selenium values per kg
>    BW^0.75 (dogs) or BW^0.67 (cats) are not used (B91 note).
> 8. Energy density: under an AAFCO requirement, the mins of a food below
>    4 kcal/g DM are raised to AAFCO's dry matter basis but its maxs stay per
>    Mcal, so it can read above a max it meets on a dry matter basis (C130
>    note).
> 9. Not calculated, only stated in notes: FEDIAF's increase of essential
>    amino acids below 80% protein digestibility and the protein needs of
>    bitches fed little carbohydrate (B12), vitamin E for high PUFA or fish oil
>    diets (B100), vitamin B6 with protein in cats (B112), trace minerals at
>    high calcium (B85), magnesium and urine pH in cats (B76), and processing
>    and storage losses (G1 and B104).
> 10. This sheet's own choices where the standards give no value: range highs
>     derived from the min (K1 and K72 notes; Exceptions to Range High sheet),
>     the carbohydrate default min (C124), the energy density range (C130), the
>     energy estimates for the AAFCO requirements (G4 note on the Healthy Dog
>     Cat Reqt Data sheet) and the folate DFE conversion (B114).

For the conflicts found in applying the standards' figures and the stated
rules, see
[Conflicts for the governance body](band-computation.html#conflicts-for-the-governance-body).

### Errata for copies of earlier versions

Copies of the template stay in use after a new version is released. A copy's
version label is in its cell A1. Known errors in earlier versions:

- **NRC puppy and bitch values per kg BW^0.75 (Version 18OCT26 and
  earlier).** Under NRC RA Puppy 4-14 Wk Growth, NRC RA Puppy 14
  Wk+ Growth and NRC RA Dog Late Gestation & Peak Lactation, the MBW rows hold NRC's values per kg BW^0.75. NRC states these for one
  reference animal only (a 5.5 kg puppy of 35 kg expected mature body weight;
  a 22 kg bitch in peak lactation with 8 puppies, eating 5,000 kcal ME a day),
  and calculates other animals' needs from the per-1,000 kcal values. The
  template converts them with each animal's own energy, so they misread. For
  example, a 15 kg bitch at the template's default inputs (late gestation
  energy, 1,380.9 kcal a day) fed exactly her per-Mcal minimums reads Severely
  Restricted on all 42 of her MBW rows (protein MBW minimum 135.8 against 50
  g/Mcal), and her vitamin D MBW maximum reads 2,163.7 against NRC's
  800 IU/Mcal safe upper limit. For puppies the MBW minimums read about 0.5 to 2.2 times the per-Mcal
  minimums (from 10% to 100% of the expected mature body weight), and above about 88% of the expected mature
  body weight the calcium MBW minimum passes NRC's 4.5 g/Mcal safe upper
  limit, so no diet meets both rows. In such a copy, use the per-Mcal rows
  under these three selections and disregard their MBW rows, or use Version 21OCT26b, which has no MBW values for them.
- **Wording of four texts (Version 21OCT26).** Status items 6 and 7 (cells
  A145 and A146) and the notes on cells AG3 and AQ3 of the Healthy Dog Cat
  Reqt Data tab say per kg body weight for values per kg BW^0.75 or BW^0.67.
  No value or formula is affected. Version 21OCT26b corrects the wording.

The template's History of Change(s) tab lists every change in each version,
and the [Decile Basis and Band Computation](band-computation.html#earlier-versions)
page summarizes the changes in Versions 21OCT26 and 21OCT26b.
