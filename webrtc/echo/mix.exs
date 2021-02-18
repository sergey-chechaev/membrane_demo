defmodule Echo.MixProject do
  use Mix.Project

  def project do
    [
      app: :echo_demo,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Membrane.Echo.App, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:membrane_core, "~> 0.6.1", override: true},
      {:membrane_file_plugin, "~> 0.5.0"},
      {:membrane_hackney_plugin, "~> 0.4.0"},
      {:websockex, "~> 0.4.2"},
      {:poison, "~> 3.1"},
      {:membrane_realtimer_plugin, "~> 0.1.1"},
      {:membrane_funnel_plugin, "~> 0.1.0"},
      {:membrane_ivf_plugin, github: "membraneframework/membrane_ivf_plugin", branch: "deserializer"},
      {:membrane_rtp_vp8_plugin, github: "membraneframework/membrane_rtp_vp8_plugin", branch: "advanced-payloader"},
      {:ex_sdp, github: "membraneframework/ex_sdp", branch: "webrtc-plugin"},
      {:membrane_webrtc_plugin,
       github: "membraneframework/membrane_webrtc_plugin", branch: "old-develop"},
      {:membrane_dtls_plugin, "0.2.0"},
      {:membrane_rtp_plugin, github: "membraneframework/membrane_rtp_plugin", branch: "get-functions-fix", override: true},
      {:ex_libsrtp, "~> 0.1.0"},
      {:membrane_rtp_opus_plugin, "~> 0.2.0"},
      {:membrane_opus_plugin, "~> 0.2.1"},
      {:plug_cowboy, "~> 2.0"},
      {:membrane_element_tee, "~> 0.3.0"}
    ]
  end
end
