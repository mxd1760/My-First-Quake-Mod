import pathlib
import shutil


all_artifacts_dir = pathlib.Path("build", "My-First-Quake-Mod-All-Build-Artifacts")
final_dir = pathlib.Path("build", "My-First-Quake-Mod")
# This makes it so that the build files are put in a separate directory. See
# <https://scons.org/doc/production/HTML/scons-user/ch15.html>.
map_targets = SConscript(
    pathlib.Path("src", "SConscript"),
    variant_dir=all_artifacts_dir
)


shutil.rmtree(final_dir, ignore_errors=True)
Install(target=pathlib.Path(final_dir, "maps"), source=map_targets)
