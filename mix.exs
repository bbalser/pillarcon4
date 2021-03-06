defmodule Pillarcon.MixProject do
  use Mix.Project

  def project do
    [
      app: :pillarcon,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Pillarcon.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:placebo, "~> 1.2", only: [:dev, :text]},
      {:checkov, "~> 0.4.0", only: :test}
    ]
  end
end
