import pandas as pd
# don't forget to pull out the array of offers from the offerOptions array
# use some json library to validate that the file read was actually valid json
df = pd.read_json('/Users/elee/Desktop/consumers_offers_backup_20211207.json')
#df_normalized = pd.json_normalize(df, max_level = 3)
export_csv = df.to_csv('/Users/elee/Desktop/consumers_pq_offers.csv', index = None)

