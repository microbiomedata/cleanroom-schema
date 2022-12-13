# Selecting a file format
_For contribution to the NMDC schema_ 

## Background

Between 2021-04-02 and 2022-12-12, 12 contributors have made 1,063 commits to nmdc-schema.

Here's the distribution of commits per person

* 001 commit    1 ++    1 --
* 001 commit    2 ++    0 --
* 001 commit    379 ++    211 --
* 004 commits    5 ++    1 --
* 005 commits    106 ++    50 --
* 005 commits    16 ++    6 --
* 005 commits    31 ++    23 --
* 014 commits    916 ++    634 --
* 015 commits    887 ++    264 --
* 066 commits    36,950 ++    2,931 --
* 248 commits    863,312 ++    614,594 --
* 452 commits    59,137 ++    28,743 --

## Goals: 
- increase the number of people contributing schema elements and corresponding valid/invalid test data.
- decrease the turnaround time between when new features are requested and when they are available in a PyPI release

## Challenges:
- The LinkML modelling language isn't common knowledge
- Most NMDC colleagues in the position to make valuable subject matter contributions don't have formal training in any modeling framework
- Free-form text, diagrams, spreadsheets, etc. are commonly exchanged to express new requirements for the schema. 
  - the modeller will usually have to request missing term metadata
  - the shared materials may not adhere to LinkML requirements or make good use of established NMDC schema practices
  - these approaches make the collaboration slow and frustrating

## Options
- Subject matter experts (SMEs) edit schema directly. NMDC data modellers will make themselves available for as much live collaboration as necessary.
  - SMEs should start by creating an issue in the nmdc-schema tracker and a new branch whose name is based on that issue, like "issue_123_bacterium_texture". 
  - The actual schema edits could be made through the GitHub web interface, or by pulling the new branch into a local development environment.
  - Any changes to the schema should be supplemented with some new test data that is expected to pass, and some that is expected to fail because it doesn't follow the new specifications.
  - Changes are never made directly to the main branch.
  - Ultimately, a Pull Request is made based on the changes in the new branch. 
  - The nmdc-schema repo has automated actions that check Pull Requests. If there aren't any errors, the Pull Request can be merged and an NMDC data modeller can make a new release of the schema.
- SME uses [schemasheets](https://linkml.io/schemasheets/). Ideally they would be checked into the NMDC schema, but saving in Google Sheets is acceptabel, too.
- SME provides their contribution in a format that can be directly imported into LinkML (with the [schema automator](https://linkml.io/schema-automator/packages/importers.html)) Note: _some of these serializations may be underpowered relative to LinkML, in the sense of not providing regular expressions, term comments, etc._
  - OWL
  - JsonSchema
  - a Live connection to a SQL database, including SQLite 
- SME provides a canonical [UML class diagram](https://www.visual-paradigm.com/guide/uml-unified-modeling-language/uml-class-diagram-tutorial/), which can be drawn with an application like https://app.diagrams.net/


----

## Related:
- Anyone generating data that is intended to be inserted into the NMDC MongoDB should be instantiating classes from the NMDC schema (not just making a good faith effort to write procedural code that matches the schema by eye.)


----

first NMDC schema commit: 
https://github.com/microbiomedata/nmdc-schema/commit/8da916f6d91f0ff2b343f31f861ff8c698d84bdb

----

# Using this package

## Dataclasses

```python
from cleanroom_schema.datamodel import Biosample
bs = Biosample(id="bs:1")
```

## Sample commandline script that accesses bundled data/schema files

```shell
test_publishability
```

which is defined as `cleanroom_schema.test_publishability:print_nt` in `pyproject.toml`