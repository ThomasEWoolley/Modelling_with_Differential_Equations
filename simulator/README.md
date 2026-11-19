# ODE Explorer

ODE Explorer is an interactive simulator and phase-plane plotter for autonomous ordinary differential equations. It is designed for students, lecturers and anyone who wants to connect an equation with its dynamics. Enter a model, click a starting point and compare its trajectory in state space with its solution over time.

**[Open ODE Explorer](https://thomaswoolley.co.uk/ode-explorer/)** · **[Website page with embedded applet](https://thomaswoolley.co.uk/ode-explorer.html)** · **[Course materials](https://github.com/ThomasEWoolley/Modelling_with_Differential_Equations)**

The applet is free to use, runs in a modern browser and requires no account, MATLAB installation or other software. It accompanies Thomas E. Woolley's *Modelling with Differential Equations* course at Cardiff University. Equations and numerical calculations are processed in your browser.

## What can I explore?

Choose a single autonomous equation,

$$\frac{du}{dt}=f(u),$$

or a system of two autonomous equations,

$$\frac{du}{dt}=f(u,v),\qquad \frac{dv}{dt}=g(u,v).$$

The three panels show different parts of the same model:

| Panel | One equation | Two equations |
| --- | --- | --- |
| Left: model and solver | Equation, parameters, initial value, time interval and numerical settings | Both equations, shared parameters, both initial values and the same solver controls |
| Middle: phase plot | A graph of du/dt against u, showing where u increases, decreases or remains stationary | A phase plane with u horizontally and v vertically, showing the local vector field, nullclines and trajectories |
| Right: time solution | u(t) against t | Both u(t) and v(t) against t |

Use it to investigate stability, thresholds, oscillations, limit cycles, population models and changes in behaviour as a parameter varies. Thirteen worked examples are supplied, and User defined starts with blank equations.

## Get started

1. Choose One equation or Two equations.
2. Select an example. Its equations, parameters, plot window and an initial trajectory load automatically.
3. Click inside the middle plot to add a new initial condition. For a single equation, the horizontal coordinate sets u₀; the vertical coordinate is ignored. For two equations, the clicked coordinates set (u₀, v₀).
4. Compare the new trajectory with its time solution in the right panel. Each initial condition has a matching colour in both plots.
5. Move a parameter slider to see how the field, nullclines, equilibria and every retained solution change together.

You can also type initial values into the left panel and press Simulate. The initial values apply at Start t₀. Integration proceeds to End t, normally forwards in time. Setting the end time below the start time integrates backwards; arrows still indicate forward physical time.

## Enter your own equations

Select User defined. Enter f and, in two-equation mode, g. Enter the right-hand sides only: for example, type `r*u*(1-u/K)`, without `du/dt =`.

For logistic growth, choose One equation and enter:

```text
r*u*(1-u/K)
```

The applet detects r and K and asks for a baseline for each. For example, set r = 1 and K = 10. You can then set u(t₀) = 0.5 and simulate.

For a damped pendulum, choose Two equations and enter:

```text
f(u,v): v
g(u,v): -sin(u)-b*v
```

Set the baseline of b to 0.3 and try different angles and velocities. The applet uses u and v for the state variables, whatever their interpretation in your model.

### Expression syntax

| Meaning | What to type |
| --- | --- |
| Addition and subtraction | `u+v`, `u-v` |
| Multiplication | `u*v`, `2*u` |
| Division | `u/(1+u^2)` |
| Powers | `u^2`, `u**2` |
| Brackets | `(u-1)*(u+1)` |
| Trigonometric functions | `sin(u)`, `cos(u)`, `tan(u)`, `asin(u)`, `acos(u)`, `atan(u)` |
| Hyperbolic functions | `sinh(u)`, `cosh(u)`, `tanh(u)` |
| Exponentials and logarithms | `exp(u)`, `log(u)` or `ln(u)` for the natural logarithm, `log10(u)` |
| Other functions | `sqrt(u)`, `abs(u)`, `sign(u)`, `floor(u)`, `ceil(u)` |
| Functions with two arguments | `min(u,v)`, `max(u,v)`, `pow(u,2)`, `atan2(v,u)` |
| Constants | `pi`, `e` |
| Scientific notation | `1e-3`, `2.5e4` |
| MATLAB elementwise operators | `u.^2`, `u.*v`, `u./v` |

Implicit multiplication such as `2u` or `2(u+1)` is accepted. Write `u*v` explicitly: `uv` is interpreted as a parameter named uv. Names are case-sensitive and may contain letters, underscores and digits, but must start with a letter or underscore. Functions need brackets around their arguments.

These are autonomous equations. The independent time variable is not available in f or g. A name such as t appearing in an expression is treated as a constant parameter, not as evolving time. Keep pi, e and the built-in function names for their standard meanings.

## Parameters and sliders

Parameter controls appear automatically for names in your equations other than u, v, built-in functions and constants. A parameter used in both equations has one shared control.

| Setting | Behaviour |
| --- | --- |
| Baseline only; both limits blank | The parameter stays fixed at the baseline. |
| Baseline, Min and Max supplied | A slider is enabled between Min and Max, initially at the baseline. |
| Min equals Max and both equal the baseline | The parameter is fixed. |
| Only one limit supplied | A message asks you to supply both limits or clear both. |
| Baseline outside the limits, or Min above Max | A message asks you to correct the range before updating the plots. |

Moving a slider automatically re-simulates all retained initial conditions and redraws both plots. It does not add another trajectory. The displayed value above the slider is its current value; the baseline remains available for comparison. Press Reset on a parameter to return it to its baseline. Changing the baseline also sets the current value to the new baseline.

Existing examples have useful slider ranges already configured. You can change those ranges or clear both limits to keep a parameter fixed. Parameter changes made while a simulation is running are queued so the applet eventually uses the latest values.

## Read the plots

### Direction arrows and nullclines

In the two-dimensional phase plane, arrows show the local direction of the velocity vector (f,g). Arrow lengths are normalised to make directions easy to compare, so their lengths are not a measure of speed.

The solid blue curve is the u-nullcline, where f = 0. The dashed orange curve is the v-nullcline, where g = 0. Their intersections are possible equilibria. A nullcline is not generally a trajectory.

For one equation, the middle plot shows f(u). Positive values mean u increases; negative values mean u decreases. The zero line marks f(u) = 0. Direction arrows on the curve and near the u-axis show the direction of motion. The coloured part of the curve shows the states visited by each simulated solution.

### Initial conditions and equilibria

Initial conditions use circular markers. Equilibria use larger square markers with a contrasting border. Stable equilibria are filled; other classifications use an outlined square. Hover over a square for its coordinates, classification and eigenvalues.

The Equilibria section lists the numerically detected positions and their stability classification. In 1D it reports the eigenvalue f′(uₛ). In 2D it reports both eigenvalues of the Jacobian at (uₛ,vₛ), including complex conjugate pairs.

A positive real part establishes linear instability. If all real parts are negative, the equilibrium is locally asymptotically stable. Zero real parts need further analysis. In particular, Centre (linearisation) describes the linearised system and does not by itself prove that the nonlinear system has a centre. The 1D classification also uses flow directions on either side of the equilibrium, which can distinguish stable, unstable and semistable roots even when the derivative vanishes.

### Compare several solutions

Leave Keep previous initial conditions ticked to retain up to 12 trajectories. Click a trajectory row to highlight it in both plots. Use its × button to remove it, or Clear all to remove every trajectory. Untick Keep previous initial conditions to replace the displayed trajectories with each new simulation.

The time plot uses solid lines for u(t) and dashed lines for v(t). The colour identifies the initial condition. The phase window is fixed by your chosen limits; the time plot automatically fits all retained solutions. A curve leaving the phase window can continue to be integrated and remain visible in the time plot.

Apply model & redraw re-simulates the retained initial conditions without adding another. Simulate adds the initial condition currently entered on the left. Reset example restores the selected example and its defaults; for User defined it clears the equations.

## Preloaded examples

| Example | Dimension | Equations | Try this |
| --- | --- | --- | --- |
| Logistic growth | 1D | `r*u*(K-u)` | Compare growth below K with decay towards K from above. |
| Bistability | 1D | `2*u^2/(1+u^2)-a*u` | Compare initial values on either side of the unstable threshold. |
| Saddle-node bifurcation | 1D | `a-u^2` | Move a through zero and watch a pair of equilibria appear or disappear. |
| Pitchfork bifurcation | 1D | `a*u-u^3` | Change a from negative to positive. |
| Fish and fishermen | 2D | `a*u*(1-u)-u*v`; `b*(u-v^2)` | Change b to compare a node with a spiral. |
| Pendulum | 2D | `v`; `-sin(u)` | Compare oscillations with full rotations. |
| Damped pendulum | 2D | `v`; `-sin(u)-b*v` | Increase damping and follow the loss of oscillations. |
| Lotka–Volterra | 2D | `u*(1-v)`; `a*v*(u-1)` | Compare predator–prey cycles from different initial conditions. |
| Stable limit cycle | 2D | `v+u*(1-u^2-v^2)`; `-u+v*(1-u^2-v^2)` | Start inside and outside the unit circle. |
| Linear saddle | 2D | `u`; `-v` | Compare the stable and unstable coordinate directions. |
| Stable spiral | 2D | `-a*u-v`; `u-a*v` | Move a through zero to change the stability of the rotation. |
| Nullclines from Chapter 6 | 2D | `v-(u-2)*(u-3)`; `v-log(u)` | Compare the parabola and logarithmic nullclines. Use u > 0. |
| FitzHugh–Nagumo | 2D | `(u*(0.5-u)*(u-1)-v)/eps`; `u-gamma*v` | Explore the separation between fast and slow dynamics. |

Most examples are adapted from the course notes and the [MATLAB scripts](https://github.com/ThomasEWoolley/Modelling_with_Differential_Equations/tree/main/Matlab). The FitzHugh–Nagumo defaults preserve eps = 0.001 and gamma = 2 from the original script. The logarithmic example preserves equations (6.3)–(6.4) of the notes.

## Solver settings and accuracy

| Control | What it changes |
| --- | --- |
| Start t₀ and End t | The time interval over which each initial condition is simulated. |
| Adaptive Runge–Kutta 5(4) | Dormand–Prince integration with automatic step-size adjustment and local error control. This is the default. |
| Fixed-step Runge–Kutta 4 | Classical RK4 using the selected step, shortened at the endpoint. It does not control error automatically. |
| Maximum step | The largest allowed RK45 step, or the fixed RK4 step. Smaller values give more points and cost more computation. |
| Relative tolerance | The local error target for RK45. A smaller value requests greater accuracy. Absolute tolerance is 0.001 times this value. |
| Plot window & display | Axis limits, arrow density, nullcline and equilibrium visibility, and an equal-axis-scales option in 2D. |

Integration uses physical time, and both plots use the same computed solution points. Each run is limited to 60,000 step attempts and a state magnitude of 10⁷. If the equation becomes undefined, a step cannot be resolved or a limit is reached, the applet reports an early stop instead of claiming the full interval was completed.

This applet supports teaching and exploration. Compare results against analytical reasoning and, where needed, repeat with smaller steps or tighter tolerances. Both solvers are explicit; very stiff systems may need a dedicated stiff solver. Equilibrium searches and nullcline contours are numerical and can miss narrow features, tangential nullclines or non-isolated equilibria. They are not symbolic proofs.

## Download your results

Press PNG above either plot to download a high-resolution image with the current equations, parameter values and a plot legend. Press CSV in the Trajectories section to download all computed solution points. CSV columns are `trajectory,t,u` in 1D and `trajectory,t,u,v` in 2D. The trajectory number matches the list in the applet.

Only the displayed curves are reduced to about 5,000 vertices when needed for performance. CSV retains the full computed data. Downloads are created locally in your browser.

## Keyboard use

Use Tab to move between controls. Sliders support the browser's arrow, Home and End keys. With the phase plot focused, use Left and Right to change u₀, and Up and Down to change v₀ in 2D. Hold Shift for smaller changes. Press Enter to simulate from the entered initial condition.

The layout adapts to smaller screens, and colours are accompanied by line styles and marker shapes. The applet is easiest to compare side by side on a wide screen.

## Embed the applet elsewhere

The public applet can be embedded without a login:

```html
<iframe
  src="https://thomaswoolley.co.uk/ode-explorer/"
  title="ODE Explorer: interactive ODE simulator and phase-plane plotter"
  width="100%"
  height="1650"
  loading="lazy"
  style="border: 1px solid #dce4eb; border-radius: 12px;">
</iframe>
<p><a href="https://thomaswoolley.co.uk/ode-explorer/">Open ODE Explorer at full size</a></p>
```

Keep the full-size link available when the embedding column is narrow. You can change the iframe height to suit your page. The dedicated page on Thomas's website uses a same-origin resize observer so its embedded height follows the applet's content automatically.

## Run or modify locally

From the root of this repository:

```sh
python3 -m http.server 8000 --directory simulator
```

Open http://localhost:8000. There is no build step and no third-party runtime dependency. All six runtime files must remain together: `index.html`, `style.css`, `engine.js`, `examples.js`, `app.js` and `solver-worker.js`. Keep the MIT licence with redistributed copies. Opening index.html directly also uses a main-thread fallback, but serving over HTTP enables the integration worker.

The mathematical source of truth is this repository's `simulator/` directory. The public copy is deployed by the [personal website repository](https://github.com/ThomasEWoolley/ThomasEWoolley.github.io/tree/master/ode-explorer). Its `scripts/sync_ode_explorer.py` helper copies the runtime files from a local course checkout.

Run the numerical checks with:

```sh
node simulator/engine.test.cjs
```

Sixteen test groups cover analytic solutions, backwards integration, RK4 convergence, solver termination, all thirteen examples, parameter discovery and validation, scalar derivatives and real/complex Jacobian eigenvalues. Desktop Chrome checks cover the custom-model workflow, parameter sliders, updating retained curves, marker styles, eigenvalue readouts and exports. Touch-specific behaviour and other browsers have not been exhaustively checked.

## Credits and licence

Created for Thomas E. Woolley's *Modelling with Differential Equations* course. Examples draw on the course notes and MATLAB scripts. Interface inspiration came from [Bluffton's slope-field app](https://homepages.bluffton.edu/~nesterd/apps/slopefields.html), [Thomas Scofield's phase-plane plotter](https://scofield.site/teaching/demos/PhasePortrait2D.html), [John Dews-Flick's phase-plane plotter](https://choosedews.github.io/PhasePlane/), [Pablo Rodríguez-Sánchez's GeoGebra phase plane](https://www.geogebra.org/m/utcMvuUy), [Kevin Anderson's phase-plane plotter](https://kevbase.com/tools/phase-plotter.html), [Runcell's generator](https://www.runcell.dev/tool/slope-field-generator) and the [Python Control phase-plot documentation](https://python-control.readthedocs.io/en/0.10.2/phaseplot.html). The implementation is original and does not copy code from those references.

This project is distributed under the repository's [MIT licence](../LICENSE).
