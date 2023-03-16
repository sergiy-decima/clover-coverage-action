# Clover Code Coverage Summary

A [GitHub Action](https://github.com/actions) that reads Clover format code coverage file from your test suite and outputs a text or markdown summary.

You can add this action to your GitHub workflow:

```yaml      
- name: Summary Coverage Report
  uses: sergiy-decima/clover-coverage-action@v1.0.0
  if: always()
  with:
    filename: clover-coverage.xml
    thresholds: 60..80
    fail_if_low: true
```

## Inputs

### `filename`

**Required** Code coverage file to analyse by **clover format**. If there are any spaces in a path or filename this value must be in quotes.

### `thresholds`

Lower and upper threshold percentages for health indicators, lower threshold can also be used to fail the action. Separate the values with a space or dash or two dots, and enclose them in quotes; default **"60 80"** or **"60-80"** or **"60..80"**.

### `fail_if_low`

Fail the workflow if the overall Line Rate is below lower threshold - **true** or **false** (default). The default lower threshold is 60%, see [**thresholds**](#thresholds).

## Outputs

### `percent`

Code coverage percent.
