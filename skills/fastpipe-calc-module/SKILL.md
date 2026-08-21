---
name: fastpipe-calc-module
description: Use when adding, modifying, or wiring up a calculation in the fastpipe codebase - implementing a design standard (DNV, PD 8010, API, ASME, SAFEBUCK), adding a new check to core/, exposing a calc to the CLI, registering its outputs, or writing its benchmark test. Triggers include "add a wall-thickness check", "implement DNV-... in fastpipe", "new calc module", "why isn't my calc showing in results", "register outputs".
license: MIT
metadata:
  author: benranderson
  version: "1.0.0"
  repo: fastpipe
---

# FastPipe calculation module

## Overview

A fastpipe calculation is a plain function in `src/fastpipe/core/` that takes scalar/array inputs in **base SI units**, runs a vectorised standards calculation, and returns a dict keyed by output symbol. The framework converts units, dispatches by name, annotates results, and reports them. Getting a new calc to appear in results means touching a fixed set of files, not just writing the maths.

This is fastpipe-specific. fastpsi wires calcs differently (through `parametric.py` / `run_f114`), so do not apply this recipe there.

## When to use

- Implementing or editing a design-code calculation (DNV-ST-F101/F105/F109, PD 8010-2, API RP 1111, ASME B31.8, SAFEBUCK, etc.)
- Adding a new check to `core/` or a new output to an existing check
- A calc runs but its outputs are missing from the report, or the CLI does not recognise the step

## The recipe (do all that apply)

1. **Write the function** in `core/<name>.py` (or a subpackage like `core/dnv/`). Signature is a flat list of named inputs; body calls helpers and `general.*`; return a dict.
2. **Register the entry point** in `core/__init__.py`: add an `import ... as <step>` and add `<step>` to `__all__`. The CLI resolves steps via `getattr(core, step)`.
3. **Register every output** in `src/fastpipe/data/data/outputs.csv` (`Parameter,Description,Ref.,Units`). Unregistered output keys raise a `KeyError` during annotation.
4. **If the calc returns anything other than a flat 1D dict** (e.g. a `(summary, details)` tuple, or per-profile DataFrames), add its step name to `config.COMPLEX` so it uses `complex_solver` instead of the simple `solver`.
5. **If it is part of `mech`/`pip_mech`**, add it to the relevant list in `expand_mech_design()` in `calculate.py`.
6. **Register any new inputs** in `src/fastpipe/data/data/definitions.csv` (`symbol,description,units`) so they can come from the premise.
7. **Write a benchmark test** in `tests/unit/core/test_<name>.py` (see pattern below).
8. **Verify**: `make lint && make format && make unit`.

## Docstring convention (required)

Every calc function documents the standard it implements and every parameter with its **base unit in brackets**. Match this format exactly (see [core/walk.py](../fastpipe/src/fastpipe/core/walk.py), [core/pd8010.py](../fastpipe/src/fastpipe/core/pd8010.py)):

```python
def main(D, t, L, ..., g):
    """SAFEBUCK JIP pipeline axial walking calculation [2].

    Includes:

    - Check for susceptibility to thermal axial walking
    - Thermal axial walking

    Parameters
    ----------

    - D   : `float` : Steel outside diameter [m]
    - t   : `float` : Nominal wall thickness [m]
    - g   : `float` : Gravitational acceleration [m/s²]

    References
    ----------

    1. Safebuck JIP, "Safe Design of Pipelines with Lateral Buckling Design
       Guideline", Rev B, October 2014
    """
```

Helper functions cite the specific clause/equation inline: `"""Critical friction [3 - Eq. A1.8]."""`. Use British English. Inputs and outputs are always base SI; unit conversion happens in the solver, never inside the calc.

## Return convention

Return a dict keyed by the exact output symbol used in `outputs.csv`. Spread shared sub-results with `**`:

```python
return {
    **w_sub,                    # spread another Bunch/dict of results
    "beta_f": beta_f,
    "walk_check": walk_check,   # string outputs are fine (Ref./Units = "-")
    "walk_therm": walk_therm,
}
```

`core/bunch.py` provides `Bunch` (dict with attribute access) for calcs that build richer keyed results; `general.get_w_sub(..., full_output=True)` returns one.

## Test pattern (benchmark against reference data)

Tests compare computed results to stored benchmark data within a tolerance, using the shared `get_cases`/`get_results` fixtures (from `conftest.py`). Copy [tests/unit/core/test_walk.py](../fastpipe/tests/unit/core/test_walk.py):

```python
import numpy as np
import pytest
from fastpipe.core import walk

TOL = 1e-5

@pytest.fixture(scope="module")
def data(get_cases):
    return get_cases("walk")            # loads benchmark inputs + expected outputs

@pytest.fixture(scope="module")
def results(data, get_results):
    return get_results(data, walk)      # runs walk.main on the cases

@pytest.mark.parametrize("param", ["w_sub", "beta_f", "walk_therm"])
def test_params_close(param, results, data):
    np.testing.assert_allclose(results[param], data[param], rtol=TOL)

@pytest.mark.parametrize("param", ["walk_check"])   # string outputs
def test_params_equal(param, results, data):
    np.testing.assert_equal(results[param], data[param])
```

Mark long-running calcs (time-stepping, root-finding over many cases) with `@pytest.mark.slow`; they are skipped by `make unit`/`make test` and included by `make test-slow`.

## Common mistakes

- Output missing from the report -> not added to `outputs.csv`.
- `KeyError` on a result key during annotation -> same cause.
- CLI says the step is unknown -> not imported/added to `__all__` in `core/__init__.py`.
- Returning a tuple or nested DataFrames with the simple solver -> add the step to `config.COMPLEX`.
- Doing unit conversion inside the calc -> don't; the solver passes base SI in and converts out. Keep the `[unit]` docstring accurate.
- Non-convergence noise from `scipy.optimize.newton` -> pass `disp=False` (see `walk.get_beta_f`).

## Units discipline

All calc I/O is base SI. For the conversion contract, custom base units, and the D-includes-coating / mm-vs-m gotchas, defer to the units skill if present; never hand-convert inside a calc.

## Verify

```bash
make lint      # ruff check --fix
make format    # ruff format
make unit      # fast unit tests (-n auto, slow skipped)
make test-slow # include @pytest.mark.slow
```
