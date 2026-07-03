rule = {
  matches = {
    {
      { "application.process.binary", "equals", "Discord" },
      { "application.name", "equals", "Chromium" },
      { "media.name", "equals", "Playback" }
    }
  },
  apply_properties = {
    ["stream.restore.prohibit"] = true,
    ["node.pause-on-idle"] = false,
    ["volume"] = 0.30
  }
}
