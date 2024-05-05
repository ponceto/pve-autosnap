# AUTOMATIC SNAPSHOTS FOR PROXMOX VE

## ABSTRACT

`pve-autosnap` is a utility script for the [Proxmox VE](https://www.proxmox.com) hypervisor that allows to perform automatic snapshots with a rotating snapshot feature.

## DESCRIPTION

This script will help you to perform automatic rotated snapshots.

## INSTALLATION

Clone the repository in the `/opt/pve-autosnap` directory on your PVE node:

```
git clone {repository-url} /opt/pve-autosnap
```

Then create a symbolic link into the `/usr/local/bin` directory:

```
cd /usr/local/bin
ln -sf ../../../opt/pve-autosnap/bin/pve-autosnap ./pve-autosnap
```

## USAGE

```
Usage: pve-autosnap [ help | <vmid> [ <keep> [OPTIONS] ] ]

Arguments:

    help   display this help and exit
    vmid   specifies the virtual machine id, can be 'all' or 'none'
    keep   specifies the maximum number of snapshot to keep (default is 1)

Options:

    --minvmid={vmid}            specifies the first vmid (default is 100)
    --maxvmid={vmid}            specifies the last vmid (default is 9999)
    --exclude={vmid,vmid,...}   specifies the list of vmid to exclude
    --include={vmid,vmid,...}   specifies the list of vmid to include
    --tag={tag}                 specifies an optional snapshot tag (snapshots will be named "AUTOSNAP_{tag}_YYYYMMDD_HHMMSS")

PVE options:

    --kvm-manager={path}        specifies the KVM manager ('/usr/sbin/qm')
    --lxc-manager={path}        specifies the LXC manager ('/usr/sbin/pct')

Special options:

    --help                      display this help and exit
    --debug[={yes|no}]          enable/disable the debug mode
```

## EXAMPLES

Perform a snapshot for the vmid #500 and keep one snapshot

```
pve-autosnap 500
```

Perform a snapshot for the vmid #750 and keep two snapshots

```
pve-autosnap 750 2
```

Perform a snapshot for each vmid and keep one snapshot

```
pve-autosnap all
```

Perform a snapshot for each vmid and keep two snapshots

```
pve-autosnap all 2
```

Perform a snapshot for each vmid but the #150 and #300 and keep one snapshot

```
pve-autosnap all 1 --exclude=150,300
```

Perform a snapshot just for vmid #200 and #250 and keep two snapshots

```
pve-autosnap none 2 --include=200,250
```

Perform a snapshot for each vmid between #1000 and #1999 but the #1500 and keep two snapshots

```
pve-autosnap all 2 --minvmid=1000 --maxvmid=1999 --exclude=1500
```

Perform a snapshot for each vmid from #1000 and keep three snapshots

```
pve-autosnap all 3 --minvmid=1000
```

Perform a snapshot for each vmid to #1999 and keep three snapshots

```
pve-autosnap all 3 --maxvmid=1999
```

Perform no snapshot and clean all snapshot for each vmid

```
pve-autosnap all 0
```

Perform no snapshot and clean all snapshot for vmid #500

```
pve-autosnap 500 0
```

## AUTOMATED SNAPSHOTS

To add a periodic task to perform automated snapshots, just edit your crontab.

It is recommended to redirect `stderr` to `stdout` and pipe the result to the
`logger` utility in order to send the resulting logs to the local syslog service.

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

## TAGGING SNAPSHOTS

Snapshot tagging will allow you to create multiple cron jobs with differents rules, for example hourly, daily, weekly and monthly snapshots:

Example for 48 hourly snapshots:

```crontab
0 * * * * /usr/local/bin/pve-autosnap all 48 --tag=HOURLY 2>&1 | logger -t autosnap-hourly
```

Example for 30 daily snapshots:

```crontab
0 0 * * * /usr/local/bin/pve-autosnap all 30 --tag=DAILY 2>&1 | logger -t autosnap-daily
```

Example for 3 monthly snapshots:

```crontab
0 0 1 * * /usr/local/bin/pve-autosnap all 3 --tag=MONTHLY 2>&1 | logger -t autosnap-monthly
```

## LICENSE

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

Please read the `COPYING.md` file for more informations.
