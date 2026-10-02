# MultiJob System

Manage multiple jobs in FiveM with ease.

## Features

- Add multiple jobs to a player's profile
- Remove jobs from a player's profile
- Switch between multiple jobs
- Configurable job list and maximum jobs per player

## Requirements

- FiveM server
- ESX framework
- MySQL database

## Installation

1. Download the script and place it in your FiveM server's `resources` directory.
2. Import the `database.sql` file into your MySQL database.
3. Add `start multijobsystem` to your `server.cfg` file.

## Usage

### Commands

- `/addjob [job]` - Add a job to your profile
- `/removejob [job]` - Remove a job from your profile
- `/switchjob [job]` - Switch to a job

### Permissions

- Players can manage their own jobs
- Admins can configure the job list and maximum jobs per player

## Configuration

Edit the `config.lua` file to customize the job list and maximum jobs per player.

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=multijob-system&utm_content=bottom) — describe it in one sentence and get the full source code.
