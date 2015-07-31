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
Rcpp::NumericVector rcpp_caf_dist(SEXP inMatrix, SEXP ncore) {
    unsigned int i, j;
    unsigned int nCores = as<unsigned int>(ncore);
    const Map<MatrixXd> locations(as<Map<MatrixXd> >(inMatrix));
    unsigned int loc_rows = locations.rows();
    unsigned int work_items = (loc_rows*(loc_rows-1))/2; 

    scoped_actor* self = new scoped_actor(); 
    std::vector<caf::actor> workers;
    actor_pool::policy plcy = actor_pool::round_robin();
    auto worker_pool = actor_pool::make(plcy);  

    Rcpp::NumericVector outputVector(work_items);
    for (i = 0; i < nCores; i++)
    {
       workers.push_back((*self) -> spawn<dist_node, monitored>(locations, *self));
       (*self) -> send(worker_pool, sys_atom::value, put_atom::value, 
                 workers[workers.size()-1]);
    }    

    // send row indexes
    
    for (i = 0; i < loc_rows; i++)
    {
        for (j = 0; j < i; j++)
        {
            (*self) -> send(worker_pool, euclidean_atom::value, i, j);
        }
    }

    i = 0;
    (*self) -> receive_for(i, work_items)(
                [&](unsigned int idx, double result){
                    outputVector(idx) = result;
                });


    delete self;
    return(outputVector);
}
