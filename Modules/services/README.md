# Services module

Keep reusable service definitions here, ideally one file per service (for example,
`openssh.nix`, `nginx.nix`, or `monitoring.nix`). Service modules should expose
clear options, use secret files supplied by the host, and avoid embedding credentials
or environment-specific domains.
