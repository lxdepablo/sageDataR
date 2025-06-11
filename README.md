# sageDataR

`sageDataR` is an R interface to the [`sage-data-client`](https://pypi.org/project/sage-data-client/) Python package. It provides a streamlined way to query time series sensor data from the [Sage](https://sagecontinuum.org/about) cyberinfrastructure directly in R using `reticulate`.

The data originates from live sensor deployments visible at:

- 🌐 [Sage Data Portal](https://portal.sagecontinuum.org/nodes)
- ❄️ [CROCUS Portal (Cold Regions)](https://crocus.sagecontinuum.org/nodes)

---

## 🔧 Installation

### Step 1: Install the R package from GitHub

```r
# install.packages("devtools")
devtools::install_github("yourusername/sageDataR")
```

### Step 2: Set up the Python environment (first time only)

```r
library(sageDataR)
install_sage_client()
```

This will:

- Create a virtual environment named `r-sage-client`
- Install the required Python dependency [`sage-data-client`](https://pypi.org/project/sage-data-client/)

---

## 🚀 Example Usage

```r
library(sageDataR)

# Query temperature sensor data from the last hour
df <- query_sage_data(
  start = "-1h",
  filter = list(name = "env.temperature")
)

head(df)
```

---

## 🧠 Notes

- You must have Python and `virtualenv` installed.
- Only one Python environment can be active per R session. If you see:

  ```
  failed to initialize requested version of Python
  ```

  You need to restart R and reload the package.

- This package uses `{reticulate}` to connect R with Python.

---

## 🔍 Function Reference

### `install_sage_client(envname = "r-sage-client")`

Creates a Python virtualenv and installs the `sage-data-client` dependency into it.

### `query_sage_data(start, end = NULL, filter = NULL, head = NULL, tail = NULL)`

Wraps the Python function `sage_data_client.query()`. Parameters:

| Argument | Description |
|----------|-------------|
| `start`  | **Required.** Relative or absolute start timestamp (e.g., `"-1h"` or `"2024-05-01T00:00:00Z"`). |
| `end`    | Optional. End timestamp. |
| `filter` | Optional. A named list of filters, e.g., `list(name = "env.temperature")`. |
| `head`   | Optional. Return earliest N records per series. |
| `tail`   | Optional. Return latest N records per series. |

---

## 🔗 Related Resources

- [Sage Project Overview](https://sagecontinuum.org/about)
- [Sage Data Portal](https://portal.sagecontinuum.org/nodes)
- [CROCUS Sensor Network](https://crocus.sagecontinuum.org/nodes)
- [Python `sage-data-client` on PyPI](https://pypi.org/project/sage-data-client/)

---

## 📄 License

MIT © Your Name
