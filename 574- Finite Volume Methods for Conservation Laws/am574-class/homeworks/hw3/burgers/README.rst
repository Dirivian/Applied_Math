
Solve Burgers' equation with data::

    q(x,0) = q1 for x < 0
             q2 for x > 0

with periodic boundary conditions.  The true solution coded in setplot.py
assumes that `q1 < q2` so there is a shock coming in from the left boundary
while the discontinuity at the origin gives a rarefaction wave.
`q1` and `q2` can be changed in `setrun.py`

The parameter efix can be set in setrun.py to specify whether the entropy
fix is used in the Riemann solver `rp1_burgers.f90`.  

Note how these parameters are read in by `setprob.f90` and passed to the
routines where they are needed via common blocks.

