import pyexasol
from config import config_Exasol as ce
import os

C = pyexasol.connect(
    dsn=ce.dsn, #connection_string
    user=ce.user,  # user
    password=ce.password # password
    )

def executeScriptsFromFile(filename):
    # Open and read the file as a single buffer
    fd = open(filename, 'r')
    sqlFile = fd.read()
    fd.close()

    # all SQL commands (split on ';')
    # Final sql statement must not include a semicolon or it will error due to the split
    sqlCommands = sqlFile.split(';')

    # Execute every command from the input file
    for command in sqlCommands:
        # This will skip and report errors
        try:
            print(filename + ': ' + command)
            C.execute(command)
        except:
            pass;


if __name__ == '__main__':

    # list of SQL files to execute
    sql_files  = [
        'xdw_Person_Import.sql',
        'xdw_Applications_Import.sql',
        'xdw_Applications_GRAD_Subplans_Import.sql'
    ]

    # run each sql import file
    for sql_file in sql_files:
        executeScriptsFromFile(sql_file)
