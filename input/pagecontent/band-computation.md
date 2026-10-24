**Proposed, pending ratification.** This page states the computation and the
rules that the provisional steward proposes for the three decisions that
[GOVERNANCE.md](https://github.com/openanimalnutrition/animal-nutrition-ig/blob/main/GOVERNANCE.md)
reserves for ratification: the common mathematical basis for expressing
nutrient levels (the decile basis), the derived-provisional maximum rule, and
the adequacy interpretation rules. It also states the limits that the source
template sets or computes, which the computation uses.

- **Why it is published now:** so that implementers have one written
  computation to reproduce, instead of each working it out from the template.
- **What the label means:** this is the provisional steward's proposal, not a
  ratified rule. The neutral, multi-stakeholder governance body described in
  GOVERNANCE.md ratifies it, and that body has not yet formed. Until it does,
  the provisional steward is the only decision-maker. Ratification may change
  anything on this page.
- **Where it is tracked:**
  [issue #4](https://github.com/openanimalnutrition/animal-nutrition-ig/issues/4)
  in the guide's
  [source repository](https://github.com/openanimalnutrition/animal-nutrition-ig).
  The issue stays open until the governance body ratifies. Please report there
  any difference between this page and the template's formulas.
- **Source:** the *Standardized Nutrient Ranges \| Dynamic Decile System
  Table*, Version 21OCT26b, live since 21 October 2026, an open spreadsheet
  template. Version 21OCT26b is Version 21OCT26 with the wording of four texts
  corrected and no value or formula changed (see
  [Earlier versions](#earlier-versions)), so what this page says of Version
  21OCT26 holds for it. GOVERNANCE.md links to it and states the steward's
  disclosure of interest.
- **The template is frozen:** Version 21OCT26 is its final feature version.
  From now on only errors are corrected, each as a new version with its own
  label. A code version (Python) is in development. It becomes the
  reference once it reproduces the template's published test cases; until
  then the template remains the reference. See
  [Template Status and Known Limitations](known-limitations.html).

The page is written for implementers (people, software and AI checkers) who
need to get the same band for the same input, and for reviewers of the
proposal. It states what the template computes. It also states the provisional
steward's own rules for a check under a caloric restriction, for minimums
raised by the AAFCO dry matter factor, for the arginine and large-breed puppy
calcium minimums, and for which maximums can give `excess` (see
[Bands and the adequacy interpretation](#bands-and-the-adequacy-interpretation)),
and, for the code version, the energy that sets the limits and the choline maximum
(see [Energy rules proposed for the code version](#energy-rules-proposed-for-the-code-version)).
Like the rest of the page, these rules are pending ratification. Where the
template is silent and no such rule is stated, the point is listed under
[Open points](#open-points) and is not decided here. The template gives bands,
not verdicts: the adequacy interpretation codes are this guide's own.

### The basis

The template compares every nutrient level per 1,000 kcal of metabolizable
energy (ME), written per Mcal (for example g/Mcal), as in the NRC, AAFCO and
FEDIAF tables. Its notes ask for diet values on the same basis. Three kinds of
row use another basis: energy (kcal ME per day), energy density (kcal ME per g
of dry matter, written kcal/g DM) and ratios (no unit).

This holds for every food and every selection. AAFCO compares a food below
4 kcal ME per g of dry matter with its dry-matter values, without correcting
for energy. Under an AAFCO selection, when such a food's energy density is
entered under Min, the template raises AAFCO's minimums (those a caloric
restriction raises, and fat) to that dry-matter basis and still compares per
Mcal (see
[The AAFCO dry matter factor](#the-aafco-dry-matter-factor)).

On that basis, a diet's level for one nutrient is described by one of 14 bands,
set by two numbers for that nutrient: its minimum (or 0 when there is none) and
its range high. Some entries get another outcome instead (see
[Outcomes other than a band](#outcomes-other-than-a-band)).

- Four bands lie below the minimum, as shares of the minimum: under 25%, 25 to
  under 50%, 50 to under 75%, and 75 to under 100%.
- Ten deciles divide the span from the minimum to the range high.

The 14 bands are the codes of
[Nutrient Decile Bands](CodeSystem-nutrient-decile.html), carried in the
[Nutrient Decile (Common-Basis Expression)](StructureDefinition-nutrient-decile.html)
extension. The template's band labels are these codes' display strings,
character for character.

The template offers 21 requirement selections for dogs and cats, for example
NRC RA Dog Maintenance (NRC's recommended allowances for adult dogs at
maintenance) or AAFCO Cat Growth and Reproduction. Every limit on this page is
the one that applies under the selected requirement, whether the standard or
the template sets it.

### Inputs for one nutrient

For each nutrient, under the selected requirement, the template takes:

- the **minimum**: the standard's, or one the template supplies, computes or
  adjusts (below), or none;
- the **maximum**: the standard's maximum or safe upper limit, or one the
  template sets or computes (below), or none;
- the **multiplier K**, used only when there is no maximum;
- the **diet value**. The template takes up to two per row, entered under the
  headings Min and Max. It treats them alike except on rows with no minimum
  (see [Rows with no minimum](#rows-with-no-minimum)), for "none" (described as
  blank under Min and as "none" under Max), for protein: only protein
  entered under Min raises the arginine minimums (NRC and FEDIAF selections),
  and for energy density: only the energy density entered under Min sets the
  AAFCO dry matter factor.

From these it derives:

- the **base**: the minimum, or 0 when there is no minimum;
- the **range high**: the maximum when it is a number, whether the standard or
  the template set it; otherwise the minimum times K; otherwise 0, when there
  is neither a minimum nor a maximum.

#### Multipliers

When a row has no maximum, its range high is the minimum times K.

| Rows | K |
|---|---|
| Most nutrients | 4 |
| Energy (kcal/day) | 1.55 |
| Sodium | 7 |
| Total dietary, insoluble and soluble fiber | 6 |
| Ca:P ratio | 2 |
| The two n-6:n-3 ratios | 1 |
{:.grid}

A range high of the minimum times K is a derived-provisional ceiling: it
prioritizes consistency and determinism, not toxicological calibration, and is
revisable by the governance body.

- No selection has an energy maximum, so the energy range high is always 1.55
  times the energy minimum: the animal's daily energy requirement, or an
  entered intake that overrides it.
- The Ca:P range high is 2 times the minimum only when the selection sets a
  Ca:P minimum but neither a Ca:P maximum nor a calcium maximum: in Version
  21OCT26, the two AAFCO cat selections, whose Ca:P range is then 1 to 2. The
  2 is the template's own choice, not an AAFCO maximum. Version 18OCT26 used
  1, when no selection had a Ca:P minimum without a maximum.
- With K = 1 and no maximum, an n-6:n-3 ratio row would have no range above
  its minimum. In Version 21OCT26 this does not occur: both rows always have a
  maximum.
- The template's list of multipliers also gives 1 for water and 1.5 for energy
  density. Neither is used, because both rows have a fixed maximum (see
  [Limits the template sets or computes](#limits-the-template-sets-or-computes)).

#### Requirements per kg of metabolic body weight

Rows marked MBW (metabolic body weight) in the template come from requirements
per kg BW^0.75 per day for dogs and per kg BW^0.67 per day for cats,
where BW is the animal's body weight in kg. For adults the template asks for
the optimal (lean) body weight, and for growing animals the current body
weight; its note on cell A3 gives the standards' basis and one exception (NRC's
equation for overweight cats, used with the current body weight). For the code
version the provisional steward proposes the current body weight for every animal
instead (see [Energy rules proposed for the code version](#energy-rules-proposed-for-the-code-version)). The
template converts both limits to per Mcal:

`limit per Mcal = limit per kg BW^n per day × ((BW^n ÷ daily energy in kcal) × 1,000)`

The daily energy is the template's calculated requirement for the selection and
the animal, unless an intake is entered to override it. These per-Mcal limits
therefore change with body weight and energy intake. Under the energy rules
proposed for the code version, the minimums are converted with the energy fed and
the maximums with the reference energy (see
[below](#energy-rules-proposed-for-the-code-version)). When an MBW row has no
maximum, K is 4, or 7 for sodium.

Nine of the 21 selections have MBW values:

- NRC RA Dog Maintenance, NRC RA Cat Maintenance, NRC RA Kitten Growth, NRC RA
  Cat Late Gestation and NRC RA Cat Peak Lactation, from NRC's values per kg BW^0.75 (dogs) or BW^0.67 (cats). NRC states its kitten and lactating queen values for
  one reference animal; the template uses them for every kitten or queen, as
  its own choice (see [Maximum types](#maximum-types) for their maximums).
- The four FEDIAF adult selections, from FEDIAF's minimums per kg BW^0.75 or BW^0.67 (Table VII-11), except fat and wet-diet selenium. Where the
  per-Mcal row has a maximum, the template gives the MBW row one too: the
  per-Mcal maximum times the selection's maintenance energy requirement (MER)
  ÷ 1,000, so the two maximums meet at the MER. Converted with an entered
  intake, these rows follow FEDIAF's own method for lower energy intakes.

The other twelve have none: the AAFCO selections, the FEDIAF growth and
reproduction selections, NRC's two puppy selections and NRC RA Dog Late
Gestation & Peak Lactation. For puppies and bitches NRC states its values per kg BW^0.75 for one
reference animal only, and calculates
other animals' needs from the per-Mcal values, as the template's per-Mcal rows
do. Version 18OCT26 used those reference values for every puppy and bitch (see
the errata on
[Template Status and Known Limitations](known-limitations.html#errata-for-copies-of-earlier-versions)).

Where the template sets or computes a limit (see
[Limits the template sets or computes](#limits-the-template-sets-or-computes)),
the MBW row follows the same rule on its own basis:

- the arginine MBW minimum rises with the protein entered under Min on the
  protein MBW row, above that row's minimum;
- the alpha-linolenic acid (ALA) MBW limits use the minimum and maximum of the
  linoleic acid (LA) MBW row, under NRC RA Dog Maintenance (the one NRC dog
  selection with MBW values);
- the vitamin D2 MBW limits use the vitamin D MBW row;
- the fixed medium-chain triglyceride maximum (17.568) and the taurine default
  (0.67) are per Mcal and are not converted.

#### Caloric restriction

An intentional caloric restriction can be entered as a percentage of the
animal's energy need (cell G10): 25 means that the animal is fed 25% less
energy than it needs. The template's cell rule accepts 0 (none) or a number
from 1 to 55, typed without the % sign; a restriction below 1% is rejected as
not clinically relevant. This percentage is the only way the template takes a
restriction. When G10 holds a number above 0, the template multiplies the
standard's per-Mcal minimums by 1 ÷ (1 − restriction ÷ 100), computing that
factor first, so that the restricted intake still supplies the same daily
amount. At 25%, each such minimum is multiplied by 4/3. Anything else in G10
adjusts nothing.

- Not adjusted: the MBW rows (below), the energy minimum, energy density, fat,
  water, vitamin C, carbohydrate, the fibers, oxalate, purine and the
  standard's Ca:P minimum (the only ratio row with a minimum of its own). The
  template's note on fat gives its reason: fat per se is not essential (FEDIAF,
  AAFCO). The minimums of the essential fatty acids, ALA's own minimum
  among them, are adjusted.
- When the percentage is entered without an intake in place of the
  calculated requirement (below), the energy minimum stays the calculated
  requirement. A planned restricted intake entered as the energy row's diet
  value therefore reads below it. The template's note on the energy minimum
  says how to compare the diet's energy with the planned intake instead: enter
  that intake in K4 as well as the percentage in G10. Whether a value below
  the energy minimum is `deficient` is open (see
  [Open points](#open-points), item 6).
- The large-breed puppy calcium minimum, the larger of 3 g/Mcal and a
  body-weight term (0.54 g of calcium per kg of body weight a day, converted
  to g/Mcal with the daily energy; see
  [Limits the template sets or computes](#limits-the-template-sets-or-computes)),
  is adjusted too: the 3 always, and the body-weight term only when no intake
  is entered in place of the calculated requirement (below). Converted with
  such an intake, that term already supplies 0.54 g of calcium per kg of body
  weight a day at that intake. Its maximum (4.5, or 1.1 times the minimum when
  the minimum is above 4.5) follows it.
- Maximums taken from a standard are not adjusted. Limits that the template
  computes from other rows use the adjusted minimums, and a range high of the
  minimum times K follows the adjusted minimum. So the ALA floor from the LA
  minimum, the calculated n-6:n-3 ratio limits and a Ca:P maximum calculated
  from the phosphorus minimum follow the restriction, and the calculated
  carbohydrate maximum falls as the protein minimum rises.
- For arginine (NRC and FEDIAF selections), the standard's minimum is
  multiplied, and the increase for protein is then added, measured from the
  raised protein minimum. Under NRC RA Dog Maintenance, with 40 g/Mcal of
  protein entered under Min, the minimum is 1.03 g/Mcal with no restriction
  and 1.24 at 25%, not 1.03 × 4/3.
- The template describes the restriction itself with the same band test, on a
  range of 0 to 55, or as "No restriction to describe" for 0, nothing entered
  or "none". That row describes an input, not a nutrient.
- The template's notes recommend stating the restriction, and any intake
  entered in K4, wherever a band is cited, because the same g/Mcal can then
  fall in a different band.

The MBW rows come from separate requirements, per kg BW^0.75 or BW^0.67.
The template's notes present the percentage as an alternative to them, and
state that requirements on an MBW basis are separately protective. The
percentage does not change them. They are converted with the daily energy the
template uses: the calculated requirement, which the percentage does not
reduce, or an intake entered in its place.
Converted with an entered intake, an MBW row's minimum supplies the standard's
daily amount at that intake. The energy rules proposed for the code version
convert the MBW minimums with the energy fed instead, so a restriction raises them
too, fat's excepted (see [below](#energy-rules-proposed-for-the-code-version)).

An intake entered in place of the calculated requirement (cell K4, labelled
"Overwrite & Use This Instead (kcal/day):") is not a restriction. Only a number
above 0 in K4 counts as an entered intake, here and throughout this page;
anything else leaves the calculated requirement in use. The template's cell
rule on K4 accepts a number from 10 to 30,000 kcal/day. An entered intake is
the daily energy that the template uses for the animal. It never triggers a
restriction adjustment, because individual energy needs vary widely around the
calculated average. The template's notes cite individual variation of up to 55%
(the basis of its 55% cap), and about 50% for cats from the 2006 NRC. So an
intake below the calculated requirement may meet the animal's whole need, or
only part of it. Whether it is a restriction is for the user to say, by entering
the percentage. For example, 1000 kcal/day entered where the calculated
requirement is 1250 is not, by itself, a restriction. Entering 20 as the
percentage as well says that 1000 kcal/day is 80% of the animal's need. Under the
energy rules proposed for the code version, an intake below the reference energy
also raises some minimums under the adult maintenance selections (see
[below](#energy-rules-proposed-for-the-code-version)).

- An entered intake changes limits and bands only on the rows that the
  template converts with daily energy: the energy row (its minimum becomes the
  intake), the MBW rows (the ALA MBW row among them) and the large-breed puppy
  calcium row. Under the twelve selections with no MBW values it changes only
  the energy row, and under NRC RA Puppy 4-14 Wk Growth also the large-breed
  puppy calcium row, once a puppy body weight is entered for it (cell G65).
- The template shows how far an entered intake is below the calculated
  requirement (cell N4, beside the label "Intake Below Calc. Req't:" in cell
  M4), and the summary
  sentences of the energy and MBW rows (column AR) quote it, for example "W/
  An Energy Intake 20.00% Below The Calculated Energy Requirement". The figure
  is information only: it is not the percentage, which only the user enters,
  and no limit or band uses it.

#### Energy rules proposed for the code version

**Proposed, pending ratification (provisional steward, 23 October 2026).** The
template is frozen and keeps the rules described above. For the code version, its
successor, the provisional steward proposes the rules below in their place. Every
difference between the code version and the template, rule by rule and note by
note, is recorded in the code version's repository
(`docs/changes-from-21OCT26b.md`, to be published with the code).

Two energies set the limits:

- **Reference energy:** the energy a standard's per-Mcal figures assume, at the
  current body weight: NRC's average adult dog, 130 × BW^0.75 kcal a day, for NRC
  RA Dog Maintenance and AAFCO Dog Maintenance; NRC's lean adult cat,
  100 × BW^0.67, for NRC RA Cat Maintenance and AAFCO Cat Maintenance, whatever
  the cat type; FEDIAF's stated MER for the four FEDIAF adult selections; and for
  every other selection, the energy equation used for its life stage. AAFCO
  states no energy basis, so using NRC's for the AAFCO selections is the
  steward's proposal. The adult dog or cat type never changes the reference
  energy.
- **Energy fed:** the intake entered, or else the calculated requirement (at the
  optimal body weight, when one is used) less any caloric restriction.

The rules:

1. **Body weight** is the current body weight for every animal (for a lactating
   queen, her body weight at mating), not the optimal body weight that the
   template asks for in adults. An optional optimal body weight, for the adult
   maintenance selections only, says that the energy calculated at that weight
   is fed: when it is below the current body weight and no intake is entered, it
   sets the energy fed. It does not lower the energy minimum.
2. **MBW minimums** are converted to per Mcal with the energy fed, so a
   restriction or an optimal body weight raises them too, and the diet still
   supplies the standard's daily amount per kg BW^0.75 or BW^0.67. Fat is the
   exception: neither fat row is raised by a restriction or an optimal body
   weight, because fat per se is not essential.
3. **MBW maximums** are converted with the reference energy (or, where none can
   be calculated, as after week 4 of lactation, with the intake entered). They
   therefore do not change per Mcal with the adult type, an intake, a restriction
   or an optimal body weight, like the maximums a standard states per Mcal: the
   daily ceiling falls with the energy fed.
4. **The energy factor**, reference energy ÷ energy fed, never below 1: under the
   eight adult maintenance selections, on a row with no MBW minimum, the per-Mcal
   minimum is multiplied by the larger of the energy factor and the restriction
   factor. So an intake below the reference energy, or an adult type below NRC's
   average, raises these minimums, the AAFCO minimums among them, as the AAFCO
   selections have no MBW values. The template never raises the minimum of a
   per-Mcal row for an intake. Under the growth, gestation and lactation
   selections, where the animal is fed more energy than it needs to keep its
   weight stable and the extra goes to growth, a pregnancy or milk, nutrient needs
   rise and fall with the energy fed: the per-Mcal minimums hold at any intake,
   and only a restriction raises them.
5. **An energy fed below 10% of the reference energy** is rejected as an input
   error.
6. **The choline maximum** under the four NRC dog selections, NRC's presumed safe
   maximum of 500 mg/Mcal, is at least 1.1 times the higher of the choline
   minimum and the choline MBW minimum converted to per Mcal. A maximum raised
   this way is coded TPL, so a value above it is never `excess`. No standard sets
   a choline maximum from controlled safety data; calcium, whose tight control
   has data behind it, keeps the template's narrower rule (1.1 times the minimum
   only once the minimum is above the maximum).

Each result of the code version states the reference energy and its basis, the
energy fed, the energy factor, and these rules in words.

#### The AAFCO dry matter factor

The 2026 AAFCO profiles presume 4 kcal ME per g of dry matter and state that a
food below that is not corrected for energy: AAFCO compares it with its
dry-matter values. Under the five AAFCO selections, when the energy density
entered under Min on the energy density row (cell G130) is a number above 0
and below 4 kcal/g DM, the template multiplies each minimum that a caloric
restriction raises, and also the fat minimum, by 4 ÷ that energy density, the
AAFCO dry matter factor (cell AS3). Otherwise the factor is 1: with nothing
there, at 4 or more, and under the NRC and FEDIAF selections. At 3.6 kcal/g DM,
for example, the adult cat protein minimum of 65 g/Mcal becomes 65 × 4 ÷ 3.6,
about 72.2 g/Mcal, which is 26% protein in dry matter.

- With a restriction as well, the two factors multiply on each minimum that
  both adjust: minimum = (dry matter factor × restriction factor) × the
  standard's minimum, where the dry matter factor is 4 ÷ energy density and
  the restriction factor is 1 ÷ (1 − restriction ÷ 100), each computed first.
  The fat minimum takes the dry matter factor alone.
- Not multiplied: the energy minimum, energy density, water, vitamin C,
  carbohydrate, the fibers, oxalate, purine and the standard's Ca:P minimum.
  The AAFCO selections have no MBW values.
- Limits computed from the multiplied minimums follow them: the vitamin D2
  minimum for cats, the calculated n-6:n-3 ratio limits, and the calculated
  carbohydrate maximum, which falls as the protein and fat minimums rise.
- Maximums taken from the standard are not changed. They stay per Mcal, the
  template's cautious choice, so a food at an AAFCO dry-matter maximum can
  read above the per-Mcal maximum here. While the factor is above 1, this guide
  counts AAFCO's maximums as conditional (see
  [Maximum types](#maximum-types)).
- The multiplied minimum equals AAFCO's dry-matter value to within the
  rounding between AAFCO's two tables, except for 7 values that AAFCO prints
  differently in them: for cats, valine for growth and reproduction, and
  linoleic acid; for dogs, EPA + DHA, sodium, chloride and selenium for growth
  and reproduction, and selenium for adult maintenance (the template's note on
  cell C130).
- Most summary sentences (column AR) then say so, for example "W/ An AAFCO
  Dry Matter Adjustment: Min x 1.143" at 3.5 kcal/g DM.
- The template's cell rule on both energy density entries accepts a number
  from 2 to 9 kcal/g DM.

#### Limits the template sets or computes

For the rows below, the template sets or computes the minimum or the maximum
itself. Where a maximum is given, it is the range high. "Standard" means the
selected standard's value; a standard's minimum is the adjusted one where a
caloric restriction or the AAFCO dry matter factor adjusts it (above). A limit
of none counts as 0 only where the two
n-6:n-3 ratio rows add or divide limits, and in the ALA rules (the ALA maximum,
and the test of whether the LA limit is above 0). In the ratio
rows, AA is arachidonic acid, EPA eicosapentaenoic acid and DHA
docosahexaenoic acid; EPA + DHA is a single row for their combined total. The
ratio limits use the per-Mcal LA, AA, ALA and EPA + DHA rows, not their MBW
rows.

| Row | Minimum | Maximum |
|---|---|---|
| Energy (kcal/day) | the daily energy requirement, or an entered intake | none: range high 1.55 times the minimum |
| Energy density (kcal/g DM) | 3.5, fixed | 6, fixed: 1.5 times a typical 4 kcal/g DM, not times the minimum |
| Water (g/Mcal) | none | 1416, fixed |
| Medium-chain triglycerides (g/Mcal; per-Mcal and MBW rows) | standard | 17.568, fixed |
| Taurine (g/Mcal; all four taurine rows) | standard | 0.67 on all four rows when the general taurine row (per Mcal) has no minimum, which is every dog selection; otherwise the standard's, each row its own |
| Carbohydrate, by difference (g/Mcal) | standard, else 25 | standard, else the larger of 0 and (1,000 − (4 × protein minimum + 9 × fat minimum)) ÷ 4; 0 means that the protein and fat minimums alone supply all the energy |
| Total dietary, insoluble and soluble fiber (g/Mcal) | standard, else 6.25, 4.75 and 1.5 | standard: range high 6 times the minimum |
| Vitamin C (mg/Mcal) | standard, else 11.25 | standard: range high 4 times the minimum |
| Oxalate and purine (mg/Mcal) | 25 and 200, fixed | none: range high 4 times the minimum |
| Arginine (g/Mcal; per-Mcal and MBW rows) | standard, plus 0.01 (dogs) or 0.02 (cats) for each g/Mcal of protein entered under Min above the protein minimum; NRC and FEDIAF selections only | standard |
| ALA (g/Mcal; per-Mcal and MBW rows) | under the four NRC dog selections listed below: the larger of the standard's and the LA minimum ÷ 16, or ÷ 26 under NRC RA Dog Maintenance; otherwise standard | under the same four: the larger of the standard's and the LA maximum ÷ 2.6; otherwise standard |
| Ca:P | standard, not adjusted | standard, else calcium maximum ÷ phosphorus minimum when both exist and the phosphorus minimum is above 0, else none; when it is none and there is a Ca:P minimum, the range high is 2 times the minimum (K) |
| LA + AA : ALA + EPA + DHA | standard, else (LA + AA minimums) ÷ (ALA + EPA + DHA maximums); none when that divisor is 0 | standard, else (LA + AA maximums) ÷ (ALA + EPA + DHA minimums); 50 when either sum is 0 |
| LA + AA : EPA + DHA | standard, else (LA + AA minimums) ÷ (EPA + DHA maximum); none when that maximum is 0 | standard, else (LA + AA maximums) ÷ (EPA + DHA minimum); 125 when either is 0 |
| Calcium for puppies 4 to 14 weeks old with an adult body weight over 25 kg (g/Mcal) | NRC RA Puppy 4-14 Wk Growth only (otherwise none): the larger of 3 and the body-weight term, (0.54 × the body weight entered for this row, in kg) ÷ (daily energy in kcal ÷ 1,000), or 3 when no body weight above 0 is entered. When a restriction is entered, 3 is first multiplied by 1 ÷ (1 − restriction ÷ 100), and so is the body-weight term unless an intake above 0 is entered; the larger is then taken | none when the minimum is none; otherwise 4.5, or 1.1 times the minimum when the minimum is above 4.5 |
| Vitamin D2 (cats only; per-Mcal and MBW rows) | the vitamin D minimum ÷ 0.7, or none when that is none | the vitamin D maximum, or none when that is none |
| Calcium and Ca:P under FEDIAF Dog Late Growth (>/= 14 wk) | calcium (g/Mcal): the standard's minimum is 2 when the expected mature body weight is above 0 and up to 15 kg, otherwise (including blank or 0) 2.5 (FEDIAF's footnotes); a restriction then adjusts it like other minimums | Ca:P: 1.8 when the expected mature body weight is above 0 and up to 15 kg, otherwise 1.6 |
{:.grid}

The four NRC dog selections for ALA are NRC RA Puppy 4-14 Wk Growth, NRC RA
Puppy 14 Wk+ Growth and NRC RA Dog Late Gestation & Peak Lactation (LA ÷ 16),
and NRC RA Dog Maintenance (LA ÷ 26). The ALA rules apply when the LA limit is
above 0; on the MBW row they apply only under NRC RA Dog Maintenance, the one
of the four with MBW values. For dogs, the vitamin D2 rows have neither limit.
FEDIAF allows puppies with an adult body weight over 15 kg the calcium minimum
of 2 and the Ca:P maximum of 1.8 from about 6 months of age; the template has
no age input, so they keep 2.5 and 1.6 (see
[Template Status and Known Limitations](known-limitations.html)).

#### Greater-than limits

NRC prints some safe upper limits as greater-than values, for example sodium for
adult dogs, greater than 15 g/kg DM. The template enters such a maximum as the
value plus 0.000000001 (here 3.750000001 g/Mcal), an addition its notes call
clinically insignificant and far beyond any measurable precision. Its notes
also state that at 7 decimal places this addition does not change how any value
is described, and that a value equal to the limit is described as Highest (90%
of Range or Greater) with or without it (see [Open points](#open-points),
item 5). One such limit is entered without the addition: NRC's adult dog
iodine limit, printed as at least 4 mg per kg DM. This guide counts NRC's greater-than limits as authoritative, except those
per kg BW^0.67 that NRC states only for its reference kitten (see
[Maximum types](#maximum-types)).

### The 14 bands

#### Band edges

Each band starts at its lower edge.

| Band | Display | Lower edge |
|---|---|---|
| [`below-min-lt25`](CodeSystem-nutrient-decile.html#nutrient-decile-below-min-lt25) | Very Severely Restricted (<25% of Min) | none: open below, negative values included |
| [`below-min-25-50`](CodeSystem-nutrient-decile.html#nutrient-decile-below-min-25-50) | Severely Restricted (25 to <50% of Min) | minimum × 0.25 |
| [`below-min-50-75`](CodeSystem-nutrient-decile.html#nutrient-decile-below-min-50-75) | Moderately Restricted (50 to <75% of Min) | minimum × 0.5 |
| [`below-min-75-100`](CodeSystem-nutrient-decile.html#nutrient-decile-below-min-75-100) | Slightly Restricted (75 to <100% of Min) | minimum × 0.75 |
| [`range-d1`](CodeSystem-nutrient-decile.html#nutrient-decile-range-d1) | Lowest/Just Above Min (Min to <10% of Range) | base |
| [`range-d2`](CodeSystem-nutrient-decile.html#nutrient-decile-range-d2) | Lower (10 to <20% of Range) | ((range high − base) × 0.1) + base |
| [`range-d3`](CodeSystem-nutrient-decile.html#nutrient-decile-range-d3) | Low (20 to <30% of Range) | ((range high − base) × 0.2) + base |
| [`range-d4`](CodeSystem-nutrient-decile.html#nutrient-decile-range-d4) | Low Moderate (30 to <40% of Range) | ((range high − base) × 0.3) + base |
| [`range-d5`](CodeSystem-nutrient-decile.html#nutrient-decile-range-d5) | Mid Moderate (40 to <50% of Range) | ((range high − base) × 0.4) + base |
| [`range-d6`](CodeSystem-nutrient-decile.html#nutrient-decile-range-d6) | High Moderate (50 to <60% of Range) | ((range high − base) × 0.5) + base |
| [`range-d7`](CodeSystem-nutrient-decile.html#nutrient-decile-range-d7) | High (60 to <70% of Range) | ((range high − base) × 0.6) + base |
| [`range-d8`](CodeSystem-nutrient-decile.html#nutrient-decile-range-d8) | Higher (70 to <80% of Range) | ((range high − base) × 0.7) + base |
| [`range-d9`](CodeSystem-nutrient-decile.html#nutrient-decile-range-d9) | Near Highest (80 to <90% of Range) | ((range high − base) × 0.8) + base |
| [`range-d10`](CodeSystem-nutrient-decile.html#nutrient-decile-range-d10) | Highest (90% of Range or Greater) | ((range high − base) × 0.9) + base; no upper edge |
{:.grid}

- On a row with no minimum, the edges at 0.25, 0.5 and 0.75 of the minimum, and
  the base, are all 0.
- Each decile edge is computed in the order shown: range high minus base, times
  the fraction, plus base.
- The template also shows an upper edge for each band, just below the next
  band's lower edge (for example the minimum × 0.249999999). No comparison uses
  these upper edges; only the lower edges count.

#### Which band a value is in

Going up from the second band, the template checks whether the value is below
that band's lower edge. The first time it is, the value is in the band before
it. If it never is, the value is in `range-d10`. So:

- Each band runs from its lower edge, included, up to the next band's lower
  edge, excluded. A value exactly on an edge is in the band that starts there,
  as the labels' "to <" wording says.
- The first band takes every value below 25% of the minimum, negative values
  included (a carbohydrate by difference can be negative).
- Unless the row's maximum is below its minimum (see
  [A maximum below the minimum](#a-maximum-below-the-minimum)), the top band
  takes every value at or above its lower edge, including every value above
  the range high.
- Where two edges are equal, the band between them is empty. On a row with no
  minimum, the 25 to 50, 50 to 75 and 75 to 100% bands are empty: a value of
  0 or more goes straight to the deciles, and only a negative value is below
  them, in `below-min-lt25`.
- The template does not compute a percentage of the range. A checker that does,
  and compares it with 10%, 20% and so on, can put a value very close to an
  edge in a different band.

#### Comparing at 7 decimal places

Every band test, and each comparison in the "No range" check, is made at 7
decimal places. The entered value and each band edge are both rounded to 7
decimal places before they are compared (the rounding is clinically
insignificant and far beyond any measurable precision), so the result does not
depend on how a spreadsheet or program handles the last binary digit of a
computed edge. For example, the 80% calcium edge under NRC RA Dog Maintenance
(1 to 4 g/Mcal) is 3.4, but the template computes it as ((4 − 1) × 0.8) + 1,
which in binary floating point comes out as 3.4000000000000004; an exact
comparison would place an entered 3.4 one band low.

The template's spreadsheet application rounds in two steps: it first takes
the stored value to its decimal form with 15 significant digits, and then
rounds that decimal to 7 places, half away from zero, negatives too. This
matters only for a value or an edge that falls exactly halfway at the eighth
decimal place: 0.99999995 against a minimum of 1 is `range-d1`. A program
that rounds the stored binary value, just under 0.99999995, gets
`below-min-75-100` instead. So Python, Rust or any other code must round the
same way, not the stored binary value, to give the template's bands (see
[Open points](#open-points), item 8).

- Other comparisons are not rounded: the no-minimum check, which compares an
  entry under Min with 0; the comparisons inside the limit formulas (for
  example the protein entered under Min against the protein minimum, for
  arginine); and the LA:ALA and EPA text checks. The DHA text check compares
  at 7 decimal places (see [Open points](#open-points), item 16).
- This rounding is part of the comparison, not the formulation rounding that
  the guide leaves out of scope.
- Displayed values are rounded too: band edges show two decimals, and minimums
  and maximums show their cells' formats. The comparison uses the computed
  limits, not the displayed ones. The template's own example: a minimum of
  25.2307692 g/Mcal displays as 25.23, so an entered 25.23 is below the
  minimum and is in `below-min-75-100`.

### Rows with no minimum

On a row with no minimum, the two entries are treated differently.

- **Under Max**, when the row has a maximum, the deciles run from 0 to the
  maximum: a negative value is in `below-min-lt25`, and 0 is in `range-d1`.
  Under NRC RA Dog Maintenance this applies to taurine (maximum 0.67 g/Mcal),
  medium-chain triglycerides (17.568 g/Mcal) and water (1416 g/Mcal). When the
  row has no maximum either, the value is "No range" (see
  [Rows with no range](#rows-with-no-range)).
- **Under Min** (on every such row but water), anything but "none" or a
  negative number gets the text "No min
  requirement &/or no min amount entered to describe" instead of a band,
  including nothing entered and an entry that is not a number. This check comes
  before the blank check, and the spreadsheet counts an empty entry as 0 and
  ranks text above every number. A negative value goes on to the "No range"
  test and the band test.

The water row describes only a value entered under Max. The template does not
say which of the two entries a single diet value is, or what a below-minimum
band means on a row with no minimum (see [Open points](#open-points)).

### Rows with no range

A value is described as "No range" instead of by a band when all three of these
hold (the comparisons at 7 decimal places):

1. the row has no maximum;
2. its range high is not above the base;
3. the row has no minimum, or the value is at or above the minimum.

A value below a stated minimum keeps its below-minimum band.

In Version 21OCT26, as long as the daily energy is above 0, every "No range"
case is a row with neither a minimum nor a maximum, where the range high and
the base are both 0. Under NRC RA Dog Maintenance, for example, the Ca:P ratio
has neither limit, so a ratio of 1.2 entered under Max is described as
"No range". On such a row, an entry under Min other than "none" or a negative
number gets the no-minimum text instead, because that check comes first.

### A maximum below the minimum

The template does not check that the range high is above the minimum. If a
row's maximum is below its minimum, the row is not "No range", because it has a
maximum. Its decile edges then run downward from the minimum: every value at or
above the minimum is in `range-d10`, and values below the minimum keep their
below-minimum bands.

This can happen when caloric restriction raises a minimum above a standard's
maximum, when the AAFCO dry matter factor raises an AAFCO minimum above
AAFCO's maximum, or when the computed carbohydrate maximum falls below its
25 g/Mcal minimum. The computed carbohydrate maximum does not go below 0
(since Version 21OCT26), and the fat minimum no longer rises with a
restriction. At a 55% restriction the carbohydrate maximum is below 25 g/Mcal
under one selection, FEDIAF Cat (MER 75 kcal/kg^0.67) (14.3 g/Mcal). With the dry matter factor and no restriction, it is below 25 g/Mcal under
AAFCO Cat Maintenance below an energy density of about 2.06 kcal/g DM, and
under AAFCO Cat Growth and Reproduction below about 2.23 kcal/g DM (0 at
2 kcal/g DM); with a 55% restriction as well, it is 0 under all five AAFCO
selections at 2 kcal/g DM. These cases are listed for the governance body (see
[Conflicts for the governance body](#conflicts-for-the-governance-body)).

### Outcomes other than a band

The template checks each entry in the order below. The first step that applies
gives the description. Its cell rules accept only numbers in the Min and Max
entries of the nutrient rows, so "none" and other text reach them only another
way (a paste can replace a cell's rule); the steps below still apply then.

Under Min (the water row has no description under Min):

1. "none": blank.
2. On a row with no minimum, anything but a negative number, including nothing
   entered: the no-minimum text.
3. Nothing entered, or an entry that is not a number: blank.
4. The "No range" test (see [Rows with no range](#rows-with-no-range)).
5. The band test: one of the 14 bands.

Under Max:

1. "none": "none".
2. Nothing entered, or an entry that is not a number: blank.
3. The "No range" test.
4. The band test: one of the 14 bands.

While the selection's energy equation lacks an input, and no intake is entered
in K4 instead, the energy minimum (cell C11) shows a message instead of a
number (an intake in K4 replaces every message in the table but the last):

| Message | When |
|---|---|
| No Dog Type Selection on Standards Sheet | NRC RA Dog Maintenance or AAFCO Dog Maintenance, with no type of dog chosen (cell B4). For a bitch's maintenance energy in gestation, NRC RA Dog Late Gestation & Peak Lactation and AAFCO Dog Growth (Small & Medium) and Reproduction use 130 × BW^0.75 instead. |
| No Cat Type Selection on Standards Sheet | NRC RA Cat Maintenance or AAFCO Cat Maintenance, with no type of cat chosen (cell D4) |
| Expected Mature BW in Standards Sheet Needed | the growth equations that use the expected mature body weight (cell E3), with none entered: NRC RA Puppy 4-14 Wk Growth, NRC RA Puppy 14 Wk+ Growth, FEDIAF Dog Early Growth (< 14 wk) & Reproduction (for growth), FEDIAF Dog Late Growth (>/= 14 wk), NRC RA Kitten Growth and FEDIAF Cat Growth |
| Expected Mature BW Must Be At Least Current BW | the same equations, with a body weight above the expected mature body weight |
| Standards Sheet Needs A Life Stage This Selection Covers | the two AAFCO dog growth selections with no life stage chosen (cell M3); and AAFCO Dog Growth (Small & Medium) and Reproduction, AAFCO Large Breed Dog Growth, AAFCO Cat Growth and Reproduction, FEDIAF Dog Early Growth (< 14 wk) & Reproduction and NRC RA Dog Late Gestation & Peak Lactation with a life stage they do not cover (for example a number of kittens under a dog selection) |
| Standards Sheet Needs Lactation Wk & Puppy # | a lactating bitch (life stage Lactation: bitch) with no week of lactation (cell K3) or no number of puppies nursing (cell G3) |
| No NRC/FEDIAF Estimate After Lactation Wk 4: Use K4 | a lactating bitch in weeks 5 to 7, for which NRC and FEDIAF give no estimate: enter her intake in K4 |
| Standards Sheet Needs Lactation Wk & Kitten # | NRC RA Cat Peak Lactation, and FEDIAF Cat Reproduction outside gestation, with no week of lactation or no number of kittens (cell M3), or with a life stage they do not cover; AAFCO Cat Growth and Reproduction with a number of kittens chosen but no week of lactation |
| Select A Requirement In O1 | nothing in cell O1, or text that is not a selection's name; the other rows then show #N/A |
{:.grid}

While C11 shows a message, the energy row's band edges and descriptions are
blank (Version 18OCT26 showed errors there). Errors replace the descriptions
on the MBW rows that have values, and on the large-breed puppy calcium row once
a puppy body weight is entered. The template's cell rule on the body weight
accepts only a number from 0.05 to 150 kg, so it rejects a typed 0, negative
numbers and text. A blank, or a 0 that reaches the cell another way (a paste
can replace the cell's rule), gives no message: the daily energy is then 0,
the MBW rows that have values show errors, and an energy entry of 0 or more
reads "No range" (see [Open points](#open-points), item 10).

Nutrient Decile Bands has no code for any outcome other than a band (see
[Open points](#open-points), item 1).

### Bands and the adequacy interpretation

The template gives bands only. The per-nutrient interpretation is set by this
guide's
[Animal Nutrient Adequacy Assessment](StructureDefinition-animal-nutrient-adequacy.html)
profile, using the
[Adequacy Interpretation](CodeSystem-adequacy-interpretation.html) and
[Maximum Provenance Codes](CodeSystem-maximum-provenance-code.html) code
systems.

| Diet value | Band | Interpretation |
|---|---|---|
| Below a minimum set by the applied standard, including one raised for a caloric restriction or by the AAFCO dry matter factor (for 7 AAFCO values, see below), and the arginine and large-breed puppy calcium minimums (below) | `below-min-lt25` to `below-min-75-100` | [`deficient`](CodeSystem-adequacy-interpretation.html#adequacy-interpretation-deficient) |
| At or above the minimum, up to the range high | `range-d1` to `range-d10` | [`adequate`](CodeSystem-adequacy-interpretation.html#adequacy-interpretation-adequate) |
| Above a range high that is not an authoritative maximum, and not below the minimum: maxProvenance is `conditional`, `template-set` or `derived-provisional` (see [Maximum types](#maximum-types)) | `range-d10` | `adequate` |
| Above an authoritative maximum, and not below a minimum set by the applied standard, including one raised for a caloric restriction or by the AAFCO dry matter factor: maxProvenance is `authoritative` | `range-d10` | [`excess`](CodeSystem-adequacy-interpretation.html#adequacy-interpretation-excess) |
| Below a minimum raised for a caloric restriction or by the AAFCO dry matter factor, and above a maximum | `below-min-lt25` to `below-min-75-100` | `deficient` |
{:.grid}

The table pairs bands with interpretations away from rounding boundaries. At a
boundary the two can differ: bands compare at 7 decimal places, and whether the
interpretation tests do is open (see [Open points](#open-points), item 7).

- **Caloric restriction.** Where the template raises a standard's minimum for a
  caloric restriction, referenceRange.low holds the raised minimum, and the
  band is computed from it, as in the template. So the value, the range and
  the band agree. A value below the raised minimum is `deficient`, even if it
  meets the minimum that applies with no restriction. Whether this test
  compares at 7 decimal places is open (see [Open points](#open-points),
  item 7).
- **The AAFCO dry matter factor.** Where the factor raises an AAFCO minimum,
  the raised minimum is AAFCO's own dry-matter minimum for the food, expressed
  per Mcal, so it counts as the applied standard's: referenceRange.low holds
  it, and a value below it is `deficient`. The exception is the 7 values that
  AAFCO prints differently in its two tables, whose raised minimum is not
  AAFCO's printed dry-matter value: for them this is open (see
  [Open points](#open-points), item 6).
  While the factor is above 1, AAFCO's maximums are `conditional` (see
  [Maximum types](#maximum-types)).
- **A raised minimum above a maximum.** From a restriction of about 30%, a
  raised minimum can exceed a maximum taken from a standard: above 29.6%,
  FEDIAF's legal maximum for selenium (conditional) under the two FEDIAF dog
  growth selections, and above 32%, the first authoritative one, the choline
  maximum under the four NRC dog selections (under the energy rules proposed for
  the code version, that maximum rises with the minimum instead; see
  [A maximum below the minimum](#a-maximum-below-the-minimum) and
  [Conflicts for the governance body](#conflicts-for-the-governance-body)). A
  value below the raised minimum and above that maximum is `deficient`, and
  its band is below the minimum. The excess stays visible: the value is above
  referenceRange.high, and maxProvenance says which kind of maximum it is.
- **Arginine and large-breed puppy calcium.** The template computes these
  minimums from a standard's own rule: arginine's increase for protein (NRC and
  FEDIAF selections) and, for the puppy row, footnote h to Table 15-3 of the
  2006 NRC (at least 0.54 g of calcium per kg of body weight a day). These two
  count as the applied standard's, with or without a restriction; the other
  computed minimums stay open (below). referenceRange.low holds them, and a
  value below one of them is `deficient`.
- **Recording the restriction.** A verdict checked under a caloric restriction
  above 0 records the percentage in the
  [Caloric Restriction](StructureDefinition-caloric-restriction.html)
  extension. An entered intake is not a restriction and is not recorded there
  (see [Open points](#open-points), item 12).
- **What these rules do not reach.** Whether a value below the other minimums
  that the template supplies or computes is `deficient` is open (see
  [Open points](#open-points), item 6).
- There is no 15th band for values above the range high. A value there that is
  not below the minimum is in `range-d10`, whoever set the ceiling, so
  `range-d10` alone does not say whether a value is above it.
  referenceRange.high holds the ceiling, and
  [maxProvenance](StructureDefinition-maximum-provenance.html) says what kind
  of maximum it is.
- maxProvenance is
  [`authoritative`](CodeSystem-maximum-provenance-code.html#maximum-provenance-code-authoritative),
  [`conditional`](CodeSystem-maximum-provenance-code.html#maximum-provenance-code-conditional),
  [`template-set`](CodeSystem-maximum-provenance-code.html#maximum-provenance-code-template-set)
  or
  [`derived-provisional`](CodeSystem-maximum-provenance-code.html#maximum-provenance-code-derived-provisional),
  by the type of the range high (below). Only above an `authoritative`
  maximum is a value `excess`.

#### Maximum types

The template records the type of every maximum it takes from a standard beside
it, in columns AU to BO of the Healthy Dog Cat Reqt Data tab (one column per
selection; 333 maximums in Version 21OCT26). Its notes on cell AU3 of that tab
and cell E5 of the Standards tab define the codes and state this guide's
grouping of them into the four Maximum Provenance codes. The grouping is the
provisional steward's proposal, pending ratification.

| Template code | Kind of maximum | Cells | maxProvenance |
|---|---|---|---|
| SUL | a 2006 NRC safe upper limit (SUL), per Mcal as printed or converted by NRC's own unit factors | 52 | `authoritative` |
| SUL> | an NRC SUL printed as a lower bound: a greater-than value, entered with the 0.000000001 addition, or NRC's adult dog iodine limit of at least 4 mg per kg DM, entered without it | 17 | `authoritative` |
| SULm, SULm> | the same per kg BW^0.75 or BW^0.67, converted to per Mcal with the daily energy (no cell is SULm> in Version 21OCT26) | 12 | `authoritative` |
| PSM | NRC's presumed safe maximum for choline, given in its text, not its tables (2006 NRC page 233): 500 mg/Mcal, under the four NRC dog selections only; for the code version the steward proposes at least 1.1 times the higher choline minimum, then coded TPL (see [Energy rules proposed for the code version](#energy-rules-proposed-for-the-code-version)) | 4 | `authoritative` |
| AAFCO | a 2026 AAFCO profile maximum | 44 | `authoritative`; all 44, the Ca:P maximum included, `conditional` while the AAFCO dry matter factor is above 1 |
| N | a FEDIAF nutritional maximum | 42 | `authoritative` |
| N* | a FEDIAF nutritional maximum used beyond the life stage it is stated for: the FEDIAF Dog Late Growth Ca:P maximum, and the FEDIAF Cat Reproduction arginine, methionine, tryptophan and Ca:P maximums, which FEDIAF's Table III-4b states for growth | 5 | `conditional` |
| SULm* | an NRC SUL per kg BW^0.67, as printed or as a greater-than value, that NRC states only for its reference kitten or queen, used for every kitten (NRC RA Kitten Growth) or queen (NRC RA Cat Peak Lactation) | 23 | `conditional` |
| L | a FEDIAF EU legal maximum: per kg DM, for nutrients added as additives only, converted at 4 kcal/g DM | 64 | `conditional` |
| FSL | a safe level from a FEDIAF table footnote, not marked as a nutritional or legal maximum (sodium under the FEDIAF selections, chloride under the FEDIAF dog selections) | 12 | `conditional` |
| EST | the template's own estimate (for example the NRC adult dog sodium, chloride and iodine maximums per kg BW^0.75) | 6 | `template-set` |
| CALC | calculated by the template from other limits (for example the FEDIAF adult MBW maximums, and the NRC RA Cat Late Gestation MBW maximums, as NRC prints no late gestation SUL) | 52 | `template-set` |
| TPL | set or computed on the Standards tab (see [Limits the template sets or computes](#limits-the-template-sets-or-computes)), other than a copy of a coded maximum (below) | | `template-set` |
| K | no maximum: the range high is the minimum times K | | `derived-provisional` |
{:.grid}

- **Authoritative** means set by a standards body for the animal and the use
  it is applied to. In Version 21OCT26 every authoritative maximum is the
  applied standard's own. NRC's greater-than SULs and its SULs per kg BW^0.75
  or BW^0.67 count, except those NRC states only for its reference kitten or
  queen (SULm*), as does NRC's presumed safe maximum for choline: where safety
  data are lacking, the provisional steward uses any data that suggest
  possible toxicity until better data exist. AAFCO's maximums count except
  while the AAFCO dry matter factor is above 1.
- **Conditional** means a standard's figure that is not a maximum for every
  diet and animal the selection covers: a maximum that applies only under a
  condition the template cannot check (FEDIAF's legal maximums apply only to
  nutrients added as additives), one used beyond the life stage or reference
  animal it is stated for, a level that a FEDIAF footnote states to be safe
  without making it a maximum, and AAFCO's maximums while the AAFCO dry matter
  factor is above 1 (AAFCO then compares the food with its dry-matter values,
  while the template keeps the maximums per Mcal). A value above a conditional
  maximum is not `excess`; at or above the minimum it is described as Highest
  (90% of Range or Greater) and is `adequate`.
- A range high read from a coded maximum takes that maximum's code, and so
  does a maximum that copies one: the vitamin D2 maximum for cats takes the
  type of the vitamin D maximum it copies, and the large-breed puppy calcium
  maximum of 4.5 g/Mcal takes the type of NRC's calcium safe upper limit
  (SUL), so a value above either can be `excess`. A range high that the
  Standards tab sets or computes otherwise is `template-set` (TPL): the fixed
  water, energy density and medium-chain triglyceride maximums, the taurine
  default of 0.67, the computed carbohydrate, Ca:P, n-6:n-3 ratio and ALA
  maximums, and the large-breed puppy calcium maximum when it is 1.1 times the
  minimum. Under the four NRC dog selections no standard sets an ALA maximum
  in Version 21OCT26, so their ALA maximum is always the LA-based value.
- Up to Version 18OCT26 the template recorded no types, and this guide counted
  only a maximum "set by the applied standard" as authoritative, leaving the
  kinds above open.

### Worked example

Calcium under NRC RA Dog Maintenance, with no caloric restriction:

- The minimum is 1 g/Mcal. The standard sets no maximum, and K is 4.
- The base is 1, and the range high is 4 × 1 = 4 g/Mcal, a derived-provisional
  ceiling.
- The lower edges are 0.25, 0.5 and 0.75 below the minimum, then 1, 1.3, 1.6,
  1.9, 2.2, 2.5, 2.8, 3.1, 3.4 and 3.7 for `range-d1` to `range-d10`.

| Diet value (g/Mcal) | Band | Interpretation |
|---|---|---|
| 0.9 | `below-min-75-100` | `deficient` |
| 1 | `range-d1` | `adequate` |
| 3.4 | `range-d9` | `adequate` |
| 4 | `range-d10` | `adequate` |
| 5 | `range-d10` | `adequate`: above the derived-provisional ceiling of 4, so not `excess` |
{:.grid}

The value 3.4 lies exactly on the 80% edge from the rounding example above. The
template computes that edge as 3.4000000000000004. At 7 decimal places it is
3.4, so the value is in `range-d9`, the band that starts there.

With a 25% caloric restriction entered, the minimum becomes 1 × 4/3 =
1.3333333 g/Mcal at 7 decimal places, and the range high, still a
derived-provisional ceiling, becomes 4 times that, 5.3333333 g/Mcal. The lower
edges are 0.3333333, 0.6666667 and 1 below the minimum, then 1.3333333 for
`range-d1`, rising by 0.4 to 4.9333333 for `range-d10`.

| Diet value (g/Mcal) | Band | Interpretation |
|---|---|---|
| 0.9 | `below-min-50-75` | `deficient` |
| 1 | `below-min-75-100` | `deficient` |
| 1.2 | `below-min-75-100` | `deficient` |
| 1.34 | `range-d1` | `adequate` |
| 4 | `range-d7` | `adequate` |
{:.grid}

The values 1 and 1.2 meet NRC's minimum, and with no restriction they are in
`range-d1`. At the restricted intake they supply 75% and 90% of the calcium
that 1 g/Mcal supplies each day at the animal's full energy need, so they are
`deficient`. The verdict records 25% in caloricRestriction, and calcium's
referenceRange.low holds the raised minimum, as in this guide's example
[Adult-maintenance adequacy under a 25% caloric restriction, canine, vs NRC](Observation-ExampleRestrictedMaintenanceAdequacy.html)
for the value 1.2.

This guide's example
[Adult-maintenance adequacy, canine, vs AAFCO](Observation-ExampleAdultMaintenanceAdequacy.html)
follows the same computation under AAFCO Dog Maintenance. Calcium at 2.0 g/Mcal,
against a minimum of 1.25 and an authoritative maximum of 6.25, is in
`range-d2` (edges 1.75 to below 2.25). Potassium at 2.5 g/Mcal, against a
minimum of 1.5 and a derived-provisional ceiling of 6.0 (4 × 1.5), is in
`range-d3` (edges 2.4 to below 2.85).

### Open points

The template does not settle the points below. This page decides none of them
in full: where one of its rules settles part of a point, the item points to
that rule and lists what is still open.

1. **Recording "No range" and the other outcomes.** Nutrient Decile Bands has
   no code for "No range", the no-minimum text, a blank, "none" or an error
   (see [Outcomes other than a band](#outcomes-other-than-a-band)). How a
   verdict records each of them is not stated.
2. **Which entry a diet value is.** The template takes a value under Min and a
   value under Max on each row and describes each separately; its entry heading
   adds "(If No Req't Min, Put In Range)". It does not say which entry a single
   analysed or calculated diet value uses. The two differ on rows with no
   minimum, on the water row, on the protein rows (only the Min entry
   raises the arginine minimums) and on the energy density row (only the Min
   entry sets the AAFCO dry matter factor). When both are described, the row's summary
   sentence (column AR) joins the two descriptions with "to".
3. **A below-minimum band on a row with no minimum.** A negative value on a row
   with no minimum but with a maximum, entered under Min or Max, is in
   `below-min-lt25` although the row has no minimum (on a row with neither
   limit it is "No range"). What that band means there, and whether the value
   is `deficient`, is not stated.
4. **Which maximums are authoritative.** Proposed, pending ratification: see
   [Maximum types](#maximum-types). The grouping follows the template's type
   codes. The template has no input for the conditions of conditional
   maximums (whether a nutrient is added as an additive, the animal's age, its
   breed), so none of them is checked (see
   [Template Status and Known Limitations](known-limitations.html)).
5. **Greater-than limits.** Whether a verdict records an NRC greater-than limit
   as the printed value or with the template's added 0.000000001. Such a limit counts as authoritative, except one that NRC states only for
   its reference kitten (see [Maximum types](#maximum-types)). The
   template's notes state that both give the same bands. Strictly, the
   addition shifts each decile edge by up to 0.0000000009 (times the
   conversion factor on an MBW row), so it can still move a rounded edge by
   0.0000001 (a difference that is clinically insignificant and far beyond any
   measurable precision) when an edge lies that close to a rounding boundary,
   as caloric restriction or a large conversion factor can make it do; the
   notes' statement is a practical one.
6. **Minimums the template supplies or computes.** The template supplies
   minimums where the selected standard gives none (vitamin C, carbohydrate,
   the fibers, oxalate, purine, energy density) and computes others (the
   energy minimum, the ALA floor from LA, vitamin D2, the two n-6:n-3 ratio
   rows). Its notes say that none of the supplied minimums is a requirement of
   the standards, and the oxalate and purine minimums come from human upper
   intake recommendations. The profile describes referenceRange.low as the
   requirement minimum, and this guide has no provenance flag for minimums.
   Whether a value below such a minimum is `deficient`, with or without a
   restriction, and whether such a minimum goes in referenceRange.low, is not
   stated. Nor is it stated for the 7 AAFCO values whose minimum, multiplied
   by the AAFCO dry matter factor, corresponds to a dry-matter value other
   than the one AAFCO prints (see
   [The AAFCO dry matter factor](#the-aafco-dry-matter-factor)). Raised
   standard minimums, minimums raised by the dry matter factor, arginine and
   the large-breed puppy calcium row are covered by the rules under
   [Bands and the adequacy interpretation](#bands-and-the-adequacy-interpretation).
7. **Precision of `deficient` and `excess`.** The template's descriptions have
   no test for "above the maximum"; its colouring compares the value with the
   range high at 7 decimal places (above it, only the range-high cell is
   coloured). Whether this guide's "below the minimum" and "above the maximum"
   tests use 7 decimal places is not stated. It matters for many raised
   minimums: at 25%, calcium at 1.3333333 g/Mcal under NRC RA Dog Maintenance
   is in `range-d1`, but below the exact minimum, 4/3.
8. **Rounding and arithmetic.** Answered for the template (see
   [Comparing at 7 decimal places](#comparing-at-7-decimal-places)): its
   spreadsheet application takes a value to its 15-significant-digit decimal
   form and rounds that, half away from zero, negatives too. The provisional
   steward checked this in a blank sheet of the same application on 19
   October 2026: `=ROUND(1.005,2)` shows 1.01, `=ROUND(-1.005,2)` shows −1.01,
   and `=ROUND(0.145*3,2)` shows 0.44, although 0.145 × 3 is stored as
   0.43499999999999994 (0.435000000000000 to 15 significant digits). Code that
   is to give the template's bands must round the same way, not the stored
   binary value. Still open: how the first step breaks an exact tie at the
   15th significant digit (not checked), and the number type (binary floating
   point or decimal), as the template fixes the order of operations but not
   the type; after rounding to 7 decimal places these matter only at ties.
9. **Precision of recorded limits.** The template compares with the computed
   limits (at 7 decimal places), not with the rounded figures it displays. A
   verdict's referenceRange can carry rounded ones (a minimum of 25.2307692
   recorded as 25.23), which can change the band of a value near that limit.
10. **Invariants and validation.** No formula checks that the minimum is below
    the range high, that values and limits are not negative, that the daily
    energy is above 0, or that K is above 0. The template's cell rules check some typed inputs: the selection, the type
    of dog and the type of cat (lists), the caloric restriction (0, or a
    number from 1 to 55), the life stage (a list), the week of lactation (a whole number from 0 to 7)
    and the number of puppies nursing (a whole number from 0 to 20). Besides
    the caloric restriction, life-stage, lactation week and puppy count rules,
    the template's cell rules reject text and numbers outside set ranges in
    body weight (0.05 to 150 kg), expected mature body weight (0.5 to 150 kg),
    an entered intake (10 to 30,000 kcal/day), the puppy body weight for the
    large-breed calcium row (0.5 to 50 kg) and energy density entered under
    Min or Max (2 to 9 kcal/g DM), and they reject text in the other Min and
    Max entries of the nutrient rows. A rule checks only what is typed into its
    own cell: not a blank, not a value that reaches the cell another way (a
    paste can replace the cell's rule), and not a combination of inputs. Under
    the growth selections that use the expected mature body weight, a body
    weight above it gives the message "Expected Mature BW Must Be At Least
    Current BW" instead of an energy; without that message the daily energy
    would be 0 or negative above 1.88 times the expected mature body weight
    under FEDIAF's puppy equation, 2.20 times under NRC's kitten equation and
    2.65 times under NRC's puppy equation. When a maximum falls below the
    minimum, a value between the two is both below the minimum and above the
    maximum. Where a caloric restriction or the AAFCO dry matter factor raises
    a standard's minimum above its maximum, such a value is `deficient` (see
    [Bands and the adequacy interpretation](#bands-and-the-adequacy-interpretation));
    in other cases, such as carbohydrate, no rule says which interpretation
    applies. Whether any rule on this page becomes a validator-checked
    invariant or stays in narrative is not decided.
11. **Several reference ranges for one nutrient.** The template bands each row
    on its own: per-Mcal and MBW rows; general rows and rows for foods of more
    than 12% moisture (taurine, copper, selenium); calcium and the
    large-breed puppy calcium row; vitamin D and vitamin D2, whose combined
    total the template says it does not compute; retinol for cats and vitamin A
    for dogs. Two cases follow from the rules under
    [Bands and the adequacy interpretation](#bands-and-the-adequacy-interpretation):
    a value below a standard's minimum raised for a caloric restriction is
    `deficient` even if it meets the nutrient's MBW row, which the restriction
    does not raise, and a value below the large-breed puppy calcium minimum is
    `deficient` even if it meets the general calcium row. Otherwise, which row
    decides a verdict is not stated, nor whether a component may carry more
    than one referenceRange, or which range maxProvenance then describes: FHIR
    reads several reference ranges as alternatives, so in the two cases above a
    second range from the MBW or general calcium row would read as met.
12. **Inputs a verdict needs.** The limits depend on the selection, the caloric
    restriction, body weight (for adults, the optimal body weight), the type of
    dog or cat, an intake entered in place of the calculated requirement, the
    expected mature body weight, the life stage, the week of lactation, the
    number of puppies nursing, the puppy body weight for the large-breed
    calcium row, the protein entered under Min (for arginine) and, under the
    AAFCO selections, the energy density entered under Min (for the AAFCO dry
    matter factor). The profile records the standard and its edition (item
    13), the life stage and the caloric restriction, as a percentage (see
    [Bands and the adequacy interpretation](#bands-and-the-adequacy-interpretation)),
    but none of the other inputs, including an entered intake and the energy
    density. While the energy equation lacks an input, the template shows a
    message instead of the energy minimum (see
    [Outcomes other than a band](#outcomes-other-than-a-band)) and defines no
    fallback.
13. **Selections and editions.** The 21 selections do not map one to one onto
    this guide's [Requirement Standards](CodeSystem-requirement-standard.html)
    and [Life Stages](CodeSystem-life-stage.html) codes: for example FEDIAF
    adult dogs at a maintenance energy requirement (MER) of 95 or 110
    kcal/kg^0.75, NRC puppies 4 to 14 weeks old or 14 weeks and older, AAFCO
    small-and-medium or large-breed growth, and NRC cat late gestation or peak
    lactation. The NRC selections use NRC's recommended allowances, except
    where the template's notes say otherwise (for example choline under the
    four NRC dog selections, which use NRC's adequate intake of 340 mg/Mcal;
    2006 NRC page 233). The template cites the 2006 NRC, the 2026 AAFCO
    Official Publication and FEDIAF's September 2025 guidelines. The
    Requirement Standards code system has a code for each of these editions
    (`NRC-2006`, `AAFCO-2026` and `FEDIAF-2025`), under the code of its body, so
    a verdict can record the edition it was checked against. Which selection
    within a standard and life stage a verdict used is not recorded.
14. **Converting diet values to the basis.** The template compares per Mcal and
    has no conversion from a diet's dry-matter or as-fed values to per Mcal.
    Its converter tab converts one amount at a time, by hand, the other way:
    from per Mcal to per kg of dry matter, for an entered energy density.
15. **Limits outside the template's columns.** Limits that exist only on a
    dry-matter basis, for a product category or for part of a nutrient have no
    column: for example AAFCO's calcium maximum of 1.8% DM for some
    all-life-stages dog foods, AAFCO's limit on phosphorus from soluble sources
    for cats (the template's note on cell B67 of the Standards tab), and the
    limits on added selenium (see
    [Template Status and Known Limitations](known-limitations.html)).
16. **Text checks.** The template's LA:ALA and EPA share checks, and its
    check that DHA (EPA + DHA minus EPA) meets NRC's minimum for adult cats
    (NRC's EPA + DHA value there is DHA only), return text, not bands. The
    LA:ALA and EPA checks compare without rounding; the DHA check compares at
    7 decimal places. Whether these checks are part of a verdict is not
    stated.
17. **Ratio nutrients.** The template bands the Ca:P and the two n-6:n-3 ratio
    rows like any other row. The profile includes ratio nutrients such as Ca:P
    as components and excludes non-linear ratio nutrients, but neither the
    profile nor the template says which ratios are non-linear, so whether the
    two n-6:n-3 ratio rows are in scope is not stated.
18. **Coverage.** Species other than dogs and cats, and nutrients outside the
    template's rows.
19. **Overall verdict.** The profile's top-level interpretation is the overall
    complete-and-balanced verdict. How it follows from the per-nutrient
    results, and from the outcomes in item 1, is not stated.
20. **ALA under caloric restriction.** Settled in Version 21OCT26: a caloric
    restriction raises ALA's own per-Mcal minimum like the other minimums,
    before it is compared with the floor from LA under the four NRC dog
    selections (see [Caloric restriction](#caloric-restriction)). Under those
    four, whether a value below the floor is `deficient` is item 6.

#### Conflicts for the governance body

The standards bodies could not foresee every use of their figures. Where
applying a stated rule gives conflicting results in some use case, the
template and this page apply the rule as decided, and the conflict is listed
here for the governance body to refine or resolve. The examples use the
template's default inputs (body weight 15 kg for dogs) unless stated.

1. **NRC's safe upper limits per kg BW^0.75 and per Mcal.** Both are
   authoritative, but a limit per kg BW^0.75 converted with an animal's energy
   differs from the per-Mcal one for animals far from NRC's average. Under NRC
   RA Dog Maintenance, the fat limit per kg BW^0.75 converts to
   54 g/Mcal for a dog of the Great Dane type (200 kcal per kg BW^0.75), below
   NRC's 82.5 g/Mcal, and to 113.7 g/Mcal for an inactive dog (95 kcal per kg
   BW^0.75).
2. **NRC's choline maximum and its source.** NRC (page 233) proposes a presumed
   safe maximum of 2,000 mg choline per kg diet, which the template uses as
   500 mg/Mcal. The study NRC cites, McKibbin et al. (1945), fed growing
   puppies 2,000 mg of choline chloride per kg of ration as fed: about
   1,490 mg choline per kg as fed, or 373 mg/Mcal. The template follows NRC's
   print and states the inconsistency in its note.
3. **NRC's reference-animal values.** NRC states its values per kg BW^0.67
   for kittens and lactating queens, and per kg BW^0.75 for puppies and
   lactating bitches, for one reference animal each. The template uses the kitten and queen values for every
   kitten or queen (their maximums `conditional`), and none for puppies and
   bitches.
4. **FEDIAF's minimums per kg BW^0.75 or BW^0.67 and its main tables.**
   FEDIAF's Table VII-11 is rounded and partly disagrees with its per-Mcal
   tables. At the MER, the converted minimum per kg BW^0.75 or BW^0.67 is up to 9% above the per-Mcal minimum for dogs
   (sodium under FEDIAF Dog (MER 95 kcal/kg^0.75): 0.3158 against 0.29 g/Mcal)
   and up to 23% for cats (histidine under FEDIAF Cat (MER 75 kcal/kg^0.67):
   1.07 against 0.87 g/Mcal), so a diet exactly at FEDIAF's per-Mcal minimum
   can read below the MBW minimum.
5. **The FEDIAF maximums per kg BW^0.75 or BW^0.67.** The template derives
   them from FEDIAF's
   per-Mcal maximums at the MER. With an intake in K4 away from the MER the two
   rows disagree: above the MER the MBW maximum is below FEDIAF's per-Mcal
   maximum, and below the MER above it. Under FEDIAF Cat (MER 100
   kcal/kg^0.67), with an intake of 130 kcal per kg BW^0.67, the vitamin D MBW
   maximum is 5,769 against FEDIAF's 7,500 IU/Mcal.
6. **FEDIAF's wet-diet selenium values.** The template uses FEDIAF's dry-diet
   selenium value per kg BW^0.75 or BW^0.67 for every food. With an
   intake in K4 below the MER, a food of more than 12% moisture can then be
   asked for up to about 19% (dogs) or 20% (cats) less selenium than FEDIAF's
   wet-diet value: 65 against 80 mcg/Mcal for a dog under FEDIAF Dog (MER 110
   kcal/kg^0.75) fed 80 kcal per kg BW^0.75.
7. **AAFCO's dry-matter rule.** AAFCO compares a food below 4 kcal/g DM with its
   dry-matter values; the template raises the minimums and keeps the
   maximums per Mcal, and this guide counts AAFCO's maximums as conditional
   while the factor applies. For 7 values AAFCO's two tables disagree (see
   [The AAFCO dry matter factor](#the-aafco-dry-matter-factor)).
8. **FEDIAF growth maximums used for reproduction.** FEDIAF's Table VII-18a
   gives cat maximums for growth and reproduction without naming a stage, but
   its Table III-4b labels the arginine, methionine, tryptophan and Ca:P
   maximums "Growth". The template uses them under FEDIAF Cat Reproduction,
   coded N* (`conditional`).
9. **Minimums above maximums under a caloric restriction.** The restriction
   raises minimums but not maximums, so from about 30% some minimums pass a
   maximum: FEDIAF's legal selenium maximum under the two FEDIAF dog growth
   selections (above 29.6%), the choline maximum under the four NRC dog
   selections (above 32%), the calcium maximum under the two NRC puppy
   selections and AAFCO Large Breed Dog Growth (above 33.3%), and above 37.5%
   the phosphorus maximum under the two AAFCO dog growth selections and the
   calcium maximum under FEDIAF Dog Early Growth (< 14 wk) & Reproduction,
   among others up to 55%. Under the energy rules proposed for the code version,
   the choline maximum rises with the minimum and is no longer passed.
10. **Minimums above maximums under the AAFCO dry matter factor.** With no
    restriction, AAFCO Large Breed Dog Growth's calcium minimum passes its
    maximum below 2⅔ kcal/g DM, about 2.67 (3 × 4 ÷ energy density against
    4.5 g/Mcal),
    and the two AAFCO dog growth selections' phosphorus minimum passes its
    maximum below 2.5 kcal/g DM. The calculated carbohydrate maximum falls below its 25 g/Mcal minimum
    under AAFCO Cat Maintenance (below about 2.06 kcal/g DM) and AAFCO Cat
    Growth and Reproduction (below about 2.23 kcal/g DM, and 0 at 2 kcal/g
    DM), and it is 0 under all five AAFCO selections at 2 kcal/g DM with a 55%
    restriction. A restriction adds
    further cases.
11. **The choline MBW minimum and the per-Mcal maximum.** Under NRC RA Dog
    Maintenance, the choline minimum per kg BW^0.75, converted with an intake
    entered in K4 below 90 kcal per kg BW^0.75, is above the 500 mg/Mcal
    maximum. Under the energy rules proposed for the code version, a restriction
    or an optimal body weight can bring the energy fed that low too, and the
    maximum rises to at least 1.1 times the minimum, so a diet can meet both
    rows.
12. **NRC's large-breed puppy calcium rule and its calcium safe upper
    limit.** For puppies of more than 25 kg expected mature body weight, up to
    14 weeks of age, NRC asks at least 0.54 g of calcium per kg of body weight
    a day (Table 15-3, footnote h); at a low energy intake this is more than
    NRC's 4.5 g/Mcal safe upper limit. Under NRC RA Puppy 4-14 Wk Growth, a
    20 kg puppy eating 1,324 kcal a day needs 8.16 g/Mcal on the large-breed
    puppy calcium row (maximum 8.97, 1.1 times the minimum), while the general
    calcium row's maximum is NRC's 4.5 g/Mcal, so a diet that meets the first
    row is `excess` on the second.

### Earlier versions

Version 21OCT26b, made the same day (History of Change(s), row 12), corrects
the wording of four texts that said per kg body weight for values per kg
BW^0.75 or BW^0.67: the status items in cells A145 and A146 of the Standards
tab and the notes on cells AG3 and AQ3 of the Healthy Dog Cat Reqt Data tab.
No value or formula changed.

Version 21OCT26, live since 21 October 2026, is the template's final feature
version. Against Version 18OCT26 it changed, among other things:

- the caloric restriction: the entry takes 0 or a number from 1 to 55; ALA's
  own minimum is raised and the fat minimum is not; text in G10 no longer
  turns the raised minimums into "none";
- the energy inputs: one life-stage input, the week of lactation entered as a
  week, and one count of puppies nursing; AAFCO maintenance energy by type of
  dog or cat, two growth phases for AAFCO dog growth, NRC gestation and
  lactation energy under the AAFCO growth and reproduction selections, and
  FEDIAF's own equations for its dog growth and reproduction and cat
  reproduction selections (for a growing puppy at 10 to 100% of its expected
  mature body weight, FEDIAF's equation gives 10 to 29% less energy than
  NRC's, which earlier versions used); messages for missing inputs, a body
  weight above the expected mature body weight and a missing selection;
- an intake entered below the calculated requirement is no longer called a
  caloric restriction (cell M4's label and the summary sentences);
- the AAFCO dry matter factor;
- requirement values: choline (the adequate intake of 340 mg/Mcal and a
  maximum of 500 under the four NRC dog selections), AAFCO's 2026 cat
  phosphorus maximum and Ca:P minimum, FEDIAF Cat Reproduction maximums from
  FEDIAF's Table VII-18a, FEDIAF Dog Late Growth calcium and Ca:P by expected
  mature body weight, and MBW values (none for NRC's dog growth and
  reproduction selections; FEDIAF's adult minimums and calculated maximums
  added);
- the Ca:P range high of 2 times the minimum, a calculated carbohydrate
  maximum of at least 0, and the DHA check for adult cats;
- the type of every maximum, and this guide's grouping of the types;
- cell rules on the inputs and entries, many notes, and a status and known
  limitations block.

The template's History of Change(s) tab, row 11, lists every change.

Version 18OCT26 changed the band tests (half-open bands compared at 7 decimal
places, and "No range") and several limits, among them energy density fixed at
6 kcal/g DM, energy at 1.55 times the minimum for every standard, the Ca:P
maximum and the large-breed puppy calcium minimum; it also added the vitamin D2
rows. Earlier versions, including 28SEP25 and 16OCT26, differ in these and
other respects.

Version 18OCT26 was corrected the same day, with its label unchanged (History
of Change(s), row 10). The correction changes only the large-breed puppy
calcium row (its minimum, and the maximum that follows it), and only when a
puppy body weight, an intake and a restriction are all entered. Until 21
October 2026 this page followed the corrected version. For errors in copies
of Version 18OCT26 or earlier that are still in use, see
[Template Status and Known Limitations](known-limitations.html#errata-for-copies-of-earlier-versions).

### Where each rule is in the template

For reviewers checking this page against the template's Standards tab:

| What | Where |
|---|---|
| Minimum, maximum and multiplier K | columns C, E and K |
| Base and range high | columns W and AP |
| Band lower edges | columns Q, S, U, W, Y, AA, AC, AE, AG, AI, AK, AM and AO |
| Displayed upper edges, not compared | columns P, R, T, V, X, Z, AB, AD, AF, AH, AJ, AL and AN; column O shows 0 |
| Band labels | row 2 |
| Diet values entered under Min and Max | columns G and I |
| Their descriptions | columns L and N |
| The band rules and the rounding, in the template's words | the note on cell L5 |
| Multipliers other than 4 | the Exceptions to Range High = 4X Min tab |
| The type of each maximum taken from a standard | the Healthy Dog Cat Reqt Data tab, columns AU to BO (codes in the note on cell AU3; this guide's grouping in the note on cell E5 of the Standards tab) |
| The AAFCO dry matter factor | cell AS3, from the energy density entered in cell G130 |
| The selected requirement's columns | cell AX1: one lookup that most formulas use (a few formulas test the selection's name in O1 directly) |
| Daily energy (the energy minimum, the MBW conversion and the large-breed puppy calcium row) | the Healthy Dog Cat Reqt Data tab, row 4: one formula per selection, using the inputs in rows 3 and 4 of the Standards tab (body weight B3, expected mature body weight E3, puppies nursing G3, week of lactation K3, life stage M3, type of dog B4, type of cat D4); an intake above 0 entered in cell K4 overrides it |
| Caloric restriction | cell G10 |
| Cell rules on the inputs and entries | the data validation of those cells, with help text |
| Requirement values for the 21 selections | the Healthy Dog Cat Reqt Data tab |
| Changes in each version | the History of Change(s) tab |
| Status and known limitations | the Standards tab, cell A2 and rows 132 to 149 |
{:.grid}

- The template also colours the cells of a value's band. That colouring is a
  visual aid; this page follows the descriptions in columns L and N. The two
  differ in three cases: above the range high, the range-high cell is coloured
  instead of a band; a value entered under Min on a row with no minimum is
  coloured in its band; and nothing is coloured on a row with no range.
- An exported copy of the template can store formula results to about 10
  significant digits. Recompute limits and edges from the inputs instead of
  reading stored results.
