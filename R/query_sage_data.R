#' Query Sage Sensor Data
#'
#' This function wraps the Python function `sage_data_client.query()` to pull Sage/Crocus sensor data.
#'
#' @param start Required. Start timestamp (relative or absolute, in yyyy-mm-dd hh:mm:ss format).
#' @param end Optional. End timestamp.
#' @param filter A named list of filters (e.g., list(name = "env.temperature")).
#' @param head Optional. Limit to head values per series.
#' @param tail Optional. Limit to tail values per series.
#'
#' @return A data.frame containing the results.
#' @export
query_sage_data <- function(start, end = NULL, filter = NULL, head = NULL, tail = NULL) {
  if (is.null(.sage_env$sage)) {
    stop("Python module 'sage_data_client' is not available. Run install_sage_client() first.")
  }
  
  result <- .sage_env$sage$query(
    start = start,
    end = end,
    filter = filter,
    head = head,
    tail = tail
  )
  
  as.data.frame(result)
}