/*
 * OWL - an OCaml numerical library for scientific computing
 * Copyright (c) 2016-2017 Liang Wang <liang.wang@cl.cam.ac.uk>
 */

#include "owl_maths.h"
#include "owl_stats.h"

/** Weibull distribution **/

double weibull_rvs(double a) {
  return pow(std_exp_rvs(), 1. / a);
}