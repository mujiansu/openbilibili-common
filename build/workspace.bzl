# TensorFlow external dependencies that can be loaded in WORKSPACE files.

load("//vendor:repo.bzl", "bili_http_archive")


# Sanitize a dependency so that it works correctly from code that includes
# TensorFlow as a submodule.
def clean_dep(dep):
  return str(Label(dep))

# If TensorFlow is linked as a submodule.
# path_prefix is no longer used.
# tf_repo_name is thought to be under consideration.
def bili_workspace(path_prefix="", tf_repo_name=""):
  # Note that we check the minimum bazel version in WORKSPACE.
  bili_http_archive(
      name = "pcre",
      sha256 = "69acbc2fbdefb955d42a4c606dfde800c2885711d2979e356c0636efde9ec3b5",
      urls = [
          "https://nchc.dl.sourceforge.net/project/pcre/pcre/8.42/pcre-8.42.tar.gz",
      ],
      strip_prefix = "pcre-8.42",
      build_file = clean_dep("//vendor:pcre.BUILD"),
  )
