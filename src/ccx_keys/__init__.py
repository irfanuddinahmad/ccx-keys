"""init"""

from importlib.metadata import PackageNotFoundError, version

try:
    __version__ = version("edx-ccx-keys")
except PackageNotFoundError:  # pragma: no cover
    pass
