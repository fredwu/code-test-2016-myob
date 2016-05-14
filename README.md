# MYOB Code Test by Fred Wu

## Prerequisite

- ruby 2.2+
- bundler

```bash
bundle install
```

## Usage

```bash
./bin/show-me-the-money --help

Example usage:
    -i, --input FILE                 Path to the employees salary input file
    -o, --output FILE                Path to the employees payslip output file
```

```bash
./bin/show-me-the-money -i example-data/input.csv -o example-data/output.csv
```

## Assumptions

- Input file will always be correct (in both its format and its data)
  - For example, the `start date` is always correct (i.e. `01 March - 31 March`)
- Output file will overwrite the file in specified path if it already exists
- Tax rates can be changed but are always the same for every employee

## Application Architecture

        +----------------------------+
        |             CLI            |
        +--------------+-------------+
                       |
    +------------------v-----------------+
    |              Workflow              |
    +------------------------------------+
    |   +----------------------------+   |
    |   |         Transformer        |   | <- Transforms CSV input for consumption.
    |   +--------------+-------------+   |
    |                  |                 |
    |   +--------------v-------------+   |
    |   |           Builder          |   | <- Builds domain models.
    |   +----------------------------+   |
    |   |  +----------------------+  |   |
    |   |  |        Models        |  |   | <- Domain models.
    |   |  +----------------------+  |   |
    |   |  |  +----------------+  |  |   |
    |   |  |  |    Employee    |  |  |   | <- Employee model contains the calculation logic.
    |   |  |  +----------------+  |  |   |
    |   |  +----------------------+  |   |
    |   +--------------+-------------+   |
    |                  |                 |
    |   +--------------v-------------+   |
    |   |          Producer          |   | <- Produces data for presentation.
    |   +--------------+-------------+   |
    |                  |                 |
    |   +--------------v-------------+   |
    |   |          Presenter         |   | <- Presents and writes the data to CSV.
    |   +----------------------------+   |
    +------------------------------------+

## Test Suite

### Run all the tests

```bash
bundle exec rake
```

### Run only Rubocop

```bash
bundle exec rake rubocop
```

### Run only spec

```bash
bundle exec rake spec
```

## Author

- Fred Wu <ifredwu@gmail.com>
- 2016-05-14
