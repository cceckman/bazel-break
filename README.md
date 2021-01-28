Running on Debian on WSL:

```
$ bazel version
Build label: 4.0.0
Build target: bazel-out/k8-opt/bin/src/main/java/com/google/devtools/build/lib/bazel/BazelServer_deploy.jar
Build time: Thu Jan 21 07:33:24 2021 (1611214404)
Build timestamp: 1611214404
Build timestamp as int: 1611214404
$ bazel build //...
Starting local Bazel server and connecting to it...
Analyzing: target //:repro (9 packages loaded, 11 targets configured)
    currently loading: @bazel_tools//tools/sh
FATAL: bazel crashed due to an internal error. Printing stack trace:
java.lang.RuntimeException: Unrecoverable error while evaluating node 'ConfiguredTargetKey{label=//:repro, config=BuildConfigurationValue.Key[86d23d2b5aedbeecfc6e6954ea9486ec39e9e40bcbc4b17cec46a06eed198d11]}' (requested by nodes )
        at com.google.devtools.build.skyframe.AbstractParallelEvaluator$Evaluate.run(AbstractParallelEvaluator.java:563)
        at com.google.devtools.build.lib.concurrent.AbstractQueueVisitor$WrappedRunnable.run(AbstractQueueVisitor.java:398)
        at java.base/java.util.concurrent.ForkJoinTask$AdaptedRunnableAction.exec(Unknown Source)
        at java.base/java.util.concurrent.ForkJoinTask.doExec(Unknown Source)
        at java.base/java.util.concurrent.ForkJoinPool$WorkQueue.topLevelExec(Unknown Source)
        at java.base/java.util.concurrent.ForkJoinPool.scan(Unknown Source)
        at java.base/java.util.concurrent.ForkJoinPool.runWorker(Unknown Source)
        at java.base/java.util.concurrent.ForkJoinWorkerThread.run(Unknown Source)
Caused by: java.lang.NullPointerException
        at com.google.devtools.build.lib.analysis.platform.ConstraintCollection.hasConstraintValue(ConstraintCollection.java:216)
        at com.google.devtools.build.lib.analysis.RuleContext.targetPlatformHasConstraint(RuleContext.java:1226)
        at com.google.devtools.build.lib.analysis.constraints.RuleContextConstraintSemantics.lambda$incompatibleConfiguredTarget$1(RuleContextConstraintSemantics.java:904)
        at java.base/java.util.stream.ReferencePipeline$2$1.accept(Unknown Source)
        at com.google.common.collect.CollectSpliterators$1.lambda$forEachRemaining$1(CollectSpliterators.java:120)
        at java.base/java.util.AbstractList$RandomAccessSpliterator.forEachRemaining(Unknown Source)
        at com.google.common.collect.CollectSpliterators$1.forEachRemaining(CollectSpliterators.java:120)
        at java.base/java.util.stream.AbstractPipeline.copyInto(Unknown Source)
        at java.base/java.util.stream.AbstractPipeline.wrapAndCopyInto(Unknown Source)
        at java.base/java.util.stream.ReduceOps$ReduceOp.evaluateSequential(Unknown Source)
        at java.base/java.util.stream.AbstractPipeline.evaluate(Unknown Source)
        at java.base/java.util.stream.ReferencePipeline.collect(Unknown Source)
        at com.google.devtools.build.lib.analysis.constraints.RuleContextConstraintSemantics.incompatibleConfiguredTarget(RuleContextConstraintSemantics.java:905)
        at com.google.devtools.build.lib.analysis.ConfiguredTargetFactory.createRule(ConfiguredTargetFactory.java:327)
        at com.google.devtools.build.lib.analysis.ConfiguredTargetFactory.createConfiguredTarget(ConfiguredTargetFactory.java:194)
        at com.google.devtools.build.lib.skyframe.SkyframeBuildView.createConfiguredTarget(SkyframeBuildView.java:938)
        at com.google.devtools.build.lib.skyframe.ConfiguredTargetFunction.createConfiguredTarget(ConfiguredTargetFunction.java:1013)
        at com.google.devtools.build.lib.skyframe.ConfiguredTargetFunction.compute(ConfiguredTargetFunction.java:371)
        at com.google.devtools.build.skyframe.AbstractParallelEvaluator$Evaluate.run(AbstractParallelEvaluator.java:477)
        ... 7 more
$ echo $?
37
```
