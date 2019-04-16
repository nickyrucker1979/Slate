import pyexasol
from config import config_Exasol as ce

C = pyexasol.connect(
    dsn=ce.dsn, #connection_string
    user=ce.user,  # user
    password=ce.password # password
    )

df = C.export_to_pandas("""
    select * from SLATE_DATA_STG.APPLICATIONS
    limit 10
 """)

print(df)
