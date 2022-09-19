defmodule Membrane.Demo.RtpToHls.MixProject do
  use Mix.Project

  def project do
    [
      app: :membrane_demo_rtp_to_hls,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Membrane.Demo.RtpToHls, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:membrane_core, "~> 0.10"},
      {:membrane_udp_plugin, "~> 0.8"},
      {:membrane_file_plugin, "~> 0.12"},
      {:membrane_h264_ffmpeg_plugin, "~> 0.21"},
      {:membrane_http_adaptive_stream_plugin, "~> 0.8"},
      {:membrane_aac_format, "~> 0.7"},
      {:membrane_mp4_plugin, "~> 0.16.2"},
      {:membrane_rtp_aac_plugin, "~> 0.6"},
      {:membrane_rtp_plugin, "~> 0.14"},
      {:membrane_rtp_h264_plugin, "~> 0.13"},
      {:membrane_tee_plugin, "~> 0.9"},
      {:membrane_fake_plugin, "~> 0.8"},
      {:membrane_aac_plugin, "~> 0.12"},
      {:ex_libsrtp, "~> 0.4"},
      {:membrane_rtp_format, "~> 0.5.0"}
    ]
  end
end
