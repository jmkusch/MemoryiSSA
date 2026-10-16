#' @title Calculate RSS
#' @export
#' @author Julie W. Turner, Alec L. Robitaille
calc_rss_by_year <- function(pred_h1s, h1_col, pred_h2s, h2_col) {
  if (length(pred_h1s) != length(pred_h2s)) {
    errorCondition("Predict H1 and Predict H2 are not the same length")
  }
  log_rsses <- lapply(1:length(pred_h1s), function(i, pred_h1s, pred_h2s)  {
    year_pred_h1 <- pred_h1s[[i]][[1]]
    year_pred_h2 <- pred_h2s[[i]][[1]]
    pred_h1 <- pred_h1s[[i]][[2]]
    pred_h2 <- pred_h2s[[i]][[2]]
    if (year_pred_h1 != year_pred_h2) {
      errorCondition("Years Don't match")
    }
    log_rss <- merge(pred_h1[, .SD, .SDcols = c('id', 'x', h1_col)],
                     pred_h2[, .SD, .SDcols = c('id', h2_col)],
                     by = 'id', all.x = TRUE,
                     allow.cartesian=TRUE)
    log_rss[, rss := h1 - h2,
            env = list(h1 = h1_col, h2 = h2_col)]
    return(list(year_pred_h1, log_rss))
  },pred_h1s,
  pred_h2s)
  return(log_rsses)
}
