"""Demonstration of a Bazel issue."""

def _my_little_rule_impl(ctx):
    output = ctx.actions.declare_file(ctx.label.name + ".out")
    ctx.actions.write(output, ctx.label.name + "was run")

my_little_rule = rule(
    implementation = _my_little_rule_impl,
)
