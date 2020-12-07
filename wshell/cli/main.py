#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: wxnacy(wxnacy@gmail.com)
# Description:

import sys

import os
import click

CONFIG_DIR = os.path.expanduser('~/.config/wshell')
PLUGIN_DIR = os.path.join(CONFIG_DIR, 'plugins')
sys.path.append(PLUGIN_DIR)
#  plugin_folder = os.path.join(CONFIG_DIR, 'plugins', 'wshell-otp')
#  print(plugin_folder)


class MyCLI(click.MultiCommand):

    def list_commands(self, ctx):
        rv = []
        for _, _, names in os.walk(PLUGIN_DIR):
            for name in names:
                if name.startswith('wshell') and  name.endswith('.py'):
                    rv.append(self._split_cmd_name(name))
        rv.sort()
        return rv

    def _split_cmd_name(self, filename):
        return filename[7:-3]

    def _join_filename(self, cmdname):
        return 'wshell-{}/wshell-{}.py'.format(cmdname, cmdname)

    def get_command(self, ctx, name):
        ns = {}
        fn = os.path.join(PLUGIN_DIR, self._join_filename(name))
        with open(fn) as f:
            code = compile(f.read(), fn, 'exec')
            eval(code, ns, ns)
        return ns['cli']

#  cli = MyCLI(help='This tool\'s subcommands are loaded from a '
            #  'plugin folder dynamically.')

@click.group(cls=MyCLI, invoke_without_command=True)
@click.pass_context
def cli(ctx):
    if ctx.invoked_subcommand is None:
        click.echo('I was invoked without subcommand')
    else:
        sys.path.append(os.path.join(PLUGIN_DIR, 'wshell-opt'))
        click.echo('I am about to invoke %s' % ctx.invoked_subcommand)
    pass
if __name__ == '__main__':
    cli()
