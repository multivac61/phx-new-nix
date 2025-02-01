# Hello

## Bootstrap

Run `./.setup.sh` and add `{:deps_nix, "~> 2.1", only: :dev}` to `./hello/mix.exs`, run `mix deps.get` and `mix deps.nix` inside the `./hello` directory

Then try to build project using nix, like so: `nix build .#fod` and `nix build .#deps_nix`.

Both fail at runtime:

```
16:22:28.737 [error] Could not warm up static assets: could not find static manifest at "/nix/store/h42kp5hvhm0shqx9s3hawi7lknaz5x70-hello-0.1.0/lib/hello-0.1.0/priv/static/cache_manifest.json". Run 
"mix phx.digest" after building your static files or remove the "cache_static_manifest" configuration from your config files.
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
