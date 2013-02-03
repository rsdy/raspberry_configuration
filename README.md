Ansible Configuration
=====================

This repository contains the configuration of a basic KitchenSync (TODO: working
title) instance. The aim is to keep the configuration of the device at one
place, so that all modifications are trackable and easily reproducible.

How-To
------

The following things are expected to be done on the Raspberry Pi:

 * running the latest version of Raspbian
 * the hostname is `raspberrypi`. You may change this in the host file `./hosts`
 * `raspi-config`:
   - allocate as much memory to the CPU as you can
   - ssh is enabled
   - root *may* be expanded to the size of the sd card.
   - overclocking *may* be useful, too
 * your public key is accepted by the `pi` user
   - `ssh-copy-id pi@raspberrypi` may help
 * it is advised that the root fs be expanded

You need the following things on the host that runs these scripts:
 * ksh, for running the scripts in the root of this repo
 * python, python-dev, virtualenv, pip
 * pycrypto will be compiled, dependencies may arise

Usage:

 ./setup  # creates the virtualenv, and installs necessary stuff
 ./deploy # runs ansible, and configures the raspberry pi

Warnings
--------

The scripts upgrade the Raspbian installation on the Raspberry Pi, and *purge*
any X-related things. If you don't want this, you should check
`tasks/packages.yml`, and delete any relevant blocks.
