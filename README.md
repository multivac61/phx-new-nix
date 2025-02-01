# Hello

## Bootstrap

Run `./.setup.sh` and add `{:deps_nix, "~> 2.1", only: :dev}` to `./hello/mix.exs`, run `mix deps.get` and `mix deps.nix` inside the `./hello` directory

Then try to build project using nix, like so: `nix build .#fod` and `nix build .#deps_nix`.

Both fail with an error something like...

```
bash: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
Running phase: unpackPhase
@nix { "action": "setPhase", "phase": "unpackPhase" }
unpacking source archive /nix/store/gyr9hr1hfvjx0gp9vbxb5gl4mgj5iy1h-hello
source root is hello
Running phase: patchPhase
@nix { "action": "setPhase", "phase": "patchPhase" }
Running phase: updateAutotoolsGnuConfigScriptsPhase
@nix { "action": "setPhase", "phase": "updateAutotoolsGnuConfigScriptsPhase" }
Running phase: configurePhase
@nix { "action": "setPhase", "phase": "configurePhase" }
bash: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
/nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/bash: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
/nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/sh: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
/nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/bash: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
/nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/sh: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
==> decimal
Compiling 4 files (.ex)
Generated decimal app
==> mime
Compiling 1 file (.ex)
Generated mime app
==> nimble_options
Compiling 3 files (.ex)
Generated nimble_options app
==> hello
/nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/bash: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
/nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/sh: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
===> Expanded command sequence to be run: []
===> Running provider: do
===> Expanded command sequence to be run: [app_discovery,{bare,compile}]
===> Running provider: app_discovery
===> Found top-level apps: [telemetry]
	using config: [{src_dirs,["src"]},{lib_dirs,["apps/*","lib/*","."]}]
===> Running provider: {bare,compile}
===> Compile (untagged)
===> Running hooks for compile in app telemetry (/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry) with configuration:
===> 	{pre_hooks, []}.
===> Running hooks for erlc_compile in app telemetry (/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry) with configuration:
===> 	{pre_hooks, []}.
===> Analyzing applications...
===> Compiling telemetry
===> compile options: {erl_opts, [debug_info]}.
===> files to analyze ["/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry/src/telemetry_sup.erl",
                       "/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry/src/telemetry_app.erl",
                       "/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry/src/telemetry_handler_table.erl",
                       "/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry/src/telemetry.erl",
                       "/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry/src/telemetry_test.erl"]
===>      Compiled telemetry_app.erl
===>      Compiled telemetry_test.erl
===>      Compiled telemetry_sup.erl
===>      Compiled telemetry_handler_table.erl
===>      Compiled telemetry.erl
===> Running hooks for erlc_compile in app telemetry (/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry) with configuration:
===> 	{post_hooks, []}.
===> Running hooks for app_compile in app telemetry (/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry) with configuration:
===> 	{pre_hooks, []}.
===> Running hooks for app_compile in app telemetry (/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry) with configuration:
===> 	{post_hooks, []}.
===> Running hooks for compile in app telemetry (/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry) with configuration:
===> 	{post_hooks, []}.
==> telemetry_metrics
Compiling 7 files (.ex)
Generated telemetry_metrics app
==> hello
/nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/bash: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
/nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/sh: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
===> Expanded command sequence to be run: []
===> Running provider: do
===> Expanded command sequence to be run: [app_discovery,{bare,compile}]
===> Running provider: app_discovery
===> Found top-level apps: [telemetry_poller]
	using config: [{src_dirs,["src"]},{lib_dirs,["apps/*","lib/*","."]}]
===> Running provider: {bare,compile}
===> Compile (untagged)
===> Running hooks for compile in app telemetry_poller (/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry_poller) with configuration:
===> 	{pre_hooks, []}.
===> Running hooks for erlc_compile in app telemetry_poller (/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry_poller) with configuration:
===> 	{pre_hooks, []}.
===> Analyzing applications...
===> Compiling telemetry_poller
===> compile options: {erl_opts, [debug_info]}.
===> files to analyze ["/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry_poller/src/telemetry_poller_sup.erl",
                       "/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry_poller/src/telemetry_poller_app.erl",
                       "/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry_poller/src/telemetry_poller.erl",
                       "/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry_poller/src/telemetry_poller_builtin.erl"]
===>      Compiled telemetry_poller_sup.erl
===>      Compiled telemetry_poller_app.erl
===>      Compiled telemetry_poller_builtin.erl
===>      Compiled telemetry_poller.erl
===> Running hooks for erlc_compile in app telemetry_poller (/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry_poller) with configuration:
===> 	{post_hooks, []}.
===> Running hooks for app_compile in app telemetry_poller (/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry_poller) with configuration:
===> 	{pre_hooks, []}.
===> Running hooks for app_compile in app telemetry_poller (/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry_poller) with configuration:
===> 	{post_hooks, []}.
===> Running hooks for compile in app telemetry_poller (/private/tmp/nix-build-hello-0.1.0.drv-0/deps/telemetry_poller) with configuration:
===> 	{post_hooks, []}.
==> thousand_island
Compiling 16 files (.ex)
Generated thousand_island app
==> jason
Compiling 10 files (.ex)
Generated jason app
==> phoenix_html
Compiling 6 files (.ex)
Generated phoenix_html app
==> phoenix_template
Compiling 4 files (.ex)
Generated phoenix_template app
==> db_connection
Compiling 17 files (.ex)
Generated db_connection app
==> expo
Compiling 2 files (.erl)
Compiling 22 files (.ex)
Generated expo app
==> phoenix_pubsub
Compiling 11 files (.ex)
Generated phoenix_pubsub app
==> plug_crypto
Compiling 5 files (.ex)
Generated plug_crypto app
==> hpax
Compiling 4 files (.ex)
Generated hpax app
==> dns_cluster
Compiling 1 file (.ex)
Generated dns_cluster app
==> gettext
Compiling 18 files (.ex)
Generated gettext app
==> ecto
Compiling 56 files (.ex)
Generated ecto app
==> plug
Compiling 1 file (.erl)
Compiling 40 files (.ex)
Generated plug app
==> postgrex
Compiling 68 files (.ex)
Generated postgrex app
==> ecto_sql
Compiling 25 files (.ex)
Generated ecto_sql app
==> nimble_pool
Compiling 2 files (.ex)
Generated nimble_pool app
==> castore
Compiling 1 file (.ex)
Generated castore app
==> esbuild
Compiling 4 files (.ex)
Generated esbuild app
==> tailwind
Compiling 3 files (.ex)
Generated tailwind app
==> mint
Compiling 1 file (.erl)
Compiling 20 files (.ex)
Generated mint app
==> finch
Compiling 14 files (.ex)
Generated finch app
==> websock
Compiling 1 file (.ex)
Generated websock app
==> bandit
Compiling 54 files (.ex)
Generated bandit app
==> swoosh
Compiling 51 files (.ex)
Generated swoosh app
==> websock_adapter
Compiling 4 files (.ex)
Generated websock_adapter app
==> phoenix
Compiling 71 files (.ex)
Generated phoenix app
==> phoenix_live_view
Compiling 39 files (.ex)
Generated phoenix_live_view app
==> phoenix_live_dashboard
Compiling 36 files (.ex)
Generated phoenix_live_dashboard app
==> phoenix_ecto
Compiling 7 files (.ex)
Generated phoenix_ecto app
Running phase: buildPhase
@nix { "action": "setPhase", "phase": "buildPhase" }
/nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/bash: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
/nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/sh: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
/nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/bash: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
/nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/sh: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
Compiling 15 files (.ex)
Generated hello app
Running phase: installPhase
@nix { "action": "setPhase", "phase": "installPhase" }
/nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/bash: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
/nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/sh: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
/nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/bash: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
/nix/store/iv1k5wr7hbxm51qmdn6l2inq7rd2vfhk-bash-5.2p37/bin/sh: warning: setlocale: LC_ALL: cannot change locale (C.UTF-8): No such file or directory
[31m[1mUnchecked dependencies for environment prod:[0m
[31m[1m* heroicons (https://github.com/tailwindlabs/heroicons.git - v2.1.1)[0m
[31m[1m  lock mismatch: the dependency is out of date. To fetch locked version run "mix deps.get"[0m
[31m[1m** (Mix) Can't continue due to errors on dependencies[0m
```


Adding something like to the `pkgs.beamPackages.mixRelease`..

```
preInstall = ''
  ln -s ${tailwindcss}/bin/tailwindcss _build/tailwind-${translatedPlatform}
  ln -s ${esbuild}/bin/esbuild _build/esbuild-${translatedPlatform}

  ${elixir}/bin/mix assets.deploy
  ${elixir}/bin/mix phx.gen.release
'';
```

Fails with error

```
> Unchecked dependencies for environment prod:
> * heroicons (https://github.com/tailwindlabs/heroicons.git - v2.1.1)
>   lock mismatch: the dependency is out of date. To fetch locked version run "mix deps.get"
> ** (Mix) Can't continue due to errors on dependencies

```



---

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
