#include <Rcpp.h>
#include <RcppEigen.h>
#include <Eigen/Core>
#include <caf/all.hpp>
#include <dist_node.hpp>

using namespace Rcpp;
using namespace caf;
using Eigen::Map;
using Eigen::MatrixXd;

// [[Rcpp::depends(RcppEigen)]]
// [[Rcpp::export]]
Rcpp::NumericMatrix rcpp_caf_dist(SEXP inMatrix, SEXP ncore) {
    unsigned int i;
    unsigned int nCores = as<unsigned int>(ncore);
    const Map<MatrixXd> locations(as<Map<MatrixXd> >(inMatrix));
    scoped_actor* self = new scoped_actor(); 
    std::vector<caf::actor> workers;
    actor_pool::policy plcy = actor_pool::round_robin();
    auto worker_pool = actor_pool::make(plcy);  

    for (i = 0; i < nCores; i++)
    {
       workers.push_back((*self) -> spawn<dist_node, monitored>(locations, *self));
       (*self) -> send(worker_pool, sys_atom::value, put_atom::value, 
                 workers[workers.size()-1]);
    }    

    delete self;
    return(wrap(locations));
}
