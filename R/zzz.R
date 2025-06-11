# Author: Luis X. de Pablo
# Contact: luis.depablo@colorado.edu

# initialize package level environment
.sage_env <- new.env(parent = emptyenv())

# runs when package is loaded
.onLoad <- function(libname, pkgname) {
  envname <- "r-sage-client"

  # attempt setup if Python hasn't been initialized
  if (!reticulate::py_available(initialize = FALSE)) {
    if (reticulate::virtualenv_exists(envname)) {
      reticulate::use_virtualenv(envname, required = TRUE)

      # import python module after environment is set
      if (reticulate::py_module_available("sage_data_client")) {
        .sage_env$sage <- reticulate::import("sage_data_client", delay_load = TRUE)
      } else {
        # if python module isn't available, give instructions to install it
        packageStartupMessage(
          "Virtualenv 'r-sage-client' exists but 'sage-data-client' is not installed.\n",
          "Run install_sage_client() to install it."
        )
      }

    } else {
      # if virtual environment doesn't exist, give instructions to create it
      packageStartupMessage(
        "Virtualenv 'r-sage-client' not found.\n",
        "Run install_sage_client() to create it and install dependencies."
      )
    }
  } else {
    # if python is already initialized, r needs to be restarted
    packageStartupMessage(
      "Reticulate has already initialized Python. Skipping environment setup.\n",
      "To use 'r-sage-client', restart R before loading other packages that use Python."
    )
  }
}

#' Install the Python 'sage-data-client' Package
#'
#' This function creates a virtualenv called 'r-sage-client' and installs the
#' Python dependency `sage-data-client` into it.
#'
#' @param envname Name of the virtualenv to use or create (default: "r-sage-client")
#' @export
install_sage_client <- function(envname = "r-sage-client") {
  reticulate::virtualenv_create(envname, python = NULL)
  reticulate::virtualenv_install(envname, packages = "sage-data-client")
  reticulate::use_virtualenv(envname, required = TRUE)
  .sage_env$sage <- reticulate::import("sage_data_client", delay_load = TRUE)
  message("Installation complete. You can now use query_sage_data().")
}
