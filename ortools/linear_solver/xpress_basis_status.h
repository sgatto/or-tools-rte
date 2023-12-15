#ifndef OR_TOOLS_XPRESS_BASIS_STATUS_H_
#define OR_TOOLS_XPRESS_BASIS_STATUS_H_

#include "linear_solver.h"

namespace operations_research {

enum XPRS_BASIS_STATUS {
  XPRS_AT_LOWER = 0,
  XPRS_BASIC = 1,
  XPRS_AT_UPPER = 2,
  XPRS_FREE_SUPER = 3
};

// Transform MPSolver basis status to XPRESS status
int MPSolverToXpressBasisStatus(MPSolver::BasisStatus mpsolver_basis_status);
// Transform XPRESS basis status to MPSolver basis status.
MPSolver::BasisStatus XpressToMPSolverBasisStatus(int xpress_basis_status);
}
#endif
