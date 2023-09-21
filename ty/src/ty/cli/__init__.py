from typing import List
from types import ModuleType
import pkgutil
import importlib
import inspect
import os

import click
from click import Command, Group


def get_commands(module: ModuleType) -> List[Command]:
    return [
        cmd for _, cmd in inspect.getmembers(module, lambda o: isinstance(o, Command))
    ]


def import_commands(path: str, package: str) -> List[Command]:
    commands: List[Command] = []
    for _, name, is_pkg in pkgutil.iter_modules([path]):
        if is_pkg:
            subcommands = import_commands(os.path.join(path, name), f'{package}.{name}')
            commands.append(Group(name, commands=subcommands))
        else:
            module = importlib.import_module(f'.{name}', package=package)
            commands.extend(get_commands(module))
    return commands


CONTEXT_SETTINGS = dict(help_option_names=['-h', '--help'])


@click.group(context_settings=CONTEXT_SETTINGS)
def main():
    pass


commands_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "commands")
for command in import_commands(commands_dir, 'ty.cli.commands'):
    main.add_command(command)
