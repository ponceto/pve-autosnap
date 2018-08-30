# Simple Proxmox VE automatic snapshot

## Description

`pve-autosnap` is an utility script for Proxmox VE hypervisor that help to perform
automatic snapshots with rolling snapshot feature.

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

Example to perform automatic snapshot at minute 0 each hour and keep only one snapshot:

```
0 * * * * /usr/local/bin/pve-autosnap all 1 2>&1 | logger -t autosnap
```

Example to perform automatic snapshot at minute 0 every 4h and keep only one snapshot:

```
0 */4 * * * /usr/local/bin/pve-autosnap all 1 2>&1 | logger -t autosnap
```

## License

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
