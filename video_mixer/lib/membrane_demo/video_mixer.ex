defmodule Membrane.Demo.VideoMixer do
  @moduledoc """
  Documentation for `VideoMixer`.
  """
  use Membrane.Pipeline

  @impl true
  def handle_init({path_to_wav_1, path_to_wav_2}) do
    children = %{
      # Stream from file
      file_1: %Membrane.File.Source{location: path_to_wav_1},
      file_2: %Membrane.File.Source{location: path_to_wav_2},
      parser_1: Membrane.WAV.Parser,
      parser_2: Membrane.WAV.Parser,
      mixer: %Membrane.AudioMixer{
        caps: %Membrane.Caps.Audio.Raw{
          channels: 1,
          sample_rate: 16_000,
          format: :s16le
        }
      },
      aac_fdk: Membrane.AAC.FDK.Encoder,
      file_sink: %Membrane.File.Sink{location: "output.aac"}
    }

    # Setup the flow of the data
    links = [
      link(:file_1)
      |> to(:parser_1)
      |> to(:mixer)
      |> to(:aac_fdk)
      |> to(:file_sink),
      link(:file_2)
      |> to(:parser_2)
      |> via_in(:input, options: [offset: Membrane.Time.milliseconds(2000)])
      |> to(:mixer)
    ]

    {{:ok, spec: %ParentSpec{children: children, links: links}}, %{}}
  end
end
