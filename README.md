Ansible Configuration
=====================

This repository contains the configuration of a basic KitchenSync (TODO: working
title) instance. The aim is to keep the configuration of the device at one
place, so that all modifications are trackable and easily reproducible.

Install
-------
Log in to your Raspberry Pi, run `raspi-config`, then simply

    curl https://raw.github.com/KitchenSync/raspberry_configuration/master/install.sh |sudo sh

It's going to take a while. That's fine.

Oldschool Install
-----------------

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
 * ssh-agent having your keys enabled on the Raspberry Pi

Usage:

   ./setup  # creates the virtualenv, and installs necessary stuff
   ./deploy # runs ansible, and configures the raspberry pi

Warnings
--------

The scripts upgrade the Raspbian installation on the Raspberry Pi, and *purge*
any X-related things. If you don't want this, you should check
`tasks/packages.yml`, and delete any relevant blocks.

License
-------
Copyright (C) 2013 Peter Parkanyi me@rhapsodhy.hu

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
