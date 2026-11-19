# ODE Explorer

Browser-based simulator for autonomous scalar ODEs and systems of two ODEs. This prototype lives in `simulator/` on the `ode-simulator` branch. It is not embedded in Thomas Woolley's website.

Private review version: https://woolley-ode-explorer.thomas-woolley.chatgpt.site

## Run

Serve this folder with any static HTTP server, for example `python3 -m http.server 8000 --directory simulator` from the repository root, then open http://localhost:8000. There is no build step and no third-party runtime dependency. Opening `index.html` directly also works using a main-thread solver fallback; HTTP enables the worker.

## Interaction

The left panel holds equations, parameters, initial values and integration settings. The centre shows `(u, du/dt)` for one equation or `(u, v)` for two equations. The right shows the corresponding time solutions.

Click the centre plot to add a trajectory. In 1D only the horizontal coordinate sets the initial condition. Direction arrows indicate forward physical time, including when integrating backwards. Up to 12 initial conditions can be retained. Each trajectory uses the same colour in both plots; `u(t)` is solid and `v(t)` dashed. Click a trajectory row to highlight it. A new simulation re-integrates retained initial conditions with the current model and options. Apply model & redraw updates all retained curves without adding another.

The plot window, arrow density, nullclines, equilibrium markers and equal axis scales can be adjusted. The time plot fits the data automatically. Trajectories may leave the phase window without ending integration. PNG export includes the equations and parameters; CSV exports all computed points. Keyboard users can focus the phase plot, adjust initial values with arrow keys (Shift for smaller changes), and press Enter.

Expressions support `u`, `v`, parameters, `+ - * / ^`, parentheses, `pi`, `e`, common elementary functions and MATLAB elementwise operators. Implicit multiplication such as `2u` or `2(u+1)` is accepted; write `u*v` explicitly. Parameters use `r = 1; K = 10` and can refer to previously defined parameters. The parser builds expression closures without `eval` or `Function`. Time-dependent expressions are rejected because this app displays autonomous phase portraits.

## Numerical methods and limits

- Adaptive Dormand-Prince RK5(4), with a maximum componentwise error ratio using `atol + rtol*max(abs(old),abs(new))`. Absolute tolerance is 0.001 times relative tolerance. Rejected steps are reduced and retried.
- Classical fixed-step RK4. Its selected step is shortened for the final step to reach the endpoint. No automatic error control is applied.
- Integration is performed in actual time, not arc length. The same computed points feed both plots. Worker computation keeps the controls responsive.
- A run stops at 60,000 step attempts, an unresolvable step, undefined/non-finite values, or state magnitude above 10^7. The reason is shown rather than implying completion. These are explicit solvers; a stiff method is not implemented.
- Equilibria are numerical estimates. Scalar searches combine sign brackets with Newton seeds at minima of absolute residual, including even-multiplicity roots. Planar searches use a grid of Newton seeds and a numerical Jacobian. Stability uses scalar flow signs or Jacobian trace and determinant. 'Centre (linearisation)' deliberately does not assert nonlinear stability.
- Planar nullclines use numerical zero contours on a triangulated grid with edge bisection and joined paths for continuous dash patterns. Undefined values and apparent poles are rejected. Entire zero-valued window edges are drawn. Tangential nullclines, narrow features, non-isolated equilibria and roots missed by the seed grid require analytical checks. This is a teaching and exploration tool, not symbolic analysis or a certified solver.
- Display paths are capped at about 5,000 vertices per solution for performance. CSV retains all computed integration points.

## Examples and provenance

Thirteen examples include logistic growth, bistability, a saddle-node, a pitchfork, fish and fishermen, pendulum, damped pendulum, Lotka-Volterra, a stable limit cycle, a saddle, a stable spiral, Chapter 6 nullclines, and FitzHugh-Nagumo.

Course sources: `Full.pdf`, MA0232 Modelling with Differential Equations, edited 10 March 2021, Chapters 4, 6 and 7; Dropbox `/ODE_course/Matlab`; and this repository's `Matlab` folder. Adapted scripts include `Logistic.m`, `Multi_stability_multi_IC_plotter_E9.m`, `Fishing_problem_ODEs_node.m`, `Lotka_volterra.m`, `Limit_cycle.m`, `Damped_pendulum.m` and `Fitzhugh_Nagumo.m`. The FitzHugh-Nagumo example preserves epsilon = 0.001 and gamma = 2. The Chapter 6 example preserves equations (6.3)-(6.4) with u > 0.

Interface inspiration, reviewed 19 November 2026:

- https://homepages.bluffton.edu/~nesterd/apps/slopefields.html
- https://scofield.site/teaching/demos/PhasePortrait2D.html
- https://choosedews.github.io/PhasePlane/
- https://www.geogebra.org/m/utcMvuUy
- https://kevbase.com/tools/phase-plotter.html
- https://www.runcell.dev/tool/slope-field-generator
- https://python-control.readthedocs.io/en/0.10.2/phaseplot.html

The implementation is original. It does not copy code from these references.

## Verification

Run `node simulator/engine.test.cjs` from the repository root. Twelve test groups cover parser precedence and rejected code, parameter validation, exponential/logistic analytic solutions, backward integration, harmonic-oscillator phase/energy, RK4 convergence, blow-up and domain termination, scalar equilibria including a tangent root and pole rejection, planar classification, and successful integration of all thirteen examples.

Browser checks covered switching modes and examples, phase-plot clicks, keyboard initial conditions, retaining and highlighting trajectories, invalid expressions, continuous nullcline dash patterns, and completed PNG/CSV downloads. The exported PNG was visually inspected. Browser checks used desktop Chrome; touch-specific behaviour and other browsers have not been checked.

Embedding and changes to the live personal website are intentionally deferred until Thomas approves the solver and plots.
