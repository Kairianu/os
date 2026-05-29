# FFMPEG Options

## libsvtav1
### -preset
- `2` for best efficiency.
- `6` for balance.
- `12` for live streaming.

### -crf
- `18` best quality.
- `35` good balance for low quality or live streaming.
- `50` lowest reasonable quality, okay for live streaming.

### -svtav1-params
- `lossless=1` for lossless quality.
- `tune=0` for visual quality.


## Metadata
- `-map_metadata -1` remove all metadata.
- `-metadata KEY=VALUE` set metadata.
