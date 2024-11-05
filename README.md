To start a development shell with programs specified in flake.nix, run the following:

```
# Enter development shell
nix develop github:wch/nix-nb-demo
```

This development shell will have Python installed, along with a number of Python packages, like Jupyter. It will also automatically create a virtual environment in ./venv and activate it.

With the above command, you'll have access to the programs specified in flake.nix, as well as any programs that are in your normal environment, like `git`.

Alternatively, you can run in a purer environment, where only the programs specified in flake.nix are available, by using `-i`:

```
nix develop -i github:wch/nix-nb-demo
```

This won't even have `git` available, unless you modify flake.nix to include it. This mode can be useful for testing whether your flake.nix includes all the programs you need for your development environment.


Once you've started a shell with either of the above commands, you can start JupyterLab:

```
jupyter-lab
```

Or you can run Python directly. For example:

```
python -c "import sys; print(sys.version)"
#> 3.12.5 (main, Aug  6 2024, 19:08:49) [Clang 16.0.6 ]#> Python 3.12.5
```
