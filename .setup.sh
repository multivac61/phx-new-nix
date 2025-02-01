#!/usr/bin/env bash

mix local.hex --force
mix local.rebar --force
mix archive.install --force hex phx_new

if [ ! -d "hello" ]; then
  echo y | mix phx.new --install hello
fi

pushd hello
mix deps.get
mix ecto.create
popd
