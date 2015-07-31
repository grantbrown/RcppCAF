#ifndef CAF_DIST_NODE_HEADER
#define CAF_DIST_NODE_HEADER

#include <caf/all.hpp>
#include <Eigen/Core>

using namespace caf;
using euclidean_atom = atom_constant<atom("euclid")>; 
using wakeup_atom = atom_constant<atom("wakeup")>;
using exit_atom = atom_constant<atom("exit")>;


class dist_node : public event_based_actor {
    public:
        dist_node(Eigen::MatrixXd locations, actor parent);
        ~dist_node();
    protected:
        double calculateDistance(size_t row1, size_t row2);
        behavior make_behavior() override;
    private:
        Eigen::MatrixXd locations;
        actor parent;
        behavior alive;
};

#endif
