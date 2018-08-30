# Automatic snapshot for Proxmox VE

## Description

`pve-autosnap` is a utility script for the Proxmox VE hypervisor that allows
automatic snapshots with a rotating snapshot feature.

## Installation

Just copy the script in a well-known directory, like `/usr/local/bin`, and
adjust the permissions if needed with a simple `chmod 755 pve-autosnap`.

## Usage

*Usage*: `pve-autosnap [ help | vmid [ keep ] ]`

*Options:*

  - `help`	display help and exit
  - `vmid`	specifies the virtual machine id, can be `all`
  - `keep`	specifies the maximum number of snapshot to keep (default is 1)

## Automated snapshots

To add a periodic task to perform automated snapshots, just edit your crontab.

It is recommended to redirect stderr to stdout and pipe the result to the `logger`
utility in order to send the resulting logs to the syslog service.

Example:

```crontab
# automatic snapshot for vmid #100, every 30m, and keep the last 3 snapshots
*/30 * * * * /usr/local/bin/pve-autosnap 100 3 2>&1 | logger -t autosnap
```

Another example:

```crontab
# automatic snapshot for all vm, at minute 0, every 1h, and keep the last 2 snapshots
0 * * * * /usr/local/bin/pve-autosnap all 2 2>&1 | logger -t autosnap
```

Yet another example:

```crontab
# automatic snapshot for all vm, at minute 5, every 4h, and keep the last 1 snapshot
5 */4 * * * /usr/local/bin/pve-autosnap all 1 2>&1 | logger -t autosnap
```

## License

`pve-autosnap` is released under the terms of the GNU General Public License v2.

```
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>
```
