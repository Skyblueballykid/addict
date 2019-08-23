defmodule Addict.Mixfile do
  use Mix.Project

  def project do
    [app: :addict,
     version: "0.3.1",
     elixir: "~> 1.5",
     description: description,
     package: package,
     docs: &docs/0,
     deps: deps]
  end

  def application do
    [applications: applications(Mix.env)]
  end

  defp applications(:test) do
    [:plug] ++ applications(:prod)
  end

  defp applications(_) do
    [:phoenix, :ecto, :comeonin, :mailgun, :logger, :crypto]
  end

  defp deps do
    [{:cowboy, "~> 1.0"},
     {:ecto, "~> 3.0"},
     {:phoenix_ecto, "~> 4.0"},
     {:ecto_sql, "~> 3.0"},
     {:comeonin, "~> 5.1.2" },
     {:mailgun, "~> 0.1"},
     {:mock, "~> 0.1.3", only: :test},
     {:postgrex, "~> 0.14", only: :test},
     {:earmark, "~> 0.2", only: :dev},
     {:ex_doc, "~> 0.11", only: :dev},
    {:bcrypt_elixir, "~>2.0.0"}]
  end

  defp package do
    [
         files: ["lib", "boilerplate", "docs", "mix.exs", "README*", "LICENSE*", "configs*"],
         contributors: ["Nizar Venturini"],
         maintainers: ["Nizar Venturini"],
         licenses: ["MIT"],
         links: %{"GitHub" => "https://github.com/Skyblueballykid/addict"}
    ]
  end

  defp description do
    """
    Addict allows you to manage users on your Phoenix app easily. Register, login,
    logout, recover password and password updating is available off-the-shelf.
    """
  end

  defp docs do
    {ref, 0} = System.cmd("git", ["rev-parse", "--verify", "--quiet", "HEAD"])
    [source_ref: ref,
     main: "readme",
     extras: ["README.md","configs.md"]]
    end
end
