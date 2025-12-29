# Audio Troubleshooting Guide

## System Configuration

- **Device:** Lenovo IdeaPad 5 Pro 14ITL6
- **Audio Codec:** Realtek ALC257
- **Platform:** Intel Tiger Lake with SOF (Sound Open Firmware)
- **Audio Stack:** PipeWire + WirePlumber

## Problem: Headset Microphone Not Working

### Symptoms
- Wired headphones (e.g., Apple EarPods with 3.5mm TRRS jack) connected
- Audio output works (you can hear sound)
- Microphone doesn't work (others can't hear you)
- Issue persists with or without external monitor

### Root Cause
The system has two microphone inputs:
- **Mic1 (Digital Microphone)** - Built-in laptop mic, uses DMIC (device 6)
- **Mic2 (Stereo Microphone)** - HDA Analog input (device 0), also used for headset mic

The headset mic works through Mic2, but:
1. Mic1 may be set as default instead of Mic2
2. Mic2 may be muted
3. Profile may not switch correctly when headphones are connected

### Diagnostic Commands

```bash
# Check if headset mic jack is detected
amixer -c 0 cget numid=11
# Should show: values=on (when headphones connected)

# Check current audio sources
wpctl status | grep -A5 "Sources"
# Look for which source has * (default)

# Check if Mic2 is muted
wpctl status | grep "Stereo Microphone"
# If shows [MUTED], it needs to be unmuted

# Test recording directly from HDA Analog (headset mic)
arecord -D plughw:0,0 -f cd -d 5 /tmp/test.wav && aplay /tmp/test.wav
```

### Quick Fixes

```bash
# 1. Set Mic2 (Stereo Microphone) as default source
# First, find the node ID:
wpctl status | grep "Stereo Microphone"
# Then set it as default (replace ID with actual number):
wpctl set-default <ID>

# 2. Unmute Mic2 if muted
wpctl set-mute <ID> 0

# 3. Set capture volume
amixer -c 0 sset 'Capture' 100%
amixer -c 0 sset 'Headset Mic Boost' 100%
```

## Configuration Files

### WirePlumber Priority Configuration

**File:** `~/.config/wireplumber/wireplumber.conf.d/51-prefer-speaker.conf`

This config sets priorities so Mic2 (headset mic) has higher priority than Mic1:

```conf
# Mic1 (Digital Microphone) - lower priority
{
  matches = [
    { node.name = "~alsa_input.*__Mic1__.*" }
  ]
  actions = {
    update-props = {
      priority.driver = 1000
      priority.session = 1000
    }
  }
}

# Mic2 (Stereo Microphone / Headset Mic) - higher priority
{
  matches = [
    { node.name = "~alsa_input.*__Mic2__.*" }
  ]
  actions = {
    update-props = {
      priority.driver = 2000
      priority.session = 2000
    }
  }
}
```

### Auto-Switch Profile (Built-in WirePlumber)

WirePlumber 0.5+ has built-in profile switching. No custom script needed.

**Key settings in** `~/.config/wireplumber/wireplumber.conf.d/51-prefer-speaker.conf`:

```conf
# Enable automatic profile and port switching
{
  matches = [
    { device.name = "alsa_card.pci-0000_00_1f.3-platform-skl_hda_dsp_generic" }
  ]
  actions = {
    update-props = {
      api.acp.auto-profile = true
      api.acp.auto-port = true
    }
  }
}
```

**Priority settings** (higher = preferred):
- HDMI outputs: 100 (lowest - won't steal audio)
- Mic1 (Digital): 1000
- Mic2 (Stereo/Headset): 2000
- Speaker: 2500
- Headphones: 3000 (highest - always preferred when connected)

## Problem: Profile Not Switching When Headphones Connected

### Symptoms
- Headphone jack detected (`amixer -c 0 cget numid=12` shows `values=on`)
- But audio still plays through speakers
- `wpctl status` shows Speaker as default, no Headphones sink

### Root Cause
The audio profile doesn't switch from Speaker to Headphones profile automatically.

### Manual Profile Switch

```bash
# Switch to Headphones profile
pactl set-card-profile 49 'HiFi (HDMI1, HDMI2, HDMI3, Headphones, Mic1, Mic2)'

# Switch back to Speaker profile
pactl set-card-profile 49 'HiFi (HDMI1, HDMI2, HDMI3, Mic1, Mic2, Speaker)'
```

### Verify Active Profile

```bash
pactl list cards | grep "Active Profile"
```

## External Monitor Considerations

When connecting an external monitor via USB-C/DisplayPort:
- HDMI audio outputs are added (HDMI1, HDMI2, HDMI3)
- The audio profile includes these HDMI outputs
- This shouldn't affect microphone functionality
- If audio routing breaks, restart WirePlumber:

```bash
systemctl --user restart wireplumber pipewire
```

## Useful Commands Reference

```bash
# Check all audio devices and status
wpctl status

# List ALSA capture devices
arecord -l

# Check available UCM devices
alsaucm -c sof-hda-dsp set _verb HiFi list _devices

# View jack states
amixer -c 0 controls | grep -i jack

# Check WirePlumber logs
journalctl --user -u wireplumber -f

# Restart audio stack
systemctl --user restart wireplumber pipewire
```

## Files Reference

| File | Purpose |
|------|---------|
| `~/.config/wireplumber/wireplumber.conf.d/51-prefer-speaker.conf` | Priority rules + auto-profile settings |
| `~/.local/state/wireplumber/default-nodes` | Saved default sink/source (auto-managed) |

## Notes

- Node IDs (like 90, 104, etc.) change between sessions - always check current IDs with `wpctl status`
- Mic2 uses the same HDA Analog device (hw:0,0) as the headphone output
- The headset mic jack detection works at ALSA level (`Headset Mic Jack` control)
