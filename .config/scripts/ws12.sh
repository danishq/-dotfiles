#!/bin/bash

i3-msg "workspace 12; layout splitv"
i3-msg "exec kitty"
sleep 0.2
i3-msg "split h"
i3-msg "exec kitty"
sleep 0.2
i3-msg "split v"
i3-msg "exec kitty"
sleep 0.2
i3-msg "split h"
i3-msg "exec kitty"
