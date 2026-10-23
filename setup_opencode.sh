#!/usr/bin/env bash
#
# OpenCode setup script
#

# Install plannotator for plan mode interraction
curl -fsSL https://plannotator.ai/install.sh | bash

# Plugin to use Meridian for Claude interraction in OpenCode
# See https://github.com/ianjwhite99/opencode-with-claude
npm install -g opencode-with-claude
