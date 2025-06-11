# sageDataR

`sageDataR` is an R interface to the [`sage-data-client`](https://pypi.org/project/sage-data-client/) Python package. It provides a function to query analysis-ready, real-time updated time series data from the [Sage Continuum](https://sagecontinuum.org/about) and [CROCUS](https://crocus-urban.org/) sensor networks directly in R.

The data originates from live sensor deployments visible at:

- [Sage Data Portal](https://portal.sagecontinuum.org/nodes)
- [CROCUS Data Portal](https://crocus.sagecontinuum.org/nodes)

---

## Installation

### Install and load the R package from GitHub

```r
# install.packages("devtools")
devtools::install_github("lxdepablo/sageDataR")
library(sageDataR)
```

After loading the package, follow setup instructions in the R console.

---

## Example Usage

```r
library(sageDataR)

# Query bird presence data from the last hour
df <- query_sage_data(
  start = "-1h",
  filter = list(name = "env.detection.avian.*")
)

head(df)
```

---

## Reference

### `install_sage_client(envname = "r-sage-client")`

Creates a Python virtualenv and installs the `sage-data-client` dependency into it.

### `query_sage_data(start, end = NULL, filter = NULL, head = NULL, tail = NULL)`

Wraps the Python function `sage_data_client.query()`. Parameters:

| Argument | Description |
|----------|-------------|
| `start`  | **Required.** Relative or absolute start timestamp (e.g., `"-1h"` or `"2024-05-01 00:00:00"`). |
| `end`    | Optional. End timestamp. |
| `filter` | Optional. A named list of filters, e.g., `list(name = "env.temperature")`. |
| `head`   | Optional. Return earliest N records per series. |
| `tail`   | Optional. Return latest N records per series. |

---

## Related Resources

- [Sage Project Overview](https://sagecontinuum.org/about)
- [Sage Data Portal](https://portal.sagecontinuum.org/nodes)
- [CROCUS Sensor Network](https://crocus.sagecontinuum.org/nodes)
- [Python `sage-data-client` on PyPI](https://pypi.org/project/sage-data-client/)

---

## Authorship
All code was written and conceived by Luis X. de Pablo, with assistance from a large language model.

---

## License

GNU GPL v3.0
