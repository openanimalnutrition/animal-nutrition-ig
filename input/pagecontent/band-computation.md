**Proposed, pending ratification.** This page states the computation that the
provisional steward proposes for the two decisions that
[GOVERNANCE.md](https://github.com/openanimalnutrition/animal-nutrition-ig/blob/main/GOVERNANCE.md)
reserves for ratification: the common mathematical basis for expressing
nutrient levels (the decile basis), and the derived-provisional maximum rule.
It also states the limits that the source template sets or computes, which the
computation uses.

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
  Table*, Version 18OCT26, live since 18 October 2026, an open spreadsheet
  template. GOVERNANCE.md links to it and states the steward's disclosure of
  interest.

The page is written for implementers (people, software and AI checkers) who
need to get the same band for the same input, and for reviewers of the
proposal. It states what the template computes. It also states the provisional
steward's own rules for a check under a caloric restriction, and for the
arginine and large-breed puppy calcium minimums (see
[Bands and the adequacy interpretation](#bands-and-the-adequacy-interpretation)).
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

This holds for every food and every selection. The template's notes point out
that AAFCO compares a food below 4 kcal ME per g of dry matter with its
dry-matter values, without correcting for energy. Under an AAFCO selection, such
a food can therefore meet the per-Mcal minimums here and still fall below
AAFCO's dry-matter minimums.

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
  blank under Min and as "none" under Max), and for protein: only protein
  entered under Min raises the arginine minimums (NRC and FEDIAF selections).

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
| Ratios: Ca:P and the two n-6:n-3 ratios | 1 |
{:.grid}

A range high of the minimum times K is a derived-provisional ceiling: it
prioritizes consistency and determinism, not toxicological calibration, and is
revisable by the governance body.

- No selection has an energy maximum, so the energy range high is always 1.55
  times the energy minimum: the animal's daily energy requirement, or an
  entered intake that overrides it.
- With K = 1 and no maximum, a ratio row would have no range above its minimum.
  In Version 18OCT26 this does not occur: the two n-6:n-3 ratio rows always have
  a maximum, and the Ca:P row has either a maximum or neither limit.
- The template's list of multipliers also gives 1 for water and 1.5 for energy
  density. Neither is used, because both rows have a fixed maximum (see
  [Limits the template sets or computes](#limits-the-template-sets-or-computes)).

#### Requirements per kg of metabolic body weight

Rows marked MBW (metabolic body weight) in the template come from requirements
per kg of metabolic body weight per day: BW^0.75 for dogs and BW^0.67 for cats,
where BW is the animal's body weight in kg. The template converts both limits
to per Mcal:

`limit per Mcal = limit per kg BW^n per day × ((BW^n ÷ daily energy in kcal) × 1,000)`

The daily energy is the template's calculated requirement for the selection and
the animal, unless an intake is entered to override it. These per-Mcal limits
therefore change with body weight and energy intake. When an MBW row has no
maximum, K is 4, or 7 for sodium.

Where the template sets or computes a limit (see
[Limits the template sets or computes](#limits-the-template-sets-or-computes)),
the MBW row follows the same rule on its own basis:

- the arginine MBW minimum rises with the protein entered under Min on the
  protein MBW row, above that row's minimum;
- the alpha-linolenic acid (ALA) MBW limits use the minimum and maximum of the
  linoleic acid (LA) MBW row;
- the vitamin D2 MBW limits use the vitamin D MBW row;
- the fixed medium-chain triglyceride maximum (17.568) and the taurine default
  (0.67) are per Mcal and are not converted.

#### Caloric restriction

An intentional caloric restriction can be entered as a percentage of the
animal's energy need, from 0 to 55 (cell G10): 25 means that the animal is fed
25% less energy than it needs. This percentage is the only way the template
takes a restriction. The template then multiplies the standard's per-Mcal
minimums by 1 ÷ (1 − restriction ÷ 100), computing that factor first, so that
the restricted intake still supplies the same daily amount. At 25%, each such
minimum is multiplied by 4/3.

- Not adjusted: the MBW rows (below), energy, energy density, water, vitamin C,
  carbohydrate, the fibers, oxalate, purine, the standard's minimums for the
  three ratio rows (only Ca:P has any), and ALA's own minimum (under the four
  NRC dog selections, its floor from the LA minimum does move). The template's
  notes on both ALA rows flag the unadjusted ALA minimum as a limitation ("works
  except not for nutrient enhancement when caloric restriction entered"). On the
  per-Mcal ALA row, this gap is for the template's next version to close (see
  [Open points](#open-points), item 20). The ALA MBW row, like every MBW row,
  follows separate requirements (below), so this guide does not count it as a
  gap.
- When the percentage is entered without an intake in place of the
  calculated requirement (below), the energy minimum stays the calculated
  requirement. A planned restricted intake entered as the energy row's diet
  value therefore reads below it. Whether that is `deficient` is open (see
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
  minimum times K follows the adjusted minimum.
- For arginine (NRC and FEDIAF selections), the standard's minimum is
  multiplied, and the increase for protein is then added, measured from the
  raised protein minimum. Under NRC RA Dog Maintenance, with 40 g/Mcal of
  protein entered under Min, the minimum is 1.03 g/Mcal with no restriction
  and 1.24 at 25%, not 1.03 × 4/3.
- The template describes the restriction itself with the same band test, on a
  range of 0 to 55, or as "No restriction to describe" for 0, nothing entered
  or "none". That row describes an input, not a nutrient.
- The template's notes recommend stating the restriction wherever a band is
  cited, because the same g/Mcal can then fall in a different band.

The MBW rows come from separate requirements, per kg of metabolic body weight.
The template's notes present the percentage as an alternative to them. The
percentage does not change them. They are converted with the daily energy the
template uses: the calculated requirement, which the percentage does not
reduce, or an intake entered in its place.
Converted with an entered intake, an MBW row's minimum supplies the standard's
daily amount at that intake.

An intake entered in place of the calculated requirement (cell K4, labelled
"Overwrite & Use This Instead (kcal/day):") is not a restriction. Only a number
above 0 in K4 counts as an entered intake, here and throughout this page;
anything else leaves the calculated requirement in use. An entered intake is the
daily energy that the template uses for the animal. It never triggers a
restriction adjustment, because individual energy needs vary widely around the
calculated average. The template's notes cite individual variation of up to 55%
(the basis of its 55% cap), and about 50% for cats from the 2006 NRC. So an
intake below the calculated requirement may meet the animal's whole need, or
only part of it. Whether it is a restriction is for the user to say, by entering
the percentage. For example, 1000 kcal/day entered where the calculated
requirement is 1250 is not, by itself, a restriction. Entering 20 as the
percentage as well says that 1000 kcal/day is 80% of the animal's need.

- An entered intake changes limits and bands only on the rows that the
  template converts with daily energy: the energy row (its minimum becomes the
  intake), the MBW rows (the ALA MBW row among them) and the large-breed puppy
  calcium row. Under the AAFCO and FEDIAF selections, which have no MBW
  requirements in the template, it changes only the energy row.
- The template shows how far an entered intake is below the calculated
  requirement (cell N4, labelled "Note Caloric Restriction:"), and the summary
  sentences of the energy and MBW rows (column AR) quote it as a "Caloric
  Restriction Adjustment". Despite those words, the figure is information
  only: it is not the percentage, which only the user enters, and no limit or
  band uses it.

#### Limits the template sets or computes

For the rows below, the template sets or computes the minimum or the maximum
itself. Where a maximum is given, it is the range high. "Standard" means the
selected standard's value. A limit of none counts as 0 only where the two
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
| Taurine (g/Mcal; all four taurine rows) | standard | 0.67 on all four rows when the general taurine row (per Mcal) has no minimum, which is every dog selection; otherwise the standard's, except that the per-Mcal row for foods of more than 12% moisture takes the general row's maximum, and an MBW row with no minimum has none |
| Carbohydrate, by difference (g/Mcal) | standard, else 25 | standard, else (1,000 − (4 × protein minimum + 9 × fat minimum)) ÷ 4 |
| Total dietary, insoluble and soluble fiber (g/Mcal) | standard, else 6.25, 4.75 and 1.5 | standard: range high 6 times the minimum |
| Vitamin C (mg/Mcal) | standard, else 11.25 | standard: range high 4 times the minimum |
| Oxalate and purine (mg/Mcal) | 25 and 200, fixed | none: range high 4 times the minimum |
| Arginine (g/Mcal; per-Mcal and MBW rows) | standard, plus 0.01 (dogs) or 0.02 (cats) for each g/Mcal of protein entered under Min above the protein minimum; NRC and FEDIAF selections only | standard |
| ALA (g/Mcal; per-Mcal and MBW rows) | under the four NRC dog selections listed below: the larger of the standard's and the LA minimum ÷ 16, or ÷ 26 under NRC RA Dog Maintenance; otherwise standard | under the same four: the larger of the standard's and the LA maximum ÷ 2.6; otherwise standard |
| Ca:P | standard | standard, else calcium maximum ÷ phosphorus minimum when both exist and the phosphorus minimum is above 0, else none |
| LA + AA : ALA + EPA + DHA | standard, else (LA + AA minimums) ÷ (ALA + EPA + DHA maximums); none when that divisor is 0 | standard, else (LA + AA maximums) ÷ (ALA + EPA + DHA minimums); 50 when either sum is 0 |
| LA + AA : EPA + DHA | standard, else (LA + AA minimums) ÷ (EPA + DHA maximum); none when that maximum is 0 | standard, else (LA + AA maximums) ÷ (EPA + DHA minimum); 125 when either is 0 |
| Calcium for puppies 4 to 14 weeks old with an adult body weight over 25 kg (g/Mcal) | NRC RA Puppy 4-14 Wk Growth only (otherwise none): the larger of 3 and the body-weight term, (0.54 × the body weight entered for this row, in kg) ÷ (daily energy in kcal ÷ 1,000), or 3 when no body weight above 0 is entered. When a restriction is entered, 3 is first multiplied by 1 ÷ (1 − restriction ÷ 100), and so is the body-weight term unless an intake above 0 is entered; the larger is then taken | none when the minimum is none; otherwise 4.5, or 1.1 times the minimum when the minimum is above 4.5 |
| Vitamin D2 (cats only; per-Mcal and MBW rows) | the vitamin D minimum ÷ 0.7, or none when that is none | the vitamin D maximum, or none when that is none |
{:.grid}

The four NRC dog selections for ALA are NRC RA Puppy 4-14 Wk Growth, NRC RA
Puppy 14 Wk+ Growth and NRC RA Dog Late Gestation & Peak Lactation (LA ÷ 16),
and NRC RA Dog Maintenance (LA ÷ 26). The ALA rules apply when the LA limit is
above 0. For dogs, the vitamin D2 rows have neither limit.

#### Greater-than limits

NRC prints some safe upper limits as greater-than values, for example sodium for
adult dogs, greater than 15 g/kg DM. The template enters such a maximum as the
value plus 0.000000001 (here 3.750000001 g/Mcal), an addition its notes call
clinically insignificant and far beyond any measurable precision. Its notes
also state that at 7 decimal places this addition does not change how any value
is described, and that a value equal to the limit is described as Highest (90%
of Range or Greater) with or without it (see [Open points](#open-points),
item 5).

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
comparison would place an entered 3.4 one band low. The one exception is a
value or an edge that falls exactly halfway at the eighth decimal place (see
[Open points](#open-points), item 8).

- Other comparisons are not rounded: the no-minimum check, which compares an
  entry under Min with 0; the comparisons inside the limit formulas (for
  example the protein entered under Min against the protein minimum, for
  arginine); and the LA:ALA and EPA text checks (see [Open
  points](#open-points), item 16).
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

In Version 18OCT26, as long as the daily energy is above 0, every "No range"
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
maximum, or when the computed carbohydrate maximum falls below its 25 g/Mcal
minimum. At a 55% restriction the carbohydrate maximum is below 25 g/Mcal
under 13 of the 21 selections, and below 0 under 7 of them, all for cats (as
low as −47.6 g/Mcal).

### Outcomes other than a band

The template checks each entry in the order below. The first step that applies
gives the description.

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

While one of the following inputs is missing and no intake is entered instead,
the energy minimum shows a message naming it: the type of dog under NRC RA Dog
Maintenance, the type of cat under NRC RA Cat Maintenance, the expected mature
body weight under the growth selections that use it, or the number of kittens
under NRC RA Cat Peak Lactation and FEDIAF Cat Reproduction. (That last message
also names the lactation week, but only the number of kittens is checked; a
missing week factor counts as 0.) Errors then replace the descriptions on the
MBW rows that have values, on the energy row once a value is entered, and on
the large-breed puppy calcium row once a puppy body weight is entered. A body
weight of 0, or nothing entered, gives no message: the daily energy is then 0,
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
| Below a minimum set by the applied standard, including one raised for a caloric restriction, and the arginine and large-breed puppy calcium minimums (below) | `below-min-lt25` to `below-min-75-100` | [`deficient`](CodeSystem-adequacy-interpretation.html#adequacy-interpretation-deficient) |
| At or above the minimum, up to the range high | `range-d1` to `range-d10` | [`adequate`](CodeSystem-adequacy-interpretation.html#adequacy-interpretation-adequate) |
| Above a derived-provisional ceiling: the range high is the minimum times K, and maxProvenance is `derived-provisional` | `range-d10` | `adequate` |
| Above a maximum or safe upper limit set by the applied standard, and not below a minimum set by the applied standard, including one raised for a caloric restriction: maxProvenance is `authoritative` | `range-d10` | [`excess`](CodeSystem-adequacy-interpretation.html#adequacy-interpretation-excess) |
| Below a minimum raised for a caloric restriction, and above a maximum or safe upper limit set by the applied standard | `below-min-lt25` to `below-min-75-100` | `deficient` |
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
- **A raised minimum above a maximum.** From a restriction of about 30%, a
  raised minimum can exceed a maximum set by the applied standard (see
  [A maximum below the minimum](#a-maximum-below-the-minimum)). A value below
  the raised minimum and above that maximum is `deficient`, and its band is
  below the minimum. The excess stays visible: the value is above
  referenceRange.high, and maxProvenance is `authoritative` (for which
  maximums count, see [Open points](#open-points), item 4).
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
- **What these rules do not reach.** An ALA value that falls short only
  because of the restriction can be `adequate` (see
  [Open points](#open-points), item 20). Whether a value below the other
  minimums that the template supplies or computes is `deficient` is open (see
  [Open points](#open-points), item 6).
- There is no 15th band for values above the range high. A value there that is
  not below the minimum is in `range-d10`, whoever set the ceiling, so
  `range-d10` alone does not say whether a value is above it.
  referenceRange.high holds the ceiling, and
  [maxProvenance](StructureDefinition-maximum-provenance.html) says whether the
  applied standard set it.
- maxProvenance is
  [`authoritative`](CodeSystem-maximum-provenance-code.html#maximum-provenance-code-authoritative)
  when the range high is a maximum or safe upper limit set by the applied
  standard, and
  [`derived-provisional`](CodeSystem-maximum-provenance-code.html#maximum-provenance-code-derived-provisional)
  when it is the minimum times K. Which code fits a maximum that the template
  sets or computes is open (see [Open points](#open-points), item 4).

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
   minimum, on the water row, and on the protein rows (only the Min entry
   raises the arginine minimums). When both are described, the row's summary
   sentence (column AR) joins the two descriptions with "to".
3. **A below-minimum band on a row with no minimum.** A negative value on a row
   with no minimum but with a maximum, entered under Min or Max, is in
   `below-min-lt25` although the row has no minimum (on a row with neither
   limit it is "No range"). What that band means there, and whether the value
   is `deficient`, is not stated.
4. **Which maximums are authoritative.** The template uses every number in a
   row's maximum as the range high. Which of the kinds below are
   `authoritative`, and which Maximum Provenance code fits a maximum the
   template sets or computes, is not stated; the current codes cover a maximum
   set by the applied standard and one computed from the minimum.
   - maximums the template sets (water, energy density, medium-chain
     triglycerides, taurine) or computes from other limits (carbohydrate, the
     ratios, ALA, the large-breed puppy calcium row, vitamin D2);
   - requirement values that are its own estimates (for example the sodium
     maximums per kg of metabolic body weight that the template derives from
     NRC's greater-than limits);
   - maximums per kg of metabolic body weight, converted with the animal's own
     energy, which can read above the per-Mcal maximum;
   - FEDIAF legal maximums for trace elements, which FEDIAF gives per kg of dry
     matter and the template converts at 4 kcal/g DM;
   - FEDIAF values taken from footnotes, and a value taken from another life
     stage (FEDIAF's adult Ca:P maximum, used under FEDIAF Cat Reproduction);
   - ceilings stricter than the standard for some animals (for example FEDIAF
     late-growth Ca:P 1.6);
   - NRC greater-than limits.
5. **Greater-than limits.** Whether a verdict records an NRC greater-than limit
   as the printed value or with the template's added 0.000000001, and whether
   such a limit counts as authoritative for `excess`. The template's notes
   state that both give the same bands. Strictly, the addition shifts each
   decile edge by up to 0.0000000009 (times the conversion factor on an MBW
   row), so it can still move a rounded edge by 0.0000001 (a difference that is
   clinically insignificant and far beyond any measurable precision) when an
   edge lies that close to a rounding boundary, as caloric restriction or a
   large conversion factor can make it do; the notes' statement is a practical
   one.
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
   stated. Raised standard minimums, arginine and the large-breed puppy
   calcium row are covered by the rules under
   [Bands and the adequacy interpretation](#bands-and-the-adequacy-interpretation).
7. **Precision of `deficient` and `excess`.** The template's descriptions have
   no test for "above the maximum"; its colouring compares the value with the
   range high at 7 decimal places (above it, only the range-high cell is
   coloured). Whether this guide's "below the minimum" and "above the maximum"
   tests use 7 decimal places is not stated. It matters for many raised
   minimums: at 25%, calcium at 1.3333333 g/Mcal under NRC RA Dog Maintenance
   is in `range-d1`, but below the exact minimum, 4/3.
8. **Rounding and arithmetic.** The template rounds with its spreadsheet's
   rounding function and does not state the tie rule, or whether the stored
   binary value or its decimal form is rounded. This matters only for a value
   or an edge exactly halfway at the eighth decimal place: 0.99999995 against
   a minimum of 1 is `range-d1` if its decimal form is rounded half away from
   zero, but `below-min-75-100` if its stored binary value, just under
   0.99999995, is rounded. The template also fixes the order of operations but
   not the number type (binary floating point or decimal); after rounding to 7
   decimal places this matters only at such ties.
9. **Precision of recorded limits.** The template compares with the computed
   limits (at 7 decimal places), not with the rounded figures it displays. A
   verdict's referenceRange can carry rounded ones (a minimum of 25.2307692
   recorded as 25.23), which can change the band of a value near that limit.
10. **Invariants and validation.** Nothing checks that the minimum is below the
    range high, that values and limits are not negative, that the daily energy
    is above 0, or that K is above 0. When a maximum falls below the minimum, a
    value between the two is both below the minimum and above the maximum.
    Where a caloric restriction raises a standard's minimum above its maximum,
    such a value is `deficient` (see
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
    restriction, body weight, the type of dog or cat or an intake entered in
    place of the calculated requirement, the expected mature body weight,
    lactation inputs, the puppy body weight for the large-breed calcium row,
    and the protein entered under Min (for arginine). The profile records the
    standard, the life stage and the caloric restriction, as a percentage (see
    [Bands and the adequacy interpretation](#bands-and-the-adequacy-interpretation)),
    but none of the other inputs, including an entered intake. The template
    defines no fallback while a required input is missing.
13. **Selections and editions.** The 21 selections do not map one to one onto
    this guide's [Requirement Standards](CodeSystem-requirement-standard.html)
    and [Life Stages](CodeSystem-life-stage.html) codes: for example FEDIAF
    adult dogs at a maintenance energy requirement (MER) of 95 or 110
    kcal/kg^0.75, NRC puppies 4 to 14 weeks old or 14 weeks and older, AAFCO
    small-and-medium or large-breed growth, and NRC cat late gestation or peak
    lactation. The NRC selections use NRC's recommended allowances, except
    where the template's notes say otherwise (for example choline under NRC RA
    Dog Maintenance, which uses the value the notes call NRC's adequate intake,
    and pantothenic acid under NRC RA Cat Late Gestation and NRC RA Cat Peak
    Lactation, taken from another NRC table). The template cites the 2006 NRC,
    the 2026 AAFCO Official Publication and FEDIAF's September 2025 guidelines,
    and some notes still say 2025 AAFCO. How a verdict records the edition is
    not stated.
14. **Converting diet values to the basis.** The template compares per Mcal and
    has no conversion from a diet's dry-matter or as-fed values to per Mcal.
    Its converter tab converts one amount at a time, by hand, the other way:
    from per Mcal to per kg of dry matter, for an entered energy density.
15. **Limits outside the template's columns.** Limits that exist only on a
    dry-matter basis or for a product category, for example an AAFCO calcium
    maximum for some all-life-stages dog foods, have no column.
16. **Text checks.** The template's LA:ALA and EPA share checks return text,
    not bands. Whether they are part of a verdict is not stated.
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
20. **ALA under caloric restriction.** The caloric restriction percentage does
    not raise ALA's own per-Mcal minimum (see
    [Caloric restriction](#caloric-restriction)). So an ALA value that falls
    short only because of the restriction can be `adequate`. Fourteen
    selections have an ALA minimum. Under the ten that are not NRC dog
    selections, all for growth or reproduction, the per-Mcal ALA minimum does
    not rise at all. Under NRC RA Dog Maintenance, the template's minimum stays
    up to 2.1% below ALA's own minimum (0.11 g/Mcal) times the restriction
    factor: 0.1435897 against 0.1466667 g/Mcal at 25%, where the minimum is the
    floor from LA. Under the other three NRC dog selections, the floor from LA
    stays above ALA's own minimum times the factor, so no such shortfall
    arises. Under the four NRC dog selections, whether a value below the floor
    is `deficient` is item 6. How ALA's own minimum is to be raised is left to
    the template's next version.

### Earlier versions

Version 18OCT26 changed the band tests (half-open bands compared at 7 decimal
places, and "No range") and several limits, among them energy density fixed at
6 kcal/g DM, energy at 1.55 times the minimum for every standard, the Ca:P
maximum and the large-breed puppy calcium minimum; it also added the vitamin D2
rows. Earlier versions, including 28SEP25 and 16OCT26, differ in these and
other respects. The template's History of Change(s) tab lists the changes made
in each version.

Version 18OCT26 was corrected the same day, with its label unchanged (History
of Change(s), row 10). The correction changes only the large-breed puppy
calcium row (its minimum, and the maximum that follows it), and only when a
puppy body weight, an intake and a restriction are all entered. This page
follows the corrected version.

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
| Daily energy (the energy minimum, the MBW conversion and the large-breed puppy calcium row) | the Healthy Dog Cat Reqt Data tab, row 4: one formula per selection, using the inputs in rows 3 and 4 of the Standards tab; an intake above 0 entered in cell K4 overrides it |
| Requirement values for the 21 selections | the Healthy Dog Cat Reqt Data tab |
| Changes in each version | the History of Change(s) tab |
{:.grid}

- The template also colours the cells of a value's band. That colouring is a
  visual aid; this page follows the descriptions in columns L and N. The two
  differ in three cases: above the range high, the range-high cell is coloured
  instead of a band; a value entered under Min on a row with no minimum is
  coloured in its band; and nothing is coloured on a row with no range.
- An exported copy of the template can store formula results to about 10
  significant digits. Recompute limits and edges from the inputs instead of
  reading stored results.
