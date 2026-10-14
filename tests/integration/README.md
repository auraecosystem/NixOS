# Integration tests

Integration tests that boot a VM, exercise services, or require elevated container
features belong here. Keep ordinary module evaluation in `tests/evaluation/`.

Tests that require KVM, privileged mounts, cgroups, or special runner features must be
clearly marked and run only on compatible self-hosted runners. Do not make a normal
GitHub-hosted CI job depend on unavailable host capabilities.
