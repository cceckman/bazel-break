This was, ultimately, https://github.com/bazelbuild/bazel/issues/12532.

I realized after playing with it some more that `target_compatible_with` takes
`constraint_settings`, not `platform`s - and that I got the above issue when I
passed in `platform`s. Using the right type seems to do the trick.
